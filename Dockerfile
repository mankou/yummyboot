FROM openjdk:11.0.11-jre-slim
ARG ARTIFACT_ID
ARG VERSION
ARG TAR_FILE
ARG PORT
ADD target/${TAR_FILE} /app
ENV JVM_OPT_DOCKER ""
ENV PROGRAM_OPT_DOCKER ""
COPY src/main/resources/build/docker/Shanghai /etc/localtime
RUN set -eux; \
    ln -s /app/${ARTIFACT_ID}-${VERSION} /app/${ARTIFACT_ID}; \
    echo "Asia/Shanghai" > /etc/timezone
# VOLUME /app/${ARTIFACT_ID}/logs
WORKDIR /app/${ARTIFACT_ID}
ENTRYPOINT ["bin/runjar-docker.sh","-v","start"]
EXPOSE ${PORT}