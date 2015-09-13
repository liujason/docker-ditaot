# Docker for DITA Open Toolkit

https://hub.docker.com/r/liujason/ditaot/

OT Version 2.1.1 is pulled into a Java:7 container.

Note: to actually use this docker, you should use -v to map host volume and specify input and output from the host volume. Otherwise, you can try the following commands to build some sample docs.

Some sample commands:
To run the docker and get default -help OT message:
`docker run -it liujason/ditaot:2.1.1`

To run the docker and build the source documentation:
`docker run liujason/ditaot:2.1.1 -f html5 -i ./dita-ot-2.1.1/docsrc/userguide.ditamap -v`
