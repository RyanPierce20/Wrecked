import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtMultimedia 5.6
Rectangle{
    property alias alias_splash_screen:window
    property alias alias_big_wrapper:big_wrapper
    property alias alias_background:background
     property alias alias_get_wrecked:wrecked
    property alias alias_start_button:start
    property alias alias_music_button:musicbutton
    property alias alias_instructions_button:instructions
    property alias alias_exit_button:exit
    property alias alias_wrecked:wreck

    signal openMusic
    signal openOptions
    signal openGame
    id: window
    anchors.fill: parent
//    Video{
//        id:motorgif
//        source: "/img/motor-gif.gif"
//        autoPlay: true
//        width: 200
//        height:200
//        anchors.horizontalCenter: window.horizontalCenter
//        anchors.verticalCenter: window.verticalCenter
//    }


Rectangle
{
    id: big_wrapper
    height: window.height
    width: window.width
    Image{
        id:wrecked
        anchors.horizontalCenter: big_wrapper.horizontalCenter
        anchors.bottom: big_wrapper.bottom
        source: "img/getwreckedkid.png"
        z: 1
    }
    Image{
        id: background
        anchors.fill: parent
        source : "../img/comic-style-vector-background.jpg" //background pic
    }
    TextRect{
        mouse_area.onClicked:
        {
            openGame()
        }

        id:start
        hello_text.text: "START GAME"
        color: "steelblue"
        height:140
        width: parent.width * .2
        x: big_wrapper.width/2.5
        y: big_wrapper.height/2.5
        hello_text.color:"yellow"
    }
    TextRect{
        mouse_area.onClicked:
        {
            openMusic()
        }
        width:parent.width * .1
        height:80
        x: window.width/1.9
        y: window.height/1.6
        id:musicbutton
        hello_text.text: "Music"
        color: "steelblue"
        hello_text.color:"yellow"
    }
    TextRect{
        mouse_area.onClicked:
        {
            openOptions()
        }
        width : parent.width * .1
        height: 80
        x: window.width/2.6
        y: window.height/1.6
        id:instructions
        hello_text.text: "Options"
        color: "steelblue"
        hello_text.color:"yellow"
    }
    TextRect{
        id:exit
        width: parent.width * .07
        height: 80
        x: big_wrapper.width/2.12
        y: big_wrapper.height/1.4
        hello_text.text: "Exit"
        color: "steelblue"
        hello_text.color: "yellow"
        mouse_area.onClicked:
        {
            Qt.quit()
        }
    }
    TextRect{
        x: big_wrapper.width/2
        y: big_wrapper.height/2.8
        hello_text.font.pointSize: 36
        id:wreck
    }




}
}
