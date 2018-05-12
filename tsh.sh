#!/bin/bash

# Turtle SSH: A convenience wrapper around ssh to make your wildest dreams come true
#
#                               ___-------___
#                           _-~~             ~~-_
#                        _-~                    /~-_
#     /^\__/^\         /~  \                   /    \
#   /|  O|| O|        /      \_______________/        \
#  | |___||__|      /       /                \          \
#  |          \    /      /                    \          \
#  |   (_______) /______/                        \_________ \
#  |         / /         \                      /            \
#   \         \^\\         \                  /               \     /
#     \         ||           \______________/      _-_       //\__//
#       \       ||------_-~~-_ ------------- \ --/~   ~\    || __/
#         ~-----||====/~     |==================|       |/~~~~~
#          (_(__/  ./     /                    \_\      \.
#                 (_(___/                         \_____)_)
#

USAGE='Usage: tsh HOST [OPTIONS] [SSH OPTIONS]
       OPTIONS:
           --help: duh
           --vim: Copy local .vimrc onto destination machine
           --tunnel PORT: creates a tunnel between DESTINATION:PORT and localhost:PORT'
if [ "$1" == "--help" ]; then
    echo "$USAGE"
    exit 0
fi

# Map hostname shortcuts
declare -A HOST_MAP=(["alias"]="user@server")

# No hostname provided?
if [ ! -z "$1" ]; then
    HOST_ABBR="$1"
    shift
else
    echo "$USAGE"
    exit
fi

# Retreive hostname from map, or use literally if not found
if [ "${HOST_MAP[$HOST_ABBR]+_}" ]; then
    HOST="${HOST_MAP[$HOST_ABBR]}"
else
    HOST="$HOST_ABBR"
fi

# Parse args
ARGS=""
TUNNEL=""
while [ "$1" != "" ]; do
    case "$1" in
        --vim)
            VIM=1
            ;;
        --tunnel)
            shift
            PORT=$1
            TUNNEL="-L $PORT:localhost:$PORT"
            ;;
        *)
            ARGS="$ARGS $1"
            ;;
    esac
    shift
done

mkdir ~/.ssh/sockets 2> /dev/null

# SSH options to not check host key, and share SSH sessions
SSH_OPTIONS="-o ControlMaster=auto -o controlPath=~/.ssh/sockets/s%r@%h-%p -o ControlPersist=30 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

# SCP local .vimrc file destination machine
if [ ! -z "$VIM" ]; then
    scp $SSH_OPTIONS ~/.vimrc "$HOST":~/.vimrc
fi

# Print clickable link for couchdb if on iTerm
if [ ! -z "$TUNNEL" ]; then
    echo "CMND-CLICK ME for CouchDB: http://localhost:$PORT/_utils/index.html"
fi

# SSH onto box
ssh $SSH_OPTIONS $HOST $TUNNEL $ARGS
sleep 0.2
exit 0
