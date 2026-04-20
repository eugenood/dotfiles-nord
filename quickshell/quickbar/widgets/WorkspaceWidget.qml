import Quickshell.Hyprland

Widget {
    content: "󰣇 " + Hyprland.focusedWorkspace?.name ?? ""
    backgroundColor: "#2e3440"
    foregroundColor: "#88c0d0"
}
