#!/usr/bin/expect
set timeout 60

source [file join [file dirname [info script]] "shared_functions.tcl"]

exec rm -rf scaffoldingapp
spawn bash --norc --noprofile
expect "$ "
send "grails -plain-output create-app scaffoldingapp\r"
expect "$ "
send "cd scaffoldingapp\r"
expect "$ "
send "grails $argv -plain-output\r"
wait_grails_prompt
send "run-app\r"
wait_grails_prompt

send "create-domain-class Book\r"
expect "|Created file test/unit/scaffoldingapp/BookSpec.groovy"
sleep 1
wait_grails_prompt
send "create-scaffold-controller scaffoldingapp.Book\r"
expect "|Created file test/unit/scaffoldingapp/BookControllerSpec.groovy"
sleep 1
expect_exit_on_error "\n"
addfield "scaffoldingapp/grails-app/domain/scaffoldingapp/Book.groovy" "title"

set timeout 10
expect_exit_on_error "\n"

sleep 2

for {set i 0} {$i < 20} {incr i} {
	exec curl -s "http://localhost:8080/scaffoldingapp/book/create" > /dev/null &
	send "!curl -s http://localhost:8080/scaffoldingapp/book/create\r"
	wait_grails_prompt
	sleep 1
}

send "exit\r"
expect "$ "
exit