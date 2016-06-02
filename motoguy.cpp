#include "motoguy.h"

MotoGuy::MotoGuy():m_index(0)
{

}
void MotoGuy::setName(QString name)
{
    m_name = name;
}

void MotoGuy::setTime(int time)
{
    m_time = time;
}

int MotoGuy::getTime()
{
    return m_time;
}

QString MotoGuy::getName()
{
    return m_name;
}

int MotoGuy::get_index()
{
    return m_index;
}
QString MotoGuy::gameOver()
{
    m_game = "WRECKED";
    return m_game;
}
