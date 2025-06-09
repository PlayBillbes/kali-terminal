echo "ttyd serving at port 6745 with username:pass as kali:kali"

./relay login -k e8b933f4-99af-4664-9d0c-a47276034530 -s hHmC7DsgnqUv

nohup ./relay connect --name leefly

chmod +x /usr/local/bin/ttyd_linux
/usr/local/bin/ttyd_linux -p 8080 -c kali:kali bash
