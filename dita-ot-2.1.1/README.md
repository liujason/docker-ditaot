# Docker component for DITA OT 2.1.1 in a Java:7 container

https://hub.docker.com/r/liujason/ditaot/

DITA OT wrapped inside a docker container. This can be invoked directly from
outputGenerator (nodejs project) using dockerode.

Note: to actually use this docker, you should use -v to map host volume and specify input and output from the host volume. Otherwise, you can try the following commands to build some sample docs.

Some sample commands:
To run the docker and get default -help OT message:
`docker run -it liujason/ditaot:2.1.1`

To run the docker and build the source documentation:
`docker run liujason/ditaot:2.1.1 -f html5 -i ./dita-ot-2.1.1/docsrc/userguide.ditamap -v`

CURRENT PROBLEM: this is a memory hog, and is running very slow inside a vagrant
container. On parsing DITA-1.2-spec DITA source, it used up to 700MB, and took
nearly 7 minutes. On a dev vagrant with 1024 MB memory, it can't run with grunt
serve running in parallel. Grunt serve somehow thinks files are changing and
refreshes servers which also eats a lot of memory.
