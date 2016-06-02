import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtMultimedia 5.6

Window {
    //visibility: "FullScreen"
    width: Screen.width
    height: Screen.height
    title: "Ready To Get Wrecked?!?!?!"
    visible: true
    property bool game :false;
    Rectangle{
        id: wrapper
        color:"transparent"
        anchors.fill: parent
        focus:true
    Keys.onSpacePressed: {
        if(game == false)
        {

        if(pressedstartgame.biker.playing === true){
            pressedstartgame.biker.playing = false
            pressedstartgame.gametime.stop()
            pressedstartgame.paused.visible = true
            pressedstartgame.clouds.paused = true

            if(pressedstartgame.rock.rockani.running){
                pressedstartgame.rock.rockani.pause()
            }
            if(pressedstartgame.birds.birdani.running)
            {
                pressedstartgame.birds.birdani.pause()
            }
            if(pressedstartgame.birds2.birdani2.running)
            {
                pressedstartgame.birds2.birdani2.pause()
            }
            if(pressedstartgame.rocket.rocketani.running)
            {
                pressedstartgame.rocket.rocketani.pause()
            }
            if(pressedstartgame.todd.toddani.running)
            {
                pressedstartgame.todd.toddani.pause()
            }

        }
        else{
            pressedstartgame.clouds.paused = false
            pressedstartgame.biker.playing = true
            pressedstartgame.gametime.start()
            pressedstartgame.paused.visible = false
            if(pressedstartgame.rock.rockani.running){
                pressedstartgame.rock.rockani.resume()

            }
            if(pressedstartgame.birds.birdani.running)
            {
                pressedstartgame.birds.birdani.resume()
                pressedstartgame.birds.paused = false
            }
            if(pressedstartgame.birds2.birdani2.running)
            {
                pressedstartgame.birds2.birdani2.resume()
                pressedstartgame.birds2.paused = false
            }
            if(pressedstartgame.rocket.rocketani.running)
            {
                pressedstartgame.rocket.rocketani.resume()
            }
            if(pressedstartgame.todd.toddani.running)
            {
                pressedstartgame.todd.toddani.resume()
            }

        }

        }

    }
    Keys.onReturnPressed:
    {
        wrapper.focus = true
        MotorcycleGuy.setName(driverId.txtenter.text);
        driverId.txtenter.text = MotorcycleGuy.getName();
        console.log(MotorcycleGuy.getName())
        console.log(MotorcycleGuy.getTime())
        driverId.visible = false
        wrapper.focus = true

        // Start the game
        if(game == false){
        pressedstartgame.clouds.playing = true
        pressedstartgame.clouds.paused = false
        pressedstartgame.biker.playing = true
        pressedstartgame.gametime.start()
        pressedstartgame.paused.visible = false
        pressedstartgame.rock.rockani.restart()
        persontime.visible = false
        persontime.text = ""
        pressedstartgame.gameoverdisplay.visible = false
        }
        if(pressedstartgame.rock.rockani.running){
            pressedstartgame.rock.rockani.restart()
        }
        if(pressedstartgame.birds.birdani.running)
        {
            pressedstartgame.birds.birdani.restart()
            pressedstartgame.birds.birdani.stop()
        }
        if(pressedstartgame.birds2.birdani2.running)
        {
            pressedstartgame.birds2.birdani2.restart()
            pressedstartgame.birds2.birdani2.stop()
        }
        if(pressedstartgame.rocket.rocketani.running)
        {
            pressedstartgame.rocket.rocketani.restart()
            pressedstartgame.rocket.rocketani.stop()
        }
        if(pressedstartgame.todd.toddani.running)
        {
            pressedstartgame.todd.toddani.restart()
            pressedstartgame.todd.toddani.stop()
        }

    }
    Keys.onUpPressed: {
        //console.log("jump")
        pressedstartgame.biker.y = -50
    }

    Keys.onDownPressed: {
        //console.log("down")
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

            // Start the game
            pressedstartgame.clouds.playing = true
            pressedstartgame.clouds.paused = false
            pressedstartgame.biker.playing = true
            pressedstartgame.gametime.start()
            pressedstartgame.paused.visible = false
            pressedstartgame.rock.rockani.restart()
            if(pressedstartgame.rock.rockani.running){
                pressedstartgame.rock.rockani.restart()
            }
            if(pressedstartgame.birds.birdani.running)
            {
                pressedstartgame.birds.birdani.restart()
                pressedstartgame.birds.birdani.stop()
            }
            if(pressedstartgame.birds2.birdani2.running)
            {
                pressedstartgame.birds2.birdani2.restart()
                pressedstartgame.birds2.birdani2.stop()
            }
            if(pressedstartgame.rocket.rocketani.running)
            {
                pressedstartgame.rocket.rocketani.restart()
                pressedstartgame.rocket.rocketani.stop()
            }
            if(pressedstartgame.todd.toddani.running)
            {
                pressedstartgame.todd.toddani.restart()
                pressedstartgame.todd.toddani.stop()
            }
            persontime.visible = false
            persontime.text = ""
            pressedstartgame.gameoverdisplay.visible = false
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
        onMusic: {
            if(pressedstartgame.on.visible == false)
            {
                pressedmusic.musictoggler.pause()
                pressedstartgame.on.visible = true
                pressedstartgame.off.visible = false
            }
            else
            {
                pressedmusic.musictoggler.play()
                pressedstartgame.off.visible = true
                pressedstartgame.on.visible = false
            }
        }

        onExit:
        {
            splashscreen.visible = true
            pressedstartgame.visible = false
            game = false
        }
        onGameover: {
            if(game == false){
            game = true
            pressedstartgame.gameoverdisplay.text = MotorcycleGuy.gameOver()
            pressedstartgame.gameoverdisplay.visible = true
            pressedstartgame.biker.playing = false
            pressedstartgame.gametime.stop()
            pressedstartgame.clouds.paused = true
                if(pressedstartgame.rock.rockani.running){
                    pressedstartgame.rock.rockani.pause()
                }
                if(pressedstartgame.birds.birdani.running)
                {
                    pressedstartgame.birds.birdani.pause()
                }
                if(pressedstartgame.birds2.birdani2.running)
                {
                    pressedstartgame.birds2.birdani2.pause()
                }
                if(pressedstartgame.rocket.rocketani.running)
                {
                    pressedstartgame.rocket.rocketani.pause()
                }
                if(pressedstartgame.todd.toddani.running)
                {
                    pressedstartgame.todd.toddani.pause()
                }

            persontime.visible = true
            persontime.text = "User name: " + MotorcycleGuy.getName() + "
"                    + "Your Time:  " + MotorcycleGuy.getTime() + " Seconds";
                }


        }
        Text{
            id:persontime
            width: 400
            height: 200
            color: "yellow"
            font.pointSize: 30
            visible: false
            x: 675
            y:200
        }
    }
    }
}
