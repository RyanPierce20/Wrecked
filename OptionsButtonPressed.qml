import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtMultimedia 5.6
import Qt.labs.settings 1.0
import QtMultimedia 5.6

Rectangle {
    signal exit
    id:optionbuttonpressed
    anchors.fill: parent
    Image{
        id: background
        anchors.fill: parent
        source : "../img/comic-style-vector-background.jpg" //background pic
    }
    Image{
        id: arrowcontrols
        source: "/img/arrowkeys.png"
        anchors.bottom: background.bottom
        anchors.horizontalCenter: background.horizontalCenter
    }

    Settings{
        id:optiontoggle

    }
    Text{
        id:instructions
        text:"Controls:
1. Left Arrow: Leans Back
2. Right Arrow: Leans Forward
3. Up Arrow: Acceleration
4. Down Arrow: Brake or Reverse"
        color: "blue"
        font.family: "Times New Roman"
        font.pointSize: 20
        anchors.top: optiontext.bottom
        anchors.horizontalCenter: optiontext.horizontalCenter

    }

    Text{
        id:optiontext
        text: "OPTIONS"
        font.family: "Wide Latin"
        color: "red"
        font.pointSize: 40
        x: parent.width/2
        y: parent.height/3.5
        anchors.horizontalCenter: parent.horizontalCenter
    }
    TextRect{
        id:exitbutton
        width: optionbuttonpressed.width /6
        height: optionbuttonpressed.height /6
        anchors.bottom: background.bottom
        anchors.right: background.right
        hello_text.text: "Exit"
        color: "steelblue"
        hello_text.color: "yellow"
        mouse_area.onClicked:
        {
            exit()
        }
    }

}
