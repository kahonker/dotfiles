import QtQuick
import Quickshell.Services.Pipewire

Text {
    property PwNode audioSink: Pipewire.defaultAudioSink

    PwObjectTracker {
        objects: [audioSink]
    }

    property int volume: audioSink !== null && Math.round(audioSink.audio.volume * 100)
    property bool muted: audioSink !== null && audioSink.audio.muted

    text: {
        if (audioSink === null || muted)
            return Icons.nf_fa_volume_muted;
        else if (volume === 0)
            return Icons.nf_fa_volume_off;
        else if (volume <= 33)
            return Icons.nf_fa_volume_33;
        else if (volume <= 66)
            return Icons.nf_fa_volume_66;
        else
            return Icons.nf_fa_volume_100;
    }
}
