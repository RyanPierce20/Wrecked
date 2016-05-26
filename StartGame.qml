import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtMultimedia 5.6
import QtGraphicalEffects 1.0

Rectangle{

    property alias gametime:timer
    property  alias biker: bikeguy
    property alias paused: paused
    property alias clouds: background
    property int seconds:0
    signal exit
    id:startgamepressed
    anchors.fill:parent

    AnimatedImage{
        id: background
        playing:true
        anchors.fill: parent
        source : "/img/CloudGif.gif" //background pic
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
            seconds = 0
            timertext.text = 0
            paused.visible = false
            bikeguy.playing = true
            timer.stop()
            exit()
        }
    }
    AnimatedImage{
        id:bikeguy
        x: (parent.width / 2) - 200
        y: parent.height - 360
        source: "/img/bikegif.gif"
        width: 400
        height: 400
        Behavior on y{
            NumberAnimation{ duration: 1000}
        }

    }
    Timer{
        id: timer
        running: false
        repeat : true
        interval: 1000
        onTriggered: {
            seconds++
            timertext.text = seconds
        }
    }
    Text{
        id:timertext
        font.bold: true
        styleColor: "#74c82a"
        font.pointSize: 40
        z:5
        text:"0"
        anchors.top:parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text{
        id:paused
        font.family: "Ravie"
        font.bold: true
        styleColor: "#ff1905"
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 80
        text: "Paused"
        visible:false
        anchors.centerIn: parent
        z:5
    }
    Rectangle{
        id:baseRect
        anchors.left: parent.left
        anchors.top: parent.top
        height: 100
        width: 100
        border.color: "black"
        border.width:2
        MouseArea{
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            acceptedButtons: Qt.LeftButton
            onClicked:
            {
                if(toggleon.visible == true)
                {
                    musictoggle.visible = true
                    toggleon.visible = false
                }
                if(musictoggle.visible == false)
                {
                    toggleon.visible = false
                    musictoggle.visible = true
                }
            }
        }

        Image
        {
            id:musictoggle
            source: "/img/music_logo.png"
            visible: true
            anchors.centerIn: parent
            height: 50
            width:50
        }
        Image{
            id: toggleon
            source: "/img/music_off-512.png"
            visible: false
            anchors.centerIn: parent
            height: 50
            width:50
        }
    }



}
