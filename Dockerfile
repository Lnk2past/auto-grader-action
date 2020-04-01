FROM lnk2past/turtleshell:latest

LABEL "repository"="https://github.com/Lnk2past/auto-grader-action"
LABEL "homepage"="https://github.com/Lnk2past/auto-grader-action"
LABEL "maintainer"="Lnk2past <Lnk2past@gmail.com>"

COPY assignment.yml /assignment.yml
COPY entrypoint.py /entrypoint.py

RUN pip install actionspytoolkit pyyaml

ENTRYPOINT ["python", "/entrypoint.py"]
