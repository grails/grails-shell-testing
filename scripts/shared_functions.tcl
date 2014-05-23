proc updateplugin {filename pluginname version} {
    exec perl -i -p -e "s/(\[\'\"\]:$pluginname:)\[^'\"\]+(\[\'\"\])/\$\{1\}$version\$\{2\}/" $filename
}

proc addfield {filename fieldname} {
    while { [file exists $filename] != 1} {
        puts "Waiting for $filename to be created"  
        sleep 1
    }
    puts "Adding field $fieldname to $filename"
    exec perl -i -p -e "s/^\}\$/String $fieldname\\n\}\\n/" $filename 
}

proc wait_grails_prompt {} {
	expect_exit_on_error "grails>"
}

proc expect_exit_on_error {waitforstring} {
	expect {
		"ERROR" {
			puts "Caught an error, exiting..."
			sleep 1
			exit 1
		}
		$waitforstring
	}
}