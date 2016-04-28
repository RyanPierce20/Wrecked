#ifndef MOTOGUY_H
#define MOTOGUY_H

#include <QString>
#include <QObject>
#include <QDebug>
/*
 * I added this class so I can keep track of the scores if the user plays it multiple times.
 * I will display the scores they get after each game they finish, then I'll implement it once
 * I've got the game running.
 * **/

class MotoGuy
{
public:
    MotoGuy();
    void SetName(QString name);
    void SetTime(double time);
    int GetTime();
    QString GetName();
private:
    double m_time;
    QString m_name;

};

#endif // MOTOGUY_H
