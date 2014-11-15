#ifndef BUTTONHANDLER_H
#define BUTTONHANDLER_H

#include <QObject>

class ButtonHandler : public QObject
{
    Q_OBJECT
public:
    ButtonHandler(QObject *qObject);
    void ConnectSignalWithSlot();

private slots:
    void onClickHandler();

private:
    QObject *m_qButtonObject;
};

#endif // BUTTONHANDLER_H
