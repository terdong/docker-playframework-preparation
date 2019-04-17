FROM terdong/playframework-preparation:latest
MAINTAINER DongHee Kim <terdong@gmail.com>

ENV PROJECT_HOME /usr/src
WORKDIR $PROJECT_HOME

ENV GITHUB_PROJECT_NAME play-scala-starter-example
ENV GITHUB_URL https://github.com/playframework/${GITHUB_PROJECT_NAME}.git

RUN git clone $GITHUB_URL

WORKDIR $GITHUB_PROJECT_NAME

RUN sed -i "s/#allowed = \[\".example.com\", \"localhost:9000\"\]/allowed = \[\".\"\]/" conf/application.conf \
 && sed -i "s/).e/).settings(sources in (Compile, doc) := Seq.empty).e/" build.sbt \
 && sed -i "s/changeme/changedyou/" conf/application.conf

RUN sbt compile 
RUN sbt stage

ENV PLAY_EXAMPLE_EXECUTE $GITHUB_PROJECT_NAME

WORKDIR target/universal/stage/bin

CMD ./$PLAY_EXAMPLE_EXECUTE -Dhttp.port=8080

EXPOSE 8080
