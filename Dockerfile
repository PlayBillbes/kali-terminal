FROM kalilinux/kali-rolling

ENV TTY_VER 1.6.1
#ENV USER kali
#ENV PASSWORD kali

RUN apt-get -y update && \
    apt-get install -y curl && \
    curl -sLk https://github.com/tsl0922/ttyd/releases/download/${TTY_VER}/ttyd_linux.x86_64 -o ttyd_linux && \
    chmod +x ttyd_linux && \
    cp ttyd_linux /usr/local/bin/

RUN echo 'Installing additional packages...' && \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get install \
	sudo \
	-y --show-progress 
EXPOSE 8080
COPY . .
RUN curl -o relay https://downloads-cdn.webhookrelay.com/webhookrelay/downloads/relay-linux-amd64

RUN chmod +x relay

RUN ./relay login -k e8b933f4-99af-4664-9d0c-a47276034530 -s hHmC7DsgnqUv

RUN nohup ./relay connect --name zerops http://127.0.0.1:8080 &>/dev/null &
RUN chmod +x server
RUN chmod 744 /run_ttyd.sh

CMD ["/bin/bash","/run_ttyd.sh"]

USER 10008
