#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    float time;
    float zoom;
    float cornerRadius;
    vec2 resolution;
    vec4 colorA;
    vec4 colorB;
    vec4 colorC;
    vec4 colorD;
} ubuf;

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    f *= f * (3.0 - 2.0 * f);

    return mix(
        mix(hash(i), hash(i + vec2(1.0, 0.0)), f.x),
        mix(hash(i + vec2(0.0, 1.0)), hash(i + vec2(1.0, 1.0)), f.x),
        f.y
    );
}

float fbm(vec2 p) {
    float value = 0.0;
    float amplitude = 0.55;

    // Keep the field low-frequency so it forms broad, liquid-like regions
    // instead of the small turbulent pockets produced by high-octave noise.
    for (int i = 0; i < 3; i++) {
        value += amplitude * noise(p);
        p = p * 1.9 + vec2(17.3, 11.7);
        amplitude *= 0.45;
    }

    return value / 0.7975;
}

float liquidField(vec2 uv, vec2 flowA, vec2 flowB) {
    vec2 warpedUv = uv * 1.35 + flowA;
    vec2 warp = vec2(
        fbm(warpedUv + flowB),
        fbm(warpedUv + vec2(7.1, 2.6) - flowB)
    );

    // A restrained domain warp bends the boundaries without breaking them
    // into the wispy, gaseous shapes of the previous field.
    return fbm(warpedUv + (warp - 0.5) * 1.15);
}

float roundedBox(vec2 p, vec2 halfSize, float radius) {
    vec2 q = abs(p) - halfSize + radius;
    return length(max(q, vec2(0.0))) + min(max(q.x, q.y), 0.0) - radius;
}

void main() {
    float shortSide = min(ubuf.resolution.x, ubuf.resolution.y);
    vec2 uv = (qt_TexCoord0 - 0.5) * ubuf.resolution / shortSide;
    uv = uv / ubuf.zoom + 0.5;
    float phase = ubuf.time * 6.28318530718;
    vec2 flowA = vec2(cos(phase), sin(phase)) * 0.32;
    vec2 flowB = vec2(cos(phase * 2.0), sin(phase * 2.0)) * 0.16;
    float n = liquidField(uv, flowA, flowB);

    vec3 result = mix(
        ubuf.colorA.rgb,
        ubuf.colorB.rgb,
        smoothstep(0.18, 0.42, n)
    );
    result = mix(
        result,
        ubuf.colorC.rgb,
        smoothstep(0.38, 0.64, n)
    );
    result = mix(
        result,
        ubuf.colorD.rgb,
        smoothstep(0.60, 0.84, n)
    );

    vec2 pixel = qt_TexCoord0 * ubuf.resolution;
    vec2 halfSize = ubuf.resolution * 0.5 - vec2(0.5);
    vec2 center = ubuf.resolution * 0.5;
    float distance = roundedBox(
        pixel - center,
        halfSize,
        min(ubuf.cornerRadius, min(halfSize.x, halfSize.y))
    );

    float edge = fwidth(distance);
    float alpha = 1.0 - smoothstep(0.0, edge, distance);

    float finalAlpha = alpha * ubuf.qt_Opacity;
    fragColor = vec4(result * finalAlpha, finalAlpha);
}
