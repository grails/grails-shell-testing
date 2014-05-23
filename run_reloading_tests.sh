#!/bin/bash -xe
cd scripts
./test_domainclass_reloading.tcl
./test_domainclass_reloading_problem2.tcl
./test_domainclass_reloading_scenario3.tcl
./test_domainclass_reloading_scenario3_delayed.tcl
./test_scaffolding_reloading.tcl