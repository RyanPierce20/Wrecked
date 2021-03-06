import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtMultimedia 5.6
import Qt.labs.settings 1.0
import QtMultimedia 5.6

Rectangle {
    property alias musictoggler: music.musicstartstop
    signal exit
    id:musicbuttonpressed
    anchors.fill: parent
    Image{
        id: background
        anchors.fill: parent
        source : "/images/img/comic-style-vector-background.jpg" //background pic
    }

    Settings{
        id:musictoggle

    }

    MusicSlider
    {
        id: music
        //dont delete, need this for music
    }

    Text{
        id:musictext
        text: "MUSIC"
        font.family: "Wide Latin"
        color: "red"
        font.pointSize: 40
        x: parent.width/2
        y: parent.height/3.6
        anchors.horizontalCenter: parent.horizontalCenter
    }
    TextRect{
        id:exitbutton
        width: musicbuttonpressed.width /6
        height: musicbuttonpressed.height /6
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

}
