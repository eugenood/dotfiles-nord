import QtQuick
import Quickshell.Io

Widget {
    property int percentage
    id: root
    content: percentage + " "
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: updateCpu.running = true
    }
    Process {
        id: updateCpu
        command: ["sh", "-c", "vmstat 1 2 | tail -1 | awk '{print 100 - $15}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                root.percentage = this.text
            }
        }
    }
}
