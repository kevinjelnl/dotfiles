#!/usr/bin/env bash

# define the order in which apps should be started
declare -a order=("firefox" "code" "slack" "teams" "spotify" "chromium")

#  sudo apt-get install jq // https://stedolan.github.io/jq/
# the dict containing app, workspace and opt. startup cmd
wsdict='{ 
"firefox": {"ws": 1},
"code": {"ws": 1},
"slack": {"ws": 2, "cmd": "/usr/bin/flatpak run com.slack.Slack"},
"teams": {"ws": 2, "cmd": "/usr/bin/flatpak run com.microsoft.Teams"},
"spotify": {"ws": 3, "cmd": "/usr/bin/flatpak run com.spotify.Client"},
"chromium": {"ws": 0, "cmd": "/snap/bin/chromium --kiosk https://outlook.office.com/mail/inbox"}
}'

for i in "${order[@]}"
do
    # test if app runs
   if [[ $(pidof $i) != "" ]];
   then
        echo "$i already running!";
        eval "wmctrl -r $i -t $(echo $wsdict | jq '.'$i'.ws')";
        continue
    fi

    # start the programm
    echo "starting: $i"
    start_cmd=$(echo $wsdict | jq '.'$i'.cmd' | tr -d '"')

    # test start command
    echo "start command: $start_cmd"

    if [[ $start_cmd = "null" ]];
    then
        start_cmd=$i
    fi
    eval "(/usr/bin/nohup $start_cmd > /dev/null &)";

    # wait till programm started before moving
    until  [[ $(pidof $i) ]]
    do
        echo "...waiting till: $i started"
        sleep 3;
    done
    # move app to workspace
    echo "moving $i"
    wmctrl -r $i -t $(echo $wsdict | jq '.'$i'.ws')
done
