FROM jenkins/jenkins:2.190.1-centos
USER root
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
    && yum install -y yum-utils device-mapper-persistent-data lvm2 docker-ce-cli \
    && rm -rf /var/cache/yum/* && yum clean all
RUN curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl
COPY --chown=jenkins:jenkins ./id_rsa /tmp/id_rsa
COPY --chown=jenkins:jenkins ./id_rsa.pub /tmp/id_rsa.pub
COPY ./jenkins.sh /usr/local/bin/jenkins.sh
RUN chmod 0600 /tmp/id_rsa && chmod 0600 /tmp/id_rsa.pub \
    && chmod 0775 /usr/local/bin/jenkins.sh
USER jenkins
# JAVA_OPTS：JVM設定。JVM(Java仮想サーバー)。Javaを動かすためのサーバー設定。
ENV JAVA_OPTS -Djava.awt.headless=true -Dorg.apache.commons.jelly.tags.fmt.timeZone=Asia/Tokyo -Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8
# ポートフォワード
EXPOSE 8080 50000
# コンテナ実行時のコマンド
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
