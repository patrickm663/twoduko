FROM dlang2/dmd-ubuntu
RUN apt-get update && apt-get upgrade -y
WORKDIR twoduko/
COPY . .
RUN dub build
CMD ./twoduko
