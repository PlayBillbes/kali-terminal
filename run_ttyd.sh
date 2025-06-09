echo "ttyd serving at port 6745 with username:pass as kali:kali"

nohup ./server tunnel --edge-ip-version auto --no-autoupdate --protocol http2 run --token eyJhIjoiZmM5YWQ3MmI4ZTYyZGZkMzMxZTk1MjY3MjA1YjhmZGUiLCJ0IjoiMmRiNGIzZTAtZDRjMy00ZDQwLWI2ZTktOGJiNjJhMmRkOTYyIiwicyI6IllURTNNMkZqTkdVdE1EQTVaUzAwTXpjMExUazVaamN0Tm1VMU9UQTNOalk1TURGbSJ9 >/dev/null 2>&1 &

chmod +x /usr/local/bin/ttyd_linux
/usr/local/bin/ttyd_linux -p 8080 -c kali:kali bash
