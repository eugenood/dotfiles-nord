import QtQuick
import Quickshell.Io

Widget {
    property int percentage
    id: root
    content: percentage + " 󰃠"
    Process {
        command: ["udevadm", "monitor", "--subsystem-match=backlight", "--udev"]
        running: true
        stdout: SplitParser {
            onRead: updateBrightness.running = true
        }
    }
    Process {
        id: updateBrightness
        command: ["brightnessctl", "-m"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                root.percentage = this.text.split(",")[3].replace("%", "")
            }
        }
    }
}
