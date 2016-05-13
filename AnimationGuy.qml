import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtMultimedia 5.6
import QtGraphicalEffects 1.0

Rectangle{
    signal enter
    signal exit
    property alias motoname: enterbutton
    property alias txtenter: txtinput

    id:identer
    anchors.fill:parent

    Image{
        id: background
        anchors.fill: parent
        source : "/img/Clouds_Background.PNG" //background pic
    }

    Rectangle{
        id: enterName
        height: 400
        width: 800
        anchors.centerIn: parent
        color: "white"
        border.width: 6
        border.color: "black"

    }
    TextInput{
        id: txtinput
        anchors.centerIn: enterName
        text: "Enter name here..."
        font.pointSize: 24
        height: 50
        width: 50
        color: "black"

    }
    TextRect{
        id:exitbutton
        width: identer.width /6
        height: identer.height /6
        anchors.bottom: background.bottom
        anchors.left: background.left
        hello_text.text: "Exit"
        color: "steelblue"
        hello_text.color: "yellow"
        mouse_area.onClicked:
        {
            exit()
        }
    }

    TextRect{
        id:enterbutton
        width: enterName.width /4
        height: enterName.height /4
        anchors.bottom: enterName.bottom
        anchors.horizontalCenter: enterName.horizontalCenter
        hello_text.text: "Enter"
        color: "steelblue"
        hello_text.color: "yellow"

        mouse_area.onClicked:
        {
            MotorcycleGuy.setName(txtinput.text);
            txtinput.text = MotorcycleGuy.getName();
            console.log(MotorcycleGuy.getName())
            enter()
        }
    }



}
