import QtQuick 2.0
import QtMultimedia 5.5
import Qt.labs.settings 1.0

Rectangle {
    id: slider
    Settings{
        id:musictoggle
        property alias remembermusic: music.volume
        property alias sliderremember: slider.value
    }
    property alias musicstartstop: music
    property alias musiconoff: music.volume
    property alias text: buttonText.text
    Accessible.role: Accessible.Slider

    property int value: 100         // required
    property int minimumValue: 0.0  // optional (default INT_MIN)
    property int maximumValue: 1.0 // optional (default INT_MAX)
    property int stepSize: 1      // optional (default 1)


    width: 500
    height: 100
    border.color: "black"
    border.width: 4
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter

    Rectangle {
        id: indicator
        height: parent.height - 2
        width: value * 5
        color: "yellow"
        Behavior on width {
            NumberAnimation { duration: 50 }
        }
    }

    Rectangle{
        id:on
        height: 100
        width:200
        border.color: "black"
        border.width:2
        anchors.right: slider.left
        anchors.top: slider.bottom
        Text{
            id: ontxt
            text: "ON"
            font.family: "Wide Latin"
            color: "red"
            font.pointSize: 16
            anchors.centerIn: parent
        }
        MouseArea{
            id:onmouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            acceptedButtons: Qt.LeftButton
            onHoveredChanged: {
                parent.color = "red"
                ontxt.color = "black"

            }
            onExited: {
                parent.color = "white"
                ontxt.color = "red"
                music.volume = 1.0
                slider.value = 100
            }
        }

    }
    Rectangle{
        id:off
        height: 100
        width:200
        border.color: "black"
        border.width:2
        anchors.left: slider.right
        anchors.top: slider.bottom
        Text{
            id: offtxt
            text: "OFF"
            font.family: "Wide Latin"
            color: "red"
            font.pointSize: 16
            anchors.centerIn: parent
        }
        MouseArea{
            id:offmouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            acceptedButtons: Qt.LeftButton
            onHoveredChanged: {
                parent.color = "red"
                offtxt.color = "black"
            }
            onExited: {
                parent.color = "white"
                offtxt.color = "red"
                music.volume = 0.0
                slider.value = 0
            }
        }
    }
    Text {
        id: buttonText
        text: parent.value
        anchors.centerIn: parent
        font.pixelSize: parent.height * .5
    }
    Audio{
        id:music
        source: "/audio/LupeSongIntruments.mp3"
        volume:1.0
        autoPlay: true
        playbackRate: 1.0
        loops:20
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            var pos = (mouse.x / slider.width * 100)
            slider.value = pos
            music.volume = slider.value / 100

        }
    }

}
