#!/bin/sh

# ------------------------------------------------------------------------------
# GENERAL FUNCTIONS
# ------------------------------------------------------------------------------

display_version() {
    printf "dockerfiles version %s\n" "$1"
}

display_help() {
    cat <<-EOF
usage:
    [options] [command] [args]
    commands:
        ./actions.sh build <image>          build a docker image
        ./actions.sh compile <image> <tag>  build, tag and push an image to DockerHub
        ./actions.sh pull <image>           pull a new docker image from DockerHub
        ./actions.sh push <image>           push a docker image to DockerHub
        ./actions.sh run <image>            run a docker image
        ./actions.sh tag <image> <tag>      add a tag to a docker image
    options:
        -V, --version                       Output current version of actions.sh
        -h, --help                          Display this help information
EOF
}

# ------------------------------------------------------------------------------
# VALIDATION FUNCTIONS
# ------------------------------------------------------------------------------

validate() {
    if [ $# != $1 ]; then
        echo "ERROR: Incorrect usage\n"
        display_help
        exit 0
    fi
}

# ------------------------------------------------------------------------------
# DOCKER FUNCTIONS
# ------------------------------------------------------------------------------

build() {
    docker build -t $1 -f src/$2.Dockerfile .
}

pull() {
    docker pull $1
}

push() {
    docker push $1
}

run() {
    docker run -it $1 /bin/bash
}

tag() {
    docker tag $1 $2
}

controller() {
    VERSION="1.0.0"
    DOCKER_USER="suddi"

    case "$1" in
        -V|--version)
            display_version $VERSION
            ;;
        -h|--help)
            display_help
            ;;
        build)
            validate 3 $@
            docker_image=$DOCKER_USER/$2
            build $docker_image $2
            ;;
        compile)
            validate 4 $@
            docker_image=$DOCKER_USER/$2
            build $docker_image $2
            tag $docker_image $3
            push $1
            ;;
        pull)
            validate 3 $@
            docker_image=$DOCKER_USER/$2
            pull $docker_image
            ;;
        push)
            validate 3 $@
            docker_image=$DOCKER_USER/$2
            push $docker_image
            ;;
        run)
            validate 3 $@
            docker_image=$DOCKER_USER/$2
            run $docker_image
            ;;
        tag)
            validate 4 $@
            docker_image=$DOCKER_USER/$2
            validate $3
            tag $docker_image $3
            ;;
        *)
            validate 2 $@
    esac

}

controller "$@"
