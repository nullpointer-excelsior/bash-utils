
# todas las conecciones establecidas
netstat -natup

# ver sobrecarga servidor lo ideal es siempre menor a 1
cat /proc/loadavg

# ver puertos usados en MAC os
sudo lsof -i tcp:8080

# ports connections mac os
netstat -a -Ptcp | egrep 'tcp4.*LISTEN