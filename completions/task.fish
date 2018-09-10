set -l task_names (cat Taskfile.yml ^ /dev/null | yq .tasks | jq keys | grep '"' | sed 's/[",]//g' | string trim | string join ' ')
test -z $task_names; and set task_names ''
complete -c task -a $task_names
complete -c task --no-files

complete -c task -s d -l dir      -d 'sets directory of execution' \
    --require-parameter
complete -c task      -l dry      -d 'compiles and prints tasks in the order that they would be run, without executing them'
complete -c task -s f -l force    -d 'forces execution even when the task is up-to-date'
complete -c task -s h -l help
complete -c task -s i -l init     -d 'creates a new Taskfile.yml in the current folder'
complete -c task -s l -l list     -d 'lists tasks with description of current Taskfile'
complete -c task -s s -l silent   -d 'disables echoing'
complete -c task      -l status   -d 'exits with non-zero exit code if any of the given tasks is not up-to-date'
complete -c task -s v -l verbose  -d 'enables verbose mode'
complete -c task      -l version  -d 'show Task version'
complete -c task -s w -l watch    -d 'enables watch of the given task'
