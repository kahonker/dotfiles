pragma Singleton

import QtQuick
import Quickshell
import Niri

Singleton {
    id: root
    readonly property WorkspaceModel workspaces: niri.workspaces

    Niri {
        id: niri
        Component.onCompleted: connect()

        onConnected: console.log("Connected to niri")
        onErrorOccurred: function (error) {
            console.error("Connection error:", error);
        }
    }
}
