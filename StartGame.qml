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
    property alias off: toggleoff
    property alias on: musictoggle
    property alias birds: birds
    property alias birds2 : birds2
    property alias rock: rock
    property alias rocket: rocket
    property alias todd: todd
    property int seconds:0
    property int number:0
    property alias gameoverdisplay: txtinput
    signal exit
    signal music
    signal gameover
    id:startgamepressed
    anchors.fill:parent

    AnimatedImage{
        id: background
        anchors.fill: parent
        playing: false
        source : "/images/img/CloudGif.gif" //background pic
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
        source: "/images/img/bikegif.gif"
        width: 400
        height: 400
        playing: false

        Behavior on y{
            NumberAnimation{ duration: 1000}
        }

    }
    AnimatedImage{
        id:birds
        visible: false
        property alias birdani: birdanimation
        x: parent.width - 50
        y: parent.height - 600
        source: "/images/img/yio4gMLBT.gif"
        width: 100
        height: 100
        playing: false
        NumberAnimation on x{
            id: birdanimation
            from: parent.width - 50
            to: 10;
            duration: 5000
            loops: Animation.Infinite
            running: false
        }
        onXChanged: {
            if (timer.running)
            {
            if((((bikeguy.x + bikeguy.width) > birds.x) && ((bikeguy.y + bikeguy.height) > birds.y)) && (bikeguy.y < (birds.y + birds.height)) && (bikeguy.x  < (birds.x + birds.width)))
            {
                console.log("Loser")
                gameover();
            }
            if(birds.x < 17)
            {
                birdanimation.restart()
                birdanimation.stop()
            }
            }

        }

    }
    AnimatedImage{
        id:birds2
        property alias birdani2: birdanimation2
        x: parent.width - 50
        y: parent.height - 200
        source: "/images/img/yio4gMLBT.gif"
        width: 100
        height: 100
        playing: false
        NumberAnimation on x{
            id: birdanimation2
            from: parent.width - 50
            to: 10;
            duration: 5000
            loops: Animation.Infinite
            running: false
        }
        onXChanged: {
            if (timer.running)
            {
            if((((bikeguy.x + bikeguy.width) > birds2.x) && ((bikeguy.y + bikeguy.height) > birds2.y)) && (bikeguy.y < (birds2.y + birds.height)) && (bikeguy.x  < (birds2.x + birds2.width)))
            {
                console.log("Loser")
                gameover();
            }
            if(birds2.x < 17)
            {
                birdanimation2.restart()
                birdanimation2.stop()
            }
            }
        }

    }
    AnimatedImage{
        id:todd
        property alias toddani: toddanimation
        x: parent.width - 50
        y: parent.height - 1000
        source: "/images/img/todd.jpg"
        width: 200
        height: 200
        playing: false
        NumberAnimation on x{
            id: toddanimation
            from: parent.width - 50
            to: 10;
            duration: 5000
            loops: Animation.Infinite
            running: false
        }
        onXChanged: {
            if (timer.running)
            {
            if((((bikeguy.x + bikeguy.width) > todd.x) && ((bikeguy.y + bikeguy.height) > todd.y)) && (bikeguy.y < (todd.y + todd.height)) && (bikeguy.x  < (todd.x + todd.width)))
            {
                console.log("Loser")
                gameover();
            }
            if(todd.x < 17)
            {
                toddanimation.restart()
                toddanimation.stop()
            }
            }
        }

    }
    AnimatedImage{
        id:rocket
        property alias rocketani: rocketanimation
        x: parent.width - 50
        y: parent.height - 700
        source: "/images/img/rocket.png"
        width: 400
        height: 200
        playing: false
        NumberAnimation on x{
            id: rocketanimation
            from: parent.width - 50
            to: 10;
            duration: 5000
            loops: Animation.Infinite
            running: false
        }
        onXChanged: {
            if (timer.running)
            {
            if((((bikeguy.x + bikeguy.width) > rocket.x) && ((bikeguy.y + bikeguy.height) > rocket.y)) && (bikeguy.y < (rocket.y + rocket.height)) && (bikeguy.x  < (rocket.x + rocket.width)))
            {
                console.log("Loser")
                gameover();
            }
            if(rocket.x < 17)
            {
                rocketanimation.restart()
                rocketanimation.stop()
            }
            }
        }

    }

    Image{

        id:rock
        property alias rockani: rockanimation
        x: parent.width - 50
        y: parent.height - 100
        source: "/images/img/rock.png"
        width: 100
        height: 100
        NumberAnimation on x{
            id: rockanimation
            from: parent.width - 50
            to: 10;
            duration: 5000
            loops: Animation.Infinite
            running: true
        }
        onXChanged: {
            if (timer.running)
            {
                if((((bikeguy.x + bikeguy.width) > rock.x) && ((bikeguy.y + bikeguy.height) > rock.y)) && (bikeguy.y < (rock.y + rock.height)) && (bikeguy.x  < (rock.x + rock.width)))
                {
                    console.log("Loser")
                    gameover();
                }
                //console.log(rock.x)
                if(rock.x < 17)
                {
                    rockanimation.restart()
                    rockanimation.stop()
                }
             }
        }
    }
    Text{
        id: txtinput
        visible: false
        z:3
        x: parent.width / 2 - 220
        y: parent.height / 2
        text: ""
        font.pointSize: 60
        height: 100
        width: 100
        color: "red"

    }

    Timer{
        id: timer
        running: false
        repeat : true
        interval: 1000
        onTriggered: {
            if((seconds % 5 == 0 && seconds != 1) && seconds != 0)
            {
                number = randomFunction()
                if(number == 1)
                {
                    console.log(number)
                    birds.visible = true
                    birdanimation.running = true
                }
                else if(number == 2)
                {
                    console.log(number)
                    birds2.visible = true
                    birdanimation2.running = true
                }
                else if(number == 3)
                {
                    console.log(number)
                    rock.visible = true
                    rockanimation.running = true
                }
                else if(number == 4)
                {
                    console.log(number)
                    rocket.visible = true
                    rocketanimation.running = true
                }
                else if(number == 5)
                {
                    console.log(number)
                    todd.visible = true
                    toddanimation.running = true
                }

//                console.log(number)
            }
            if(seconds > 10)
            {
                birds2.visible = true
                birdanimation2.running = true
            }
            if(seconds > 30 && rockanimation.running)
            {
                todd.visible = true
                toddanimation.running = true
            }
            if(seconds > 50 && rockanimation.running)
            {
                todd.visible = true
                toddanimation.running = true
            }

            seconds++
            MotorcycleGuy.setTime(seconds)
            timertext.text = seconds
        }
        function randomFunction() {
            return Math.floor((Math.random() * 5) + 1);

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

        Image
        {
            id:musictoggle
            source: "/images/img/music_logo.png"
            visible: false
            anchors.centerIn: parent
            height: 50
            width:50
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                acceptedButtons: Qt.LeftButton
                onClicked: {
                    music()

                }
            }
        }
        Image{
            id: toggleoff
            source: "/images/img/music_off-512.png"
            visible: true
            anchors.centerIn: parent
            height: 50
            width:50
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                acceptedButtons: Qt.LeftButton
                onClicked: {
                    music()

                }
            }
        }
    }



}
