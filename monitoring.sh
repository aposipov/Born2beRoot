arc=$(uname -a)
pcpu=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)
vcpu=$(grep "^processor" /proc/cpuinfo | wc -l)
fram=$(free -m |awk '$1 == "Mem:" {print $2}')
uram=$(free -m |awk '$1 == "Mem:" {print $3}')
pram=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')
disk=$(echo `df -h / | awk 'NR==2{printf("%s/%s (%d%%)\n", $3, $2, $5)}'`)
cpul=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')
lb=$(who -b | awk '{print $3 " " $4}')
lvm=$( cat /etc/fstab | grep "/dev/mapper" | wc -l )
lvmt=$(if [ $lvm -eq 0 ]; then echo "no"; else echo "yes"; fi;)
ctcp=$(netstat -natp | grep "ESTABLISHED" | wc -l)
ulog=$(users | wc -w)
ip=$(hostname -I)
mac=$(ip link show | awk '$1 == "link/ether" {print $2}')
cmds=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

wall "
        #Architecture: $arc
        #CPU physical: $pcpu
        #vCPU: $vcpu
        #Memory Usage: $uram/${fram}MB ($pram%)
        #Disk Usage: $disk
        #CPU load: $cpul
        #Last boot: $lb
        #LVM use: $lvmt
        #Connex1ons TCP: $ctcp ESTABLISHED
        #User log: $ulog
        #Network: IP $ip ($mac)
        #Sudo: $cmds cmd"
