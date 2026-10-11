import Quickshell
import QtQuick
import Niri

Loader {
    sourceComponent: isOnBrowser ? tabs : null
    property WorkspaceModel workspace: Niri.workspaces
    property bool isOnBrowser: false

    onWorkspaceChanged: {
        if (browserWorkspace.rowCount() > 0) {
            const idx = browserWorkspace.index(0, 0);
            const value = browserWorkspace.data(idx, browserWorkspace.roleForName("isActive"));
        }
        isOnBrowser = value;
        print(isOnBrowser);
    }

    SortFilterProxyModel {
        id: browserWorkspace
        model: Niri.workspaces

        filters: [
            ValueFilter {
                roleName: "name"
                value: {
                    print("sort");
                    return "browser";
                }
            }
        ]
    }

    Component {
        id: tabs
        Item {
            SortFilterProxyModel {
                id: qutebrowserWindows
                model: Niri.windows

                filters: [
                    ValueFilter {
                        roleName: "id"
                        value: "org.qutebrowser.qutebrowser"
                    }
                ]
            }

            ListView {
                model: qutebrowserWindows
                delegate: Rectangle {}
            }
        }
    }
}
