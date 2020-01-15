FROM lnk2past/ruc-dev:latest

LABEL "repository"="https://github.com/Lnk2past/auto-grader-action"
LABEL "homepage"="https://github.com/Lnk2past/auto-grader-action"
LABEL "maintainer"="Lnk2past <Lnk2past@gmail.com>"

RUN pip3 install actionspytoolkit

COPY entrypoint.py /entrypoint.py
RUN chmod 777 /entrypoint.py

ENTRYPOINT ["python3", "/entrypoint.py"]
