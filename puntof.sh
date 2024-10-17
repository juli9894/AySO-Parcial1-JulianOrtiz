echo "Mi IP Publica es: $(curl -s ifconfig.me )" > parcial1/Filtro_Avanzado.txt
echo "Mi Usuario es: $(whoami)" >> parcial1/Filtro_Avanzado.txt 
echo "El Hash de mi Usuario es: $(sudo cat /etc/shadow |grep vagr|awk -F ':' '{print $2}')" >> parcial1/Filtro_Avanzado.txt
