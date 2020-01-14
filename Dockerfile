FROM alpine

LABEL "repository"="https://github.com/Lnk2past/auto-grader-action"
LABEL "homepage"="https://github.com/Lnk2past/auto-grader-action"
LABEL "maintainer"="Lnk2past <Lnk2past@gmail.com>"

RUN apk add --no-cache git g++ make python3-dev jpeg-dev zlib-dev
RUN pip3 install contest PyGithub bokeh

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
