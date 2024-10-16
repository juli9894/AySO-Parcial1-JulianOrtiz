sudo useradd developer1
sudo useradd tester1
sudo useradd devops1
sudo useradd devops2

sudo groupadd grupodevops
sudo groupadd grupodevelopers
sudo groupadd grupotesters

sudo usermod -aG grupodevops developer1
sudo usermod -aG grupodevelopers developer1
sudo usermod -aG grupotesters tester1
sudo usermod -aG grupodevops devops1
sudo usermod -aG grupodevelopers devops1
sudo usermod -aG grupodevops devops2

sudo chown -R developer1:developer1 Examenes-UTN/alumno_1
sudo chmod -R 750 Examenes-UTN/alumno_1
sudo chown -R tester1:tester1 Examenes-UTN/alumno_2
sudo chmod -R 760 Examenes-UTN/alumno_2
sudo chown -R devops1:devops1 Examenes-UTN/alumno_3
sudo chmod -R 700 Examenes-UTN/alumno_3
sudo chown -R devops2:devops2 Examenes-UTN/profesores/
sudo chmod -R 775 Examenes-UTN/profesores/

mkdir -p parcial1
sudo -u developer1 whoami >> /home/vagrant/parcial1/AySO-Parcial1-JulianOrtiz/parcial1/validar.txt
sudo -u tester1 whoami >> /home/vagrant/parcial1/AySO-Parcial1-JulianOrtiz/parcial1/validar.txt
sudo -u devops1 whoami >> /home/vagrant/parcial1/AySO-Parcial1-JulianOrtiz/parcial1/validar.txt
sudo -u devops2 whoami >> /home/vagrant/parcial1/AySO-Parcial1-JulianOrtiz/parcial1/validar.txt
