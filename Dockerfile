FROM pman0214/h8300-elf-gcc-alpine

ADD ./patches /tmp/patches

RUN set -x && \
	apk update && \
	apk add --no-cache --virtual .build-tools patch boost-dev && \
	apk add --no-cache make perl boost && \
	echo '### download asp' && \
	cd / && \
	wget https://www.toppers.jp/download.cgi/asp-1.7.0.tar.gz -O - | tar zx && \
	wget https://www.toppers.jp/download.cgi/asp_arch_h8300h_gcc-1.7.0.tar.gz -O - | tar zx && \
	cd /asp && \
	patch -p1 < /tmp/patches/target_akih8_gcc-elf.patch && \
	echo '### build configurator' && \
	wget https://www.toppers.jp/download.cgi/cfg-1.9.6.tar.gz -O - | tar zx && \
	patch -p1 < /tmp/patches/cfg_boost-1.72.patch && \
	cd cfg && \
	cat configure | tr -d "\x0d" > configure_lf && \
	mv configure_lf configure && \
	chmod 755 configure && \
	./configure && \
	make && \
	echo '### use newer configure for perl5' && \
	cd /tmp && \
	wget https://www.toppers.jp/download.cgi/asp-1.9.3.tar.gz -O - | tar zx && \
	cd /asp && \
	cp -f /tmp/asp/configure ./ && \
	echo '### cleanup' && \
	cd / && \
	apk del --purge .build-tools && \
	rm -rf /tmp/asp && \
	rm -rf /tmp/patches && \
	rm -rf /var/cache/apk && \
	mkdir /var/cache/apk

#--------------------------------------------------
WORKDIR /app
ENTRYPOINT ["/bin/sh", "-c"]
