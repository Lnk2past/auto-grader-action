# auto-grader-action

This action is meant to be an example of one used by an instructor for a particular course.

## Usage

Fork/copy this action and update the files `Dockerfile` and `assignment.yml` as needed. The Dockerfile is the environment in which you want your grading to execute. The YAML configuration describes how to grade an assignment. e.g.

```yaml
steps:
  - name: Build
    command: make
    points: 7.5
  - name: Test
    command: make test
    points: 7.5
issue:
  name: Grade
  labels:
    - grade
  assignees:
    - Lnk2past
```

This grading template is comprised of two steps that build and test the assignment. Each step is given a command to execute for that step and a point value upon the command successfully completing. We also define the issue to open up to provide a grade report to the student. Here we open/edit an issue named "Grade", give it the "grade" label, and assign it to the user "Lnk2past". The output of each step is recorded, and a simply formatted markdown response is written to the issue. If the issue exists, it is overwritten.
