import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtMultimedia 5.6

Window {
    visibility: "FullScreen"
    width: Screen.width
    height: Screen.height
    title: "Ready To Get Wrecked?!?!?!"
    Rectangle{
        id: wrapper
        color:"transparent"
        anchors.fill: parent
        focus:true
    Keys.onSpacePressed: {

        if(pressedstartgame.biker.playing === true){
            pressedstartgame.biker.playing = false
            pressedstartgame.gametime.stop()
            pressedstartgame.paused.visible = true
            pressedstartgame.clouds.paused = true
        }
        else{
            pressedstartgame.clouds.paused = false
            pressedstartgame.biker.playing = true
            pressedstartgame.gametime.start()
            pressedstartgame.paused.visible = false
        }

    }
    Keys.onReturnPressed:
    {
        wrapper.focus = true
        MotorcycleGuy.setName(driverId.txtenter.text);
        driverId.txtenter.text = MotorcycleGuy.getName();
        console.log(MotorcycleGuy.getName())
        //add a class for game over and display the time and name
        //enter()
        driverId.visible = false
        pressedstartgame.gametime.start()
        wrapper.focus = true

    }
    Keys.onUpPressed: {
        console.log("jump")
        pressedstartgame.biker.y = 500
    }

    Keys.onDownPressed: {
        console.log("down")
        pressedstartgame.biker.y = 700
    }


    SplashScreen{
        id:splashscreen
        onOpenMusic:
        {
            splashscreen.visible = false
            pressedmusic.visible = true
        }
        onOpenOptions:
        {
            splashscreen.visible = false
            pressedoptions.visible = true
        }
        onOpenGame:
        {
            driverId.visible = true
            splashscreen.visible = false
            pressedstartgame.visible = true
        }

    }
    AnimationGuy{
        id: driverId
        visible:false
        z:2
        onEnter:
        {
            driverId.visible = false
            pressedstartgame.gametime.start()
        }
        onExit:
        {
            driverId.visible = false
            pressedstartgame.gametime.stop()
        }

    }

    MusicButtonPressed{
        id:pressedmusic
        visible: false
        onExit:
        {
            splashscreen.visible = true
            pressedmusic.visible = false
        }

    }
    OptionsButtonPressed{
        id:pressedoptions
        visible: false
        onExit:
        {
            splashscreen.visible = true
            pressedoptions.visible = false
        }
    }
    StartGame{
        id:pressedstartgame
        visible: false
        onExit:
        {
            splashscreen.visible = true
            pressedstartgame.visible = false
        }
    }
    }
}
