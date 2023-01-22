# vim:set ft=dockerfile:
FROM ubuntu:22.04
MAINTAINER Allan Køtter

ENV LANG C.utf8

RUN apt-get update && apt-get install -y \
    ca-certificates \
    wget \
    gfortran \
    make \
    unzip \
  && rm -rf /var/lib/apt/lists/*

# Download Modflow 6
RUN wget -q -O tmp.zip https://github.com/MODFLOW-USGS/modflow6/releases/download/6.4.1/mf6.4.1_linux.zip \
  && unzip tmp.zip \
  && rm tmp.zip \
  && mv mf6.4.1_linux mf6

# Compile Modflow 6
RUN cd /mf6/make \
  && make \
  && ln -s /mf6/bin/mf6 /usr/local/bin/mf6

RUN cd /mf6/examples \
  && sed -i 's/..\/..\/bin\///g' runall.sh

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create user/group Modflow
RUN groupadd -r mf --gid=999 \
  && useradd -m -g mf --uid=999 mf \
  && mkdir /workspace \
  && chown mf:mf -R /workspace \
  && chown mf:mf -R /mf6

COPY run.sh /workspace/run.sh
RUN ["chmod", "+x", "/workspace/run.sh"]

USER mf
WORKDIR /workspace
RUN ["mkdir", "model"]

CMD ["./run.sh"]
