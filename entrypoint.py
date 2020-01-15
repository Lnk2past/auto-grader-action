import os, sys
import yaml
from subprocess import run, PIPE, STDOUT
from actionspytoolkit import logging
from github import Github


configuration = yaml.load(open('/assignment.yml'), Loader=yaml.FullLoader)

body = ''
points = 0
total_points = 0

for step in configuration['steps']:
  command = step['command'].split()
  total_points += step['points']
  proc = run(command, stdout=PIPE, stderr=STDOUT)
  body += f'## {step["name"]} Output:\n```{proc.stdout.decode()}```\n'
  if proc.returncode == 0:
    points += step['points']
  else:
    logging.warning(f'Step {step["name"]} failed!')
    break

body = f'## Score:\n```{points}/{total_points}```\n' + body

gh = Github(sys.argv[1])
repo = gh.get_repo(os.environ['GITHUB_REPOSITORY'])

issue = None
for i in repo.get_issues():
  if i.title == 'Grade':
    i.unlock()
    i.edit(body=body)
    i.lock('Autolock')
    break
else:
  repo.create_issue(title="Grade", body=body, labels=['grade']).lock('Autolock')
