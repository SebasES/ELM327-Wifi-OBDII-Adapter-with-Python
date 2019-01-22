import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0

Rectangle {
    width: 1000
    height: 1000
    color: "#000000"

    CircularGauge {
        objectName: "CircularGauge_RPM"
	id: circulargauge_rpm
        property real gauge_value: 800.0
        value: gauge_value
        maximumValue: 8000.0  // Largest Value
        minimumValue: 0.0       // Smallest Value
        style: CircularGaugeStyle {
            id: style
            tickmarkStepSize: 1000.0 // Tick Marks

            tickmark: Rectangle {
                visible: styleData.value < 8000 || styleData.value % 1000 == 0
                implicitWidth: outerRadius * 0.02
                antialiasing: true
                implicitHeight: outerRadius * 0.06
                color: styleData.value >= 8000 ? "#ff0000" : "#ff0000"
            }

           minorTickmark: Rectangle {
                visible: styleData.value < 8000
                implicitWidth: outerRadius * 0.01
                antialiasing: true
                implicitHeight: outerRadius * 0.03
                color: "#ff0000"
           }

           tickmarkLabel:  Text {
                font.pixelSize: Math.max(6, outerRadius * 0.1)
                text: styleData.value
                color: styleData.value >= 8000 ? "#ff0000" : "#ff0000"
                antialiasing: true
           }

           needle: Rectangle {
                y: outerRadius * 0.15
                implicitWidth: outerRadius * 0.03
                implicitHeight: outerRadius * 1.1
                antialiasing: true
                color: "#ff0000"
           }

           foreground: Item {
                Rectangle {
                     width: outerRadius * 0.2
                     height: width
                     radius: width / 2
                     color: "#b2b2b2"
                     anchors.centerIn: parent
                }
           }
      }
 }

Text {
    text: "RPM [1/min]"
    font.family: "Helvetica"
    font.pointSize: 18
    color: "red"
    anchors.top: circulargauge_rpm.bottom
    anchors.horizontalCenter: circulargauge_rpm.horizontalCenter
}

CircularGauge {
        objectName: "CircularGauge_Coolant"
	id: circulargauge_coolant
        property real gauge_value: 90.0
	anchors.left: circulargauge_rpm.right
        value: gauge_value
        maximumValue: 130.0  // Largest Value
        minimumValue: 0.0       // Smallest Value
        style: CircularGaugeStyle {
            id: style
            tickmarkStepSize: 10.0 // Tick Marks

            tickmark: Rectangle {
                visible: styleData.value < 8000 || styleData.value % 1000 == 0
                implicitWidth: outerRadius * 0.02
                antialiasing: true
                implicitHeight: outerRadius * 0.06
                color: styleData.value >= 8000 ? "#ff0000" : "#ff0000"
            }

           minorTickmark: Rectangle {
                visible: styleData.value < 8000
                implicitWidth: outerRadius * 0.01
                antialiasing: true
                implicitHeight: outerRadius * 0.03
                color: "#ff0000"
           }

           tickmarkLabel:  Text {
                font.pixelSize: Math.max(6, outerRadius * 0.1)
                text: styleData.value
                color: styleData.value >= 8000 ? "#ff0000" : "#ff0000"
                antialiasing: true
           }

           needle: Rectangle {
                y: outerRadius * 0.15
                implicitWidth: outerRadius * 0.03
                implicitHeight: outerRadius * 1.1
                antialiasing: true
                color: "#ff0000"
           }

           foreground: Item {
                Rectangle {
                     width: outerRadius * 0.2
                     height: width
                     radius: width / 2
                     color: "#b2b2b2"
                     anchors.centerIn: parent
                }
           }
      }
 }

Text {
    text: "Coolant [deg C]"
    font.family: "Helvetica"
    font.pointSize: 18
    color: "red"
    anchors.top: circulargauge_coolant.bottom
    anchors.horizontalCenter: circulargauge_coolant.horizontalCenter
}

CircularGauge {
        objectName: "CircularGauge_Load"
	id: circulargauge_load
        property real gauge_value: 0.0
	anchors.left: circulargauge_coolant.right
        value: gauge_value
        maximumValue: 100.0  // Largest Value
        minimumValue: 0.0       // Smallest Value
        style: CircularGaugeStyle {
            id: style
            tickmarkStepSize: 10.0 // Tick Marks

            tickmark: Rectangle {
                visible: styleData.value < 8000 || styleData.value % 1000 == 0
                implicitWidth: outerRadius * 0.02
                antialiasing: true
                implicitHeight: outerRadius * 0.06
                color: styleData.value >= 8000 ? "#ff0000" : "#ff0000"
            }

           minorTickmark: Rectangle {
                visible: styleData.value < 8000
                implicitWidth: outerRadius * 0.01
                antialiasing: true
                implicitHeight: outerRadius * 0.03
                color: "#ff0000"
           }

           tickmarkLabel:  Text {
                font.pixelSize: Math.max(6, outerRadius * 0.1)
                text: styleData.value
                color: styleData.value >= 8000 ? "#ff0000" : "#ff0000"
                antialiasing: true
           }

           needle: Rectangle {
                y: outerRadius * 0.15
                implicitWidth: outerRadius * 0.03
                implicitHeight: outerRadius * 1.1
                antialiasing: true
                color: "#ff0000"
           }

           foreground: Item {
                Rectangle {
                     width: outerRadius * 0.2
                     height: width
                     radius: width / 2
                     color: "#b2b2b2"
                     anchors.centerIn: parent
                }
           }
      }

 }

Text {
    text: "Load [%]"
    font.family: "Helvetica"
    font.pointSize: 18
    color: "red"
    anchors.top: circulargauge_load.bottom
    anchors.horizontalCenter: circulargauge_load.horizontalCenter
}
  
}
