FROM java:7

RUN mkdir -p /usr/src/DITA-OT \
    && curl -SL https://github.com/dita-ot/dita-ot/releases/download/2.1.1/dita-ot-2.1.1.tar.gz \
    | tar -xzC /usr/src/DITA-OT

ENV PATH /usr/src/DITA-OT/dita-ot-2.1.1/bin:$PATH
WORKDIR /usr/src/DITA-OT/dita-ot-2.1.1
ENTRYPOINT ["/usr/src/DITA-OT/dita-ot-2.1.1/bin/dita"]
CMD ["-help"]
