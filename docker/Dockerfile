FROM centos:7
RUN yum -y update
RUN yum -y install gcc make file
RUN mkdir /root/build
WORKDIR /root/build
COPY binutils-2.29.tar.gz .
COPY gcc-7.1.0.tar.gz .
RUN tar xfz binutils-2.29.tar.gz
RUN tar xfz gcc-7.1.0.tar.gz
RUN mkdir binutils-build
RUN mkdir gcc-build
WORKDIR binutils-build
RUN ../binutils-2.29/configure --prefix=/usr/local --target=x86_64-elf
RUN make
RUN make install
WORKDIR ../gcc-build
RUN yum -y install gmp-devel mpfr-devel libmpc-devel gcc-c++
RUN ../gcc-7.1.0/configure --prefix=/usr/local --target=x86_64-elf --enable-languages=c --without-headers
RUN make all-gcc
RUN make all-target-libgcc
RUN make install-gcc
RUN make install-target-libgcc
WORKDIR /root/build
COPY qemu-2.9.0.tar.xz .
RUN xz -dc qemu-2.9.0.tar.xz | tar xvf -
WORKDIR qemu-2.9.0
RUN yum -yq install zlib-devel automake autoconf libtool glib2-devel
RUN ./configure --prefix=/usr/local --target-list=x86_64-softmmu
RUN make
RUN make install
WORKDIR /root/build
COPY nasm-2.13.01.tar.gz .
RUN tar xfz nasm-2.13.01.tar.gz
WORKDIR nasm-2.13.01
RUN ./configure --prefix=/usr/local
RUN make
RUN make install
WORKDIR /root/build
RUN yum -y -q install git grub2 grub2-tools
COPY xorriso-1.4.6.tar.gz .
RUN tar xfz xorriso-1.4.6.tar.gz
WORKDIR xorriso-1.4.6
RUN ./configure --prefix=/usr/local
RUN make
RUN make install
RUN rm -fr /root/build
WORKDIR /
