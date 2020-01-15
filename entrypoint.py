import os, sys
from subprocess import run, PIPE, STDOUT
from actionspytoolkit import logging
from github import Github

score = 0.0
build_output = ''
test_output = ''

logging.warning(f'ARGV: {sys.argv}')
logging.warning(f'ENV: {os.environ["GITHUB_REPOSITORY"]}')

proc = run(['make'], stdout=PIPE, stderr=STDOUT)
build_output = f'{proc.stdout.decode()}'
if proc.returncode == 0:
  score += 7.5
  proc = run(['make', 'test'], stdout=PIPE, stderr=STDOUT)
  test_output = f'{proc.stdout.decode()}'
  if proc.returncode == 0:
    score += 7.5

logging.set_output('build_output', build_output)
logging.set_output('test_output', test_output)
logging.set_output('score', score)

gh = Github(sys.argv[1])
repo = gh.get_repo(os.environ['GITHUB_REPOSITORY'])
body = '## Score:\n{}/15\n## Build Output:\n```{}```\n## Test Output:\n```{}```'.format(score, build_output, test_output)

issue = None
for i in repo.get_issues():
  if i.title == 'Grade':
    i.edit(body=body)
    break
else:
  repo.create_issue(title="Grade", body=body, labels=['grade'])
