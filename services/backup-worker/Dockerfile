FROM mongo

RUN apt-get update && apt-get -y install awscli

WORKDIR /app
COPY . /app
RUN chmod u+x /app/initialize-from-s3.sh

CMD /app/initialize-from-s3.sh && tail -f /dev/null
