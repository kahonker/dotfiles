import QtQuick

ShaderEffect {
    property color colorA: Colors.color8
    property color colorB: Colors.color9
    property color colorC: Colors.color11
    property color colorD: Colors.color12

    property real time: 0.0
    property real zoom: 1.0
    property real cornerRadius: 0.0
    property vector2d resolution: Qt.vector2d(width, height)

    anchors.fill: parent
    anchors.margins: 1

    vertexShader: Qt.resolvedUrl("liquid.vert.qsb")
    fragmentShader: Qt.resolvedUrl("liquid.frag.qsb")

    NumberAnimation on time {
        from: 0
        to: 1
        duration: 86000
        loops: Animation.Infinite
        running: true
    }
}
