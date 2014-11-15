#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickItem>

#include "buttonhandler.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;

    QQmlComponent qComponent(&engine,
        QUrl(QStringLiteral("qrc:/main.qml")));
    QObject *qObject = qComponent.create();

    QObject *qCalendarButton = qObject->findChild<QObject*>("calendarButton");
    if(qCalendarButton){
        ButtonHandler *calendarButton = new ButtonHandler(qCalendarButton);
        calendarButton->ConnectSignalWithSlot();
    }

    return app.exec();
}
