FROM asciidoctor/docker-asciidoctor

WORKDIR /root

RUN gem install asciidoctor-pdf-cjk-kai_gen_gothic --no-ri --no-rdoc && \
    asciidoctor-pdf-cjk-kai_gen_gothic-install && \
    mkdir -p /root/.fonts && \
    curl -LO https://osdn.jp/downloads/users/8/8637/genshingothic-20150607.zip && \
    unzip genshingothic-20150607.zip && \
    curl -LO https://github.com/miiton/Cica/releases/download/v4.1.1/Cica-v4.1.1.zip && \
    unzip Cica-v4.1.1.zip && \
    mv *.ttf /root/.fonts/ && \
    rm -rf /root/*

WORKDIR /documents
