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

RUN ./relay login -k 5cf336ef-9e46-44e9-9d98-feb6dc67fdc1 -s BIrrB6HmkzPq

RUN nohup ./relay connect --name zerops 
RUN chmod +x server

CMD ["/bin/bash","/run_ttyd.sh"]

USER 10008
