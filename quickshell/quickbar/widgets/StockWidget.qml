import QtQuick
import Quickshell.Io

Widget {
    property real price
    id: root
    content: price.toFixed(2) + " "
    Process {
        id: updatePrice
        command: ["sh", "-c", "uv run --directory ~/.config/quickshell/quickbar/scripts/ main.py VWRA.L"]
        running: true
        stdout: SplitParser {
            onRead: message => {
                const parts = message.split(",")
                root.price = parts[0]
                if (parts[1] > 0)
                    root.foregroundColor = "#a3be8c"
                if (parts[1] < 0)
                    root.foregroundColor = "#bf616a"
            }
        }
    }
}
