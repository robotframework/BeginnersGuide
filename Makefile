# Python version
PYTHON= python3
HEADLESS= TRUE
PROCESS = 8
RESULTS_FOLDER= Results/
SCENARIOS_FOLDER= Examples/

# Defines the default target that `make` will to try to make, or in the case of a phony target, execute the specified commands
.PHONY: install chrome
# This target is executed whenever we just type `make`
.DEFAULT_GOAL = help

help:
	@echo "---------------HELP-----------------"
	@echo "To install the project type : make install"
	@echo "To update chrome webdriver (chrome is required) : make update-chromedriver"
	@echo "To run test with local resources type : make test TEST=TAGS-XXXXX HEADLESS=FALSE"
	@echo "To run several tests in parallel type : make ptest TEST=TAGS-XXXXX PROCESS=8"
	@echo "To open test results type : make open-log / make open-report"
	@echo "To clean all log types : make clean-all"
	@echo "------------------------------------"

# Os detection
OS_NAME := $(shell uname -s | tr A-Z a-z)

os:
	@echo $(OS_NAME)

### TO RESET LOCAL INSTALLATION ############################
### WARNING ON UBUNTU WE NEED ONE VERSION KEEP INSTALLED ###
#
# Deleting the frameworks :
# sudo rm -rf /Library/Frameworks/Python.framework/Versions/[version number] replacing [version number] with 3.10 in your case.
#
# Removing symbolic links to list the broken symbolic links :
# ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/[version number]'
#
# And to remove these links :
# cd /usr/local/bin
# ls -l /usr/local/bin | grep '../Library/Frameworks/Python.framework/Versions/[version number]' | awk '{print $9}' | tr -d @ | xargs rm*
#
# Remove all pip packages :
# pip freeze | xargs pip uninstall -y
#
###################################

# Installation/Setup
install:
ifeq ($(OS_NAME),darwin)
	@echo "OS detection : Mac OS X platform"
	# Install homebrew, fix needed
    #curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
	brew update && brew install wget curl unzip python@3
	python3 -m pip install --upgrade pip
	@bash install-chrome-mac.sh
else ifeq ($(OS_NAME),linux)
	@echo "OS detection : GNU/Linux platform"
	apt-get update && apt-get install -y wget curl unzip python3 python3-pip
	python3 -m pip install --upgrade pip
	@bash install-chrome-linux.sh
endif
	pip3 install requests==2.30.0    robotframework==6.0.2    robotframework-debuglibrary==2.3.0    robotframework-jsonlibrary==0.5    robotframework-metrics==3.3.3    robotframework-pabot==2.15.0    robotframework-pythonlibcore==4.1.2    robotframework-requests==0.9.2    robotframework-seleniumlibrary==6.1.0    robotframework-seleniumtestability==2.1.0    selenium==4.9.1    urllib3==1.26.15 --upgrade

update-chromedriver:
ifeq ($(OS_NAME),darwin)
	@echo "OS detection : Mac OS X platform"
	@bash install-chrome-mac.sh
else ifeq ($(OS_NAME),linux)
	@echo "OS detection : GNU/Linux platform"
	@bash install-chrome-linux.sh
endif

# Run test(s)
test:
	robot -v HEADLESS:${HEADLESS} -i ${TEST} -d ${RESULTS_FOLDER} ${SCENARIOS_FOLDER}

ptest:
	pabot --processes ${PROCESS} --pabotlib -x result.xml -v HEADLESS:${HEADLESS} -i ${TEST} -d ${RESULTS_FOLDER} ${SCENARIOS_FOLDER}

clean-sc:
	rm -rf Results/*.png

clean-all:
	rm -rf Results/*

open-log:
ifeq ($(OS_NAME),darwin)
	@echo "OS detection : Mac OS X platform"
	open -a "Google Chrome" Results/log.html
else ifeq ($(OS_NAME),linux)
	@echo "OS detection : GNU/Linux platform"
	google-chrome  Results/log.html
endif

open-report:
ifeq ($(OS_NAME),darwin)
	@echo "OS detection : Mac OS X platform"
	open -a "Google Chrome" Results/report.html
else ifeq ($(OS_NAME),linux)
	@echo "OS detection : GNU/Linux platform"
	google-chrome  Results/report.html
endif