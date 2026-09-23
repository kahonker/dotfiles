pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Widgets

Item {
    id: root
    implicitWidth: workspacesWrapper.width
    readonly property int dotSize: 15
    required property string screen

    SortFilterProxyModel {
        id: filteredWorkspaces
        model: Niri.workspaces

        filters: [
            ValueFilter {
                roleName: "output"
                value: root.screen
            }
        ]
    }

    WrapperRectangle {
        id: workspacesWrapper
        margin: 7.5
        color: Colors.color0
        radius: 7.5
        height: parent.height

        Row {
            id: workspacesRow
            spacing: root.dotSize / 3

            Repeater {
                id: workspaces
                model: filteredWorkspaces

                delegate: Rectangle {
                    id: workspace
                    width: root.dotSize
                    height: width
                    radius: width / 2
                    color: mouseArea.containsMouse ? Colors.color12 : Colors.color5

                    required property int index
                    required property bool isActive
                    required property bool isFocused

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        enabled: !workspace.isActive
                        onClicked: {
                            Quickshell.execDetached(["niri", "msg", "action", "focus-workspace", index]);
                        }
                        hoverEnabled: true
                    }

                    onIsActiveChanged: {
                        if (isActive) {
                            workspaceIndicator.activeRectangle = workspace;
                        }
                    }

                    Behavior on color {
                        ColorAnimation {
                            duration: 200
                            easing.type: Easing.Linear
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: workspaceIndicator
        property Rectangle activeRectangle: null
        x: activeRectangle ? workspacesRow.x + activeRectangle.x - 1 : 0
        y: activeRectangle ? workspacesRow.y + activeRectangle.y - 1 : 0
        width: root.dotSize + 2
        height: width
        radius: height / 2

        color: activeRectangle && activeRectangle.isFocused ? Colors.color8 : Colors.color11

        Behavior on x {
            NumberAnimation {
                duration: 200
                easing.type: Easing.InOutExpo
            }
        }
    }
}
