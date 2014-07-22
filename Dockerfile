FROM debian:jessie

RUN apt-get update && apt-get install -y \
	curl 

RUN \
	cd /tmp && \
	curl -sOL https://s3.amazonaws.com/newsdev-pub/centrifuge/0.1.0/centrifuge-0.1.0-linux-amd64.tar.gz && \
	echo '1f2452f98a41479c946ccb907017ffb635b4ecaa  centrifuge-0.1.0-linux-amd64.tar.gz' | sha1sum -c - && \
	tar -xzf centrifuge-0.1.0-linux-amd64.tar.gz && \
    mv centrifuge-0.1.0-linux-amd64/bin/centrifuge /usr/local/bin && \
	rm -rf /tmp/centrifuge-0.1.0-linux-amd64*

ENTRYPOINT ["/usr/local/bin/centrifuge"]
