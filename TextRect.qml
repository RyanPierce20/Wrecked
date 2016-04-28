import QtQuick 2.0

Rectangle {
    property alias hello_text: txt_sample
    property alias mouse_area: mouseArea
    id:baseRect
    border.color: "black"
    border.width:2

    Text{
        id: txt_sample
        text: "WRECKED"
        font.family: "Wide Latin"
        color: "red"
        font.pointSize: 16
        anchors.centerIn: parent
    }
    MouseArea{
        id:mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.LeftButton
        onHoveredChanged: {
            parent.color = "red"
            txt_sample.color = "black"

        }
        onExited: {
            parent.color = "steelblue"
            txt_sample.color = "yellow"
        }
        drag.target: baseRect
                    drag.axis: Drag.XAndYAxis

    }


}
