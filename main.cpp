#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "motoguy.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    MotoGuy names;

    QCoreApplication::setApplicationName("MusicSettings");
    QCoreApplication::setOrganizationName("OnOffMusic");
    QCoreApplication::setOrganizationDomain(".com");

    engine.rootContext()->setContextProperty("MotorcycleGuy", &names);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
