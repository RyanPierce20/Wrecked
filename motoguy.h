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

class MotoGuy : public QObject
{
    Q_OBJECT
public:

    MotoGuy();

public slots:
    void setName(QString name);
    void setTime(double time);
    QString get_names(int index);
    double get_times(int index);
    int getTime();
    QString getName();
private:
    int indextime;
    int indexname;
    double m_time;
    QString m_name;
    QList<QString> m_names;
    QList<double> m_times;

};

#endif // MOTOGUY_H
