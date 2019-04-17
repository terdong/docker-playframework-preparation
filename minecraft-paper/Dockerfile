FROM azul/zulu-openjdk-alpine:8

MAINTAINER DongHee Kim <terdong@gmail.com>

ENV PAPER_DIR /usr/local/paper
ENV PAPER_JAR paperclip.jar
ENV PAPER_URL https://papermc.io/ci/job/Paper-1.13/lastSuccessfulBuild/artifact/$PAPER_JAR
ENV VOLUME_DIR /minecraft

RUN apk update && \
    apk add --no-cache bash curl wget libstdc++ && \
    mkdir -p $PAPER_DIR

WORKDIR $PAPER_DIR

RUN wget --no-check-certificate "$PAPER_URL" && \
    java -jar $PAPER_JAR && \
    sed -i 's/false/true/' eula.txt

USER root:1000

CMD mv -n ${PAPER_DIR}/eula.txt ${PAPER_DIR}/${PAPER_JAR} $VOLUME_DIR && \
    chmod -R 775 $VOLUME_DIR && \
    cd $VOLUME_DIR && \
    umask 002 && \
    java -Xms1G -Xmx4G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs -Duser.timezone=GMT+09:00 -jar $PAPER_JAR

WORKDIR $VOLUME_DIR
