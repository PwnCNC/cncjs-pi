# Firewall

The setup.sh file will configure iptables to redirect all port 80 requests to port 8080 which is served up by CNCJS.  It will also pull in iptables-persistent to ensure the settings are saved and regularly reloaded.
