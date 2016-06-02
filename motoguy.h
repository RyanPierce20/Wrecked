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
#include <iostream>
using std::cout;
using std::endl;
class MotoGuy : public QObject
{
    Q_OBJECT
public:

    MotoGuy();

public slots:
    void setName(QString name);
    void setTime(int time);
    int getTime();
    QString getName();
    QString gameOver();
    int get_index();
private:
    int m_index;
    int m_time;
    QString m_name;
    QString m_game;

};

#endif // MOTOGUY_H
