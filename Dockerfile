FROM lnk2past/ruc-dev:latest

LABEL "repository"="https://github.com/Lnk2past/auto-grader-action"
LABEL "homepage"="https://github.com/Lnk2past/auto-grader-action"
LABEL "maintainer"="Lnk2past <Lnk2past@gmail.com>"

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
