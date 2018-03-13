FROM spark-base

ADD master.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080

EXPOSE 8080 7077 6066

USER spark

CMD ["/bin/bash", "/master.sh"]

