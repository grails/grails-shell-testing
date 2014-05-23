#!/usr/bin/expect
set timeout 60

source [file join [file dirname [info script]] "shared_functions.tcl"]

exec rm -rf dcreloadingapp
spawn bash --norc --noprofile
expect "$ "
send "grails -plain-output create-app dcreloadingapp\r"
expect "$ "
#updateplugin "dcreloadingapp/grails-app/conf/BuildConfig.groovy" "hibernate" {3.6.10.3-SNAPSHOT}
send "cd dcreloadingapp\r"
expect "$ "
send "grails $argv -plain-output\r"
wait_grails_prompt
send "run-app\r"
wait_grails_prompt
sleep 15
send "create-domain-class A\r"
wait_grails_prompt
send "create-scaffold-controller dcreloadingapp.A\r"
wait_grails_prompt
set timeout 10
expect_exit_on_error "\n"
addfield "dcreloadingapp/grails-app/domain/dcreloadingapp/A.groovy" "name"
expect_exit_on_error "\n"
for {set i 0} {$i < 10} {incr i} {
    addfield "dcreloadingapp/grails-app/domain/dcreloadingapp/A.groovy" "field$i"    
    expect_exit_on_error "\n"
}
send "exit\r"
expect "$ "
exit
