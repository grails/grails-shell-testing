grails-shell-testing
====================

tests for grails shell and command line

These tests are using TCL based [expect](http://en.wikipedia.org/wiki/Expect). Mac OSX and Linux OSes usually have "expect" installed by default.

quick start to run reloading tests:

```
git clone https://github.com/lhotari/grails-shell-testing
cd grails-shell-testing
./run_reloading_tests.sh

```

These tests are in initial stage and the idea is to first provide tests for different Grails reloading bugs so that it's easier to fix the bugs and later on use these tests as regression tests in the Grails functional test suite.
