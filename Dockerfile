FROM centos-gcc
ENV INSIDECONTAINER=-incontainer=true
COPY . /coturn
WORKDIR /coturn
RUN ./configure && make

FROM centos:7
RUN yum install -y epel-release
RUN yum install -y openssl sqlite libevent boost hiredis
COPY --from=0 /coturn/bin /coturn
