import QtQuick 2.5
import SharedComponents 1.0
import QtQuick.Layouts 1.1

Item {

    Image {
        source: "qrc:/img/module_header_shadow.png"
        anchors {
            top: header.bottom
            left: parent.left
            right: parent.right
        }
        opacity: 0.6
    }

    Image {
        source: "qrc:/img/module_footer_shadow.png"
        anchors {
            bottom: footer.top
            left: footer.left
            right: footer.right
        }
        opacity: 0.6
    }

    GridView {
        id: lst

        add: Transition {
            NumberAnimation { property: "opacity"; easing.type: Easing.InQuart; from: 0; to: 1; duration: 150 }
        }
        remove: Transition {
            NumberAnimation { property: "opacity"; easing.type: Easing.OutQuart; from: 1; to: 0; duration: 150 }
        }

        cellHeight: Units.dp(197)
        cellWidth: Units.dp(232)

        snapMode: GridView.SnapToRow

        anchors.centerIn: parent

        height: 2 * cellHeight
        width: 3 * cellWidth

        boundsBehavior: Flickable.StopAtBounds

        delegate: MediaMenuItem {
            labelTitle: title
            labelDesc: subtitle
            disabled: itemDisabled
            icon: Loader {
                source: iconSource
            }

            onButtonClicked: rootWindow.handleMediaClick(clickId)
        }

        model: ListModel {
            ListElement {
                title: qsTr("Your Music")
                subtitle: qsTr("Access you media library")
                itemDisabled: false
                iconSource: "MediaIconMusic.qml"
                clickId: "music"
            }
            ListElement {
                title: qsTr("CCTV")
                subtitle: qsTr("Drive all you cctv cameras")
                itemDisabled: false
                iconSource: "MediaIconCamera.qml"
                clickId: "camera"
            }
            ListElement {
                title: qsTr("Internet")
                subtitle: qsTr("Go and surf the web")
                itemDisabled: true
                iconSource: "MediaIconInternet.qml"
                clickId: "web"
            }
        }
    }

    Image {
        id: header
        source: "qrc:/img/module_header.png"
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        Text {
            anchors.centerIn: parent
            elide: Text.ElideMiddle
            font.pixelSize: Units.dp(22)
            font.family: calaosFont.fontFamilyLight
            font.weight: Font.ExtraLight
            color: "#e7e7e7"
            text: qsTr("Media")
        }
    }

    Image {
        id: footer
        source: "qrc:/img/module_footer.png"
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        RowLayout {
            anchors {
                left: parent.left; leftMargin: Units.dp(20)
                right: parent.right; rightMargin: Units.dp(20)
                verticalCenter: parent.verticalCenter
            }

            spacing: Units.dp(5)

            Item { //spacer
                height: 1; Layout.fillWidth: true
            }

            FooterButton {
                label: qsTr("Quit")
                icon: "qrc:/img/button_action_quit.png"
                Layout.minimumWidth: width
                onBtClicked: rootWindow.goToDesktop()
            }
        }

    }
}
