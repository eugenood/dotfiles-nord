import QtQuick
import Quickshell.Widgets

WrapperRectangle {
    required property string content
    property color backgroundColor: "#2e3440"
    property color foregroundColor: "#d8dee9"
    id: root
    implicitHeight: 24
    topMargin: 4
    bottomMargin: 4
    leftMargin: 8
    rightMargin: 8
    radius: 4
    color: backgroundColor
    Text {
        text: root.content
        font.family: "JetBrainsMonoNL Nerd Font"
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        color: root.foregroundColor
    }
}
