#include "motoguy.h"

MotoGuy::MotoGuy()
{

}
void MotoGuy::setName(QString name)
{
    m_name = name;
    m_names.append(name);
    indexname++;
}

void MotoGuy::setTime(double time)
{
    m_time = time;
    m_times.append(time);
    indextime++;
}

int MotoGuy::getTime()
{
    return m_time;
}

QString MotoGuy::getName()
{
    return m_name;
}
QString MotoGuy::get_names(int index)
{
    return m_names.at(index);
}

double MotoGuy::get_times(int index)
{
    return m_times.at(index);
}
