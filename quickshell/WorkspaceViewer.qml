import QtQuick
import Quickshell
import Quickshell.Widgets

Item {
    WrapperRectangle {
        margin: 3
        color: "lightblue"
        radius: height

        Row {
            id: workspacesRow
            anchors.centerIn: parent
            spacing: 5

            Repeater {
                id: workspaces
                model: Niri.workspaces

                delegate: Rectangle {
                    id: workspace
                    width: 15
                    height: width
                    radius: width / 2
                    color: "lightgray"

                    required property int index
                    required property bool isActive

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            Quickshell.execDetached(["niri", "msg", "action", "focus-workspace", index]);
                        }
                    }

                    onIsActiveChanged: {
                        if (isActive) {
                            workspaceIndicator.activeRectangle = workspace;
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: workspaceIndicator
        property Rectangle activeRectangle: null

        x: activeRectangle ? workspacesRow.x + activeRectangle.x : 0
        y: activeRectangle ? workspacesRow.y + activeRectangle.y : 0
        width: activeRectangle ? activeRectangle.width : 0
        height: activeRectangle ? activeRectangle.height : 0
        radius: height / 2

        color: "darkgreen"

        Behavior on x {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutExpo
            }
        }
    }
}
