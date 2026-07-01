import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Shapes


ApplicationWindow {
    id: window
    width: 640
    height: 480
    minimumWidth: 200
    minimumHeight: 250
    visible: true
    title: qsTr("Analog Speedometer")
    color: "#010b19"

    Rectangle
    {
        id: circle
        width: 400
        height: 400
        color: "#010b19"
        radius: width/2
        visible: true
        border.color: "#ffffff"
        anchors.centerIn: parent

        Item {
            id: gaugeTicks
            anchors.fill: parent

            Repeater {
                model: 33

                Rectangle {
                    width: index % 4 === 0 ? 26 : 16
                    height: 4
                    color: index % 4 === 0 ? "#ffffff" : "#5aa9ff"
                    radius: 2
                    antialiasing: true
                    rotation: 135 + index * 270 / 32
                    transformOrigin: Item.Center

                    x: parent.width / 2
                       + Math.cos((135 + index * 270 / 32) * Math.PI / 180) * (parent.width / 2 - 30)
                       - width / 2
                    y: parent.height / 2
                       + Math.sin((135 + index * 270 / 32) * Math.PI / 180) * (parent.height / 2 - 30)
                       - height / 2
                }
            }
        }

        Repeater {
            id: gaugeNumbers
            model: 17

            Item {
                width: 32
                height: 40

                x: parent.width / 2
                       + Math.cos((135 + index * 270 / 16) * Math.PI / 180) * (parent.width / 2 - 70)
                       - width / 2
                y: parent.height / 2
                        + Math.sin((135 + index * 270 / 16) * Math.PI / 180) * (parent.height / 2 - 70)
                        - height / 2

                Text {
                    anchors.centerIn: parent
                    text: index * 10
                    color: "#ffffff"
                    font.pixelSize: index % 2 == 0 ? 20 : 10
                    font.bold: true
                }
            }
        }

        Rectangle {
            id: needle
            width: 150
            height: 4
            color: "#ff4d4d"
            radius: 2
            x: circle.width / 8
            y: circle.height / 2 - height / 2
            z: 3
        }

        Rectangle {
            width: 18
            height: 18
            radius: 9
            color: "#ffffff"
            anchors.centerIn: parent
            z: 4
        }
    }

}
