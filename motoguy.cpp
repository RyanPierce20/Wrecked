#include "motoguy.h"

MotoGuy::MotoGuy()
{

}
void MotoGuy::SetName(QString name)
{
    m_name = name;
}

void MotoGuy::SetTime(double time)
{
    m_time = time;
}

int MotoGuy::GetTime()
{
    return m_time;
}

QString MotoGuy::GetName()
{
    return m_name;
}
