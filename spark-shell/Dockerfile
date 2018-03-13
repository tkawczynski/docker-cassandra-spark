FROM spark-base

ADD run.sh /
RUN chmod +x /run.sh

EXPOSE 4040

USER spark
ENTRYPOINT ["/bin/bash", "/run.sh"]
