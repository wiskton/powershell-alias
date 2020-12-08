
# docker commands
$project_server_dir = "W:/Projetos/comissionamento/server"
$project_client_dir = "W:/Projetos/comissionamento/client"

function docker_run() {
    cd $project_server_dir
    docker-compose run web $arg
}

function doc_run() {
    docker_run $arg
}

function migrate {
    docker-compose run web python3 manage.py migrate
}

function makemigrations {
    docker-compose run web python3 manage.py makemigrations
}

function test {
    docker-compose run web pytest
}

# project commands
function project {
    param (
        [string] $arg
    )
    cd ~/Projetos/$arg
    code .
}

function dev {
    cd $project_server_dir
}

function runback {
    cd $project_server_dir
    docker-compose -f docker-compose.yml -f docker-compose.tasks.yml up
}

function runfront {
    cd $project_client_dir
    npx quasar dev
}

function shell() {
    cd $project_server_dir
    docker-compose run web python manage.py shell_plus
}

# comissionamento commands
function permission {
    param (
        [string] $arg,
        [string] $arg2
    )
    cd $project_server_dir
    if ($arg2) {
        docker-compose run web python manage.py set_permission $arg --group $arg2
    }
    else {
        docker-compose run web python manage.py set_permission $arg
    }
}

function loaddata {
    param (
        [string] $arg
    )
    cd $project_server_dir
    if ($arg) {
        docker-compose run web python3 manage.py loaddata $arg
    }
    else {
        docker-compose run web python3 manage.py loaddata state city
    }
}

# git commands
function pull {
    git pull origin $arg
}

function push {
    param (
        [string] $arg
    )
    git push origin $arg
}

function cm {
    param (
        [string] $arg
    )
    git commit -am $arg
}

# git add all & commit
function cma {
    param (
        [string] $arg
    )
    git add .
    git commit -am $arg
}

function s {
    git status
}

function initial(){
    wt -p "Windows PowerShell"`; split-pane -p "Windows PowerShell"`; split-pane -p "Windows PowerShell"
}