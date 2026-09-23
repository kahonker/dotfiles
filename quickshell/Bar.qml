import Quickshell

Scope {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: root
            required property var modelData
            screen: modelData

            color: "transparent"
            anchors {
                top: true
                left: true
                right: true
            }
            margins {
                top: 5
                left: 5
                right: 5
                bottom: 5
            }

            implicitHeight: 30

            WorkspaceViewer {
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                    verticalCenter: root.verticalCenter
                }
                screen: root.screen.name
            }

            Clock {
                anchors {
                    right: parent.right
                    rightMargin: 10
                    verticalCenter: parent.verticalCenter
                }

                font.pointSize: 13
            }
        }
    }
}
