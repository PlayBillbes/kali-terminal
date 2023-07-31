echo "ttyd serving at port 6745 with username:pass as kali:kali"
chmod +x /usr/local/bin/ttyd_linux
/usr/local/bin/ttyd_linux -p 80 -c kali:kali bash
