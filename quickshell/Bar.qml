import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

Scope {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: root
            required property var modelData
            screen: modelData

            // color: "transparent"
            color: Qt.rgba(Colors.color1.r, Colors.color1.g, Colors.color1.b, 0.4) // Semi-transparent background color

            BackgroundEffect.blurRegion: Region {
                item: root.contentItem
            }
            anchors {
                top: true
                left: true
                right: true
            }
            // margins {
            //     top: 5
            //     left: 5
            //     right: 5
            //     bottom: 5
            // }

            implicitHeight: 40

            WorkspaceViewer {
                id: test
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                    verticalCenter: root.verticalCenter
                    margins: 5
                }
                screen: root.screen.name
            }

            WrapperRectangle {
                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                    margins: 5
                }
                color: Colors.color0
                margin: 7.5
                radius: 7.5

                RowLayout {
                    id: row
                    spacing: 10

                    Battery {
                        fontSizeMode: Text.VerticalFit
                        font.family: "FiraCode Nerd Font Mono"
                        minimumPixelSize: 10
                        color: Colors.color5
                    }

                    Clock {
                        fontSizeMode: Text.VerticalFit
                        font.family: "FiraCode Nerd Font Mono"
                        minimumPixelSize: 10
                        color: Colors.color5
                    }
                }
            }
        }
    }
}
