######## BUILDER ########

# Set the base image
FROM steamcmd/steamcmd:ubuntu-20

RUN mkdir /satisfactory
WORKDIR /satisfactory

# install satisfactory
RUN steamcmd +force_install_dir /satisfactory \
    +login anonymous \
    +app_update 1690800 -beta experimental validate \
    +quit

# RUN apk add --no-cache file libc6-compat gcc gcc6 \
#     && ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2

# RUN apk add --no-cache file binutils gcompat sdl2

RUN mkdir -p /steam \
    && useradd -m steam \
    && chmod 777 /root /satisfactory

COPY . .

USER steam
ENV home /home/steam

# Set default command
ENTRYPOINT ["./FactoryServer.sh"]
CMD [ \
    "-⁠ServerQueryPort=15777", \
    "-⁠BeaconPort=15000", \
    "-Port=7777", \
    "-unattended" \
]

# ENTRYPOINT ["cat"]
# CMD [ "/satisfactory/Engine/Binaries/Linux/UE4Server-Linux-Shipping" ]

EXPOSE 15777/udp
EXPOSE 15000/udp
EXPOSE 7777/udp
