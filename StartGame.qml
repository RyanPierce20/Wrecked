import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtMultimedia 5.6
import QtGraphicalEffects 1.0

Rectangle{
    signal exit
    id:startgamepressed
    anchors.fill:parent
    Image{
        id: background
        anchors.fill: parent
        source : "/img/Clouds_Background.PNG" //background pic
    }
    TextRect{
        id:exitbutton
        width: startgamepressed.width /6
        height: startgamepressed.height /6
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
