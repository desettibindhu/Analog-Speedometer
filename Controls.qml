import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: speedController

    //Declaring button signals
    signal increaseButtonPressed()
    signal decreaseButtonPressed()

    ColumnLayout{

        spacing: 10

    Button{
        id: speedControllerIncreaseButton
        text: "Increase Speed"

        background: Rectangle {
                implicitWidth: 120
                implicitHeight: 40
                color: speedControllerIncreaseButton.pressed ? "#4682B4" : "#5A9BD4"
                radius: 8
                border.color: "#3A7BB0"
                border.width: 1
        }

        onClicked: speedController.increaseButtonPressed()
    }

    Button{
        id: speedControllerDecreaseButton
        text: "Decrease Speed"

        background: Rectangle {
                implicitWidth: 120
                implicitHeight: 40
                color: speedControllerDecreaseButton.pressed ? "#4682B4" : "#5A9BD4"
                radius: 8
                border.color: "#3A7BB0"
                border.width: 1
        }

        onClicked: speedController.decreaseButtonPressed()
    }

    }

}
