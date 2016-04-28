import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2

    TextRect{
        property alias dialog_alias: dialog
        id:dialog
        width: parent.width
        height: 350
        x:0
        y:big_wrapper.height/2.5
        hello_text.text: "Welcome to my game. The best game where you will get WRECKED!"
        hello_text.font.pointSize: 34
        color:"steelblue"
        border.color: "red"
        border.width: 2
        z:2
        visible: true
        Button{
            id:menubutton
            width:dialog.width * .25
            height:dialog.height/3
            anchors.bottom: dialog.bottom
            anchors.horizontalCenter: dialog.horizontalCenter
            Text{
                text:"Lets Get Started"
                anchors.horizontalCenter: menubutton.horizontalCenter
                anchors.verticalCenter: menubutton.verticalCenter
                color:"red"
                font.pointSize: 24
            }
            onClicked: {
                dialog.visible = false
            }
        }
    }
