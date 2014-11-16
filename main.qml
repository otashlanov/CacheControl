import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 400
    height: 600
    color: "#333"

    Item{
        id: segmentedControl
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height / 12
        visible: true

        ExclusiveGroup { id: segmentedButtonGroup }
        Button{
            id: yearButton
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width / 4
            checkable: true
            text: "Year"

            exclusiveGroup: segmentedButtonGroup
            style: ButtonStyle {
               background: Rectangle {
                   color: "#888"
                   smooth: true
                   gradient: Gradient {
                       GradientStop { position: 0.0; color: control.checked ? "#fff" : "#888" }
                       GradientStop { position: 1.0; color: "#333" }
                   }
               }
            }
        }

        Button{
            id: monthButton
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: yearButton.right
            width: parent.width / 4
            checkable: true
            text: "Month"

            exclusiveGroup: segmentedButtonGroup
            style: ButtonStyle {
               background: Rectangle {
                   color: "#888"
                   smooth: true
                   gradient: Gradient {
                       GradientStop { position: 0.0; color: control.checked ? "#fff" : "#888" }
                       GradientStop { position: 1.0; color: "#333" }
                   }
               }
            }
        }

        Button{
            id: weekButton
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: monthButton.right
            width: parent.width / 4
            checkable: true
            text: "Week"

            exclusiveGroup: segmentedButtonGroup
            style: ButtonStyle {
               background: Rectangle {
                   color: "#888"
                   smooth: true
                   gradient: Gradient {
                       GradientStop { position: 0.0; color: control.checked ? "#fff" : "#888" }
                       GradientStop { position: 1.0; color: "#333" }
                   }
               }
            }
        }

        Button{
            id: dayButton
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: weekButton.right
            width: parent.width / 4
            checkable: true
            checked: true
            text: "Day"

            exclusiveGroup: segmentedButtonGroup
            style: ButtonStyle {
               background: Rectangle {
                   color: "#888"
                   smooth: true
                   gradient: Gradient {
                       GradientStop { position: 0.0; color: control.checked ? "#fff" : "#888" }
                       GradientStop { position: 1.0; color: "#333" }
                   }
               }
            }
        }

    }

    Item{
        id: calendarForm
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: buttonForm.top
        visible: false

        Calendar{
            id: calendar
            objectName: "calendarComponent"
            anchors.fill: parent
            weekNumbersVisible: true

            style: CalendarStyle {
                gridVisible: false
                dayDelegate: Rectangle {
                    gradient: Gradient {
                        GradientStop {
                            position: 0.00
                            color: styleData.selected ? "#111" : (styleData.visibleMonth && styleData.valid ? "#444" : "#666");
                        }
                        GradientStop {
                            position: 1.00
                            color: styleData.selected ? "#444" : (styleData.visibleMonth && styleData.valid ? "#111" : "#666");
                        }
                        GradientStop {
                            position: 1.00
                            color: styleData.selected ? "#777" : (styleData.visibleMonth && styleData.valid ? "#111" : "#666");
                        }
                    }

                    Label {
                        text: styleData.date.getDate()
                        anchors.centerIn: parent
                        color: styleData.valid ? "white" : "grey"
                    }

                   Rectangle {
                        width: parent.width
                        height: 1
                        color: "#555"
                        anchors.bottom: parent.bottom
                    }

                    Rectangle {
                        width: 1
                        height: parent.height
                        color: "#555"
                        anchors.right: parent.right
                    }
                }
            }
        }
    }

    Item{
        id: buttonForm
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: parent.height / 8

        ExclusiveGroup { id: panelButtonGroup }
        Button{
            id: calendarButton
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width / 3
            checkable: true
            text: "Calendar"

            exclusiveGroup: panelButtonGroup
            style: ButtonStyle {
               background: Rectangle {
                   border.color: "#333"
                   color: "#888"
                   smooth: true
                   radius: 4
                   gradient: Gradient {
                       GradientStop { position: 0.0; color: control.checked ? "#fff" : "#888" }
                       GradientStop { position: 1.0; color: "#333" }
                   }
               }
            }

            onClicked: {
                calendarForm.visible = true
                segmentedControl.visible = false
            }
        }

        Button{
            id: statisticButton
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: calendarButton.right
            width: parent.width / 3
            checkable: true
            checked: true
            text: "Statistic"

            exclusiveGroup: panelButtonGroup
            style: ButtonStyle {
               background: Rectangle {
                   border.color: "#333"
                   color: "#888"
                   smooth: true
                   radius: 4
                   gradient: Gradient {
                       GradientStop { position: 0.0; color: control.checked ? "#fff" : "#888" }
                       GradientStop { position: 1.0; color: "#333" }
                   }
               }
            }

            onClicked: {
                calendarForm.visible = false
                segmentedControl.visible = true
            }
        }

        Button{
            id: actionButton
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: statisticButton.right
            width: parent.width / 3
            checkable: true
            text: "Action"

            exclusiveGroup: panelButtonGroup
            style: ButtonStyle {
               background: Rectangle {
                   border.color: "#333"
                   color: "#888"
                   smooth: true
                   radius: 4
                   gradient: Gradient {
                       GradientStop { position: 0.0; color: control.checked ? "#fff" : "#888" }
                       GradientStop { position: 1.0; color: "#333" }
                   }
               }
            }

            onClicked: {
                calendarForm.visible = false
                segmentedControl.visible = false
            }
        }

    }
}
