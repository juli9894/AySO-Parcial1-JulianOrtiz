#####Instrucciones para particionar#####

#Antes de las particiones
lsblk

# NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
# loop0    7:0    0 63.9M  1 loop /snap/core20/2318
# loop1    7:1    0 38.8M  1 loop /snap/snapd/21759
# loop2    7:2    0   87M  1 loop /snap/lxd/29351
# loop3    7:3    0   64M  1 loop /snap/core20/2379
# sda      8:0    0   40G  0 disk
# └─sda1   8:1    0   40G  0 part /
# sdb      8:16   0   10M  0 disk
# sdc      8:32   0   10G  0 disk
# sdd      8:48   0    2G  0 disk


#Ejecutar programa particionamiento
sudo fdisk /dev/sdc

#Dentro del programa
##Particiones primarias (repetir procedimiento 3 veces para 3 particiones iguales(2,5GB))
#help
m

#particiones
p

#nueva particion
n

#primaria
p

#numero particion (1,2,3 por defecto)
presionar tecla enter

#sector (por defecto)
presionar tecla enter

#tamaño particion
+2.5G

##Particion extendida

#particiones
p

#nueva particion
n

#extendida
e

#numero particion (por defecto)
presionar tecla enter

#primer sector (por defecto)
presionar tecla enter

#tamaño particion
+2.3G

#Despues de las particiones

lsblk
# NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
# loop0    7:0    0 63.9M  1 loop /snap/core20/2318
# loop1    7:1    0 38.8M  1 loop /snap/snapd/21759
# loop2    7:2    0   87M  1 loop /snap/lxd/29351
# loop3    7:3    0   64M  1 loop /snap/core20/2379
# sda      8:0    0   40G  0 disk
# └─sda1   8:1    0   40G  0 part /
# sdb      8:16   0   10M  0 disk
# sdc      8:32   0   10G  0 disk
# ├─sdc1   8:33   0  2.5G  0 part
# ├─sdc2   8:34   0  2.5G  0 part
# ├─sdc3   8:35   0  2.5G  0 part
# └─sdc4   8:36   0    1K  0 part
# sdd      8:48   0    2G  0 disk


##Formateo particiones primarias
sudo mkfs.ext4 /dev/sdc1
sudo mkfs.ext4 /dev/sdc2
sudo mkfs.ext4 /dev/sdc3

#Verificar formateo
lsblk -f

##Creacion de directorios /mnt/
sudo mkdir -p /mnt/sdc1
sudo mkdir -p /mnt/sdc2
sudo mkdir -p /mnt/sdc3

##Montaje de particiones
sudo mount /dev/sdc1 /mnt/sdc1
sudo mount /dev/sdc2 /mnt/sdc2
sudo mount /dev/sdc3 /mnt/sdc3

## Verificar montaje
df -h
# Filesystem        Size  Used Avail Use% Mounted on
# tmpfs             197M  1.1M  196M   1% /run                # Sistema de archivos temporal en RAM
# /dev/sda1          39G  2.1G   37G   6% /                    # Partición principal del sistema
# tmpfs             982M     0  982M   0% /dev/shm             # Sistema de archivos temporal para compartición de memoria
# tmpfs             5.0M     0  5.0M   0% /run/lock           # Sistema de archivos temporal para bloquear archivos en ejecución
# home_vagrant_foo  931G  621G  310G  67% /home/vagrant/foo    # Partición montada en el directorio home de vagrant
# tmpfs             197M  4.0K  197M   1% /run/user/1000       # Sistema de archivos temporal para el usuario
# /dev/sdc1         2.4G   24K  2.3G   1% /mnt/sdc1           # Primera partición montada en /mnt/sdc1
# /dev/sdc2         2.4G   24K  2.3G   1% /mnt/sdc2           # Segunda partición montada en /mnt/sdc2
# /dev/sdc3         2.4G   24K  2.3G   1% /mnt/sdc3           # Tercera partición montada en /mnt/sdc3


