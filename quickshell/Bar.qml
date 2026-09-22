import Quickshell

Scope {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: root
            required property var modelData
            screen: modelData
            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            DesktopViewer {
                anchors {
                    left: parent.left
                    leftMargin: 10
                    verticalCenter: root.verticalCenter
                }
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
