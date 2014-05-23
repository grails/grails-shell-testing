#!/bin/bash -xe
curl -s get.gvmtool.net | bash
perl -i -p -e 's/gvm_auto_answer=false/gvm_auto_answer=true/' ~/.gvm/etc/config
source ~/.gvm/bin/gvm-init.sh
gvm install grails
./run_reloading_tests.sh
