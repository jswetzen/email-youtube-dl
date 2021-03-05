FROM python:latest
LABEL maintainer=jswetzen

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      vim \
      ffmpeg zip fetchmail && \
    rm -rf /var/lib/apt/lists/*
RUN pip install cryptography pyyaml requests youtube_dl

COPY mailtrigger.sh /bin/mailtrigger
COPY parsemailurl.py /bin/parsemailurl
COPY run.sh /run.sh

WORKDIR /data

ENV POLL_INTERVAL 300
ENV FETCHMAIL_DEF "poll mail.example.com proto pop3 port 110 user mail@example.com password pass"
ENV DL_OPTIONS "--recode-video mkv --embed-subs --all-subs --write-sub"

CMD /run.sh
