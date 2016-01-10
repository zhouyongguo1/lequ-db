#!/bin/bash
#hosts_name=$1
#project_name=$2
#target_dir=$3
#project_name=${package_name%_*}

build=${GO_PIPELINE_COUNTER}
#project=${GO_PIPELINE_NAME}

virtualenv -p `which python2.7` ~/.virtualenvs/urp-deploy && source ~/.virtualenvs/urp-deploy/bin/activate

cd deploy
pip install -r requirements.txt

expect -c "
set timeout -1;
spawn python deploy.py TempAdmin ../../../urp-inventories/wg/qa 0.0.$build
expect {
        "SSH*password:" {send "aDMIN001"\r;exp_continue}
        "Vault*password:" {send "fW-\'?n27owTD"\r}
}
expect eof;"
