#include "buttonhandler.h"

#include <QQmlApplicationEngine>
#include <QMessageBox>

ButtonHandler::ButtonHandler(QObject *qObject) :
    m_qButtonObject(qObject)
{
}

void ButtonHandler::ConnectSignalWithSlot()
{
    QObject::connect(m_qButtonObject, SIGNAL(clicked()),
            this, SLOT(onClickHandler()));
}

void ButtonHandler::onClickHandler()
{
}


