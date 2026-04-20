import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Widget {
    content: {
        const toplevels = Hyprland.focusedWorkspace.toplevels.values
        for (const toplevel of toplevels)
            if (toplevel.activated)
                return toplevel.title
        return "Desktop"
    }
    Layout.fillWidth: true
    backgroundColor: "#802e3440"
    foregroundColor: "#d8dee9"
}
