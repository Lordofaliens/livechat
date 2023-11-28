FROM openjdk AS build
LABEL authors="@lordofaliens"

RUN apk --no-cache add maven

WORKDIR /livechat

COPY . .

RUN mvn clean package

FROM openjdk AS runtime

WORKDIR /livechat

COPY target/LiveChat-LiveChat.jar /livechat/LiveChat-LiveChat.jar

EXPOSE 8080

CMD ["java", "-jar", "LiveChat-LiveChat.jar"]