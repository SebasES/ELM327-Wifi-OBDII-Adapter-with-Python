#!/usr/bin/env python3
import sys
import time
from PyQt5.QtCore import QObject, QUrl, Qt, pyqtProperty, pyqtSignal
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine, qmlRegisterType, QQmlEngine, QQmlComponent
from PyQt5 import QtCore, QtGui
from PyQt5.QtQuick import QQuickView
import time

if __name__ == "__main__":
    app = QApplication(sys.argv)
    view = QQuickView()
    view.setSource(QUrl('full_dash.qml'))
    gauge_rpm=view.findChild(QObject,'CircularGauge_RPM')
    gauge_coolant=view.findChild(QObject,'CircularGauge_Coolant')
    gauge_load=view.findChild(QObject,'CircularGauge_Load')
    view.showFullScreen()
    gauge_rpm.setProperty('gauge_value',4000)
    gauge_coolant.setProperty('gauge_value',90)
    gauge_load.setProperty('gauge_value',0)
    sys.exit(app.exec_())
