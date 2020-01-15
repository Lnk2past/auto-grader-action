from subprocess import run, PIPE, STDOUT
import actionspytoolkit as atk

score = 0.0
build_output = ''
test_output = ''

proc = run(['make'], stdout=PIPE, stderr=STDOUT)
build_output = f'{proc.stdout.decode()}'
if proc.returncode == 0:
  score += 7.5
  proc = run(['make', 'test'], stdout=PIPE, stderr=STDOUT)
  test_output = f'{proc.stdout.decode()}'
  if proc.returncode == 0:
    score += 7.5

atk.logging.set_output('build_output', build_output)
atk.logging.set_output('test_output', test_output)
atk.logging.set_output('score', score)
