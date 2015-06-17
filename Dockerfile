FROM java:8

MAINTAINER https://github.com/objectuser/dynamodb-local

RUN mkdir /opt/dynamodb \
  && curl -o dynamodb.tar.gz -L http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz \
  && tar zxvf dynamodb.tar.gz --directory /opt/dynamodb \
  && rm dynamodb.tar.gz

EXPOSE 8000

CMD java -Djava.library.path=/opt/dynamodb/DynamoDBLocal_lib -jar /opt/dynamodb/DynamoDBLocal.jar -inMemory


