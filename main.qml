import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtMultimedia 5.6

Window {
    visibility: "FullScreen"
    width: Screen.width
    height: Screen.height
    title: "Ready To Get Wrecked?!?!?!"


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
        }
        onExit:
        {
            driverId.visible = false
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
