#!/bin/bash
rm -rf ~/.gvm
curl -s get.gvmtool.net | bash
perl -i -p -e 's/gvm_auto_answer=false/gvm_auto_answer=true/' ~/.gvm/etc/config
source ~/.gvm/bin/gvm-init.sh
gvm install grails
gvm use grails
set +xe
./run_reloading_tests.sh
