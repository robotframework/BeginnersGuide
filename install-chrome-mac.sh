#!/bin/bash
# Check if Google Chrome exist else we download it
if ! command open -a "Google Chrome" &> /dev/null; then
  echo "GOOGLE_CHROME_VERSION could not be found"
  echo "Let's try to install Google Chrome"
  brew tap homebrew/cask-versions
  brew install --cask google-chrome
fi
if command /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version &> /dev/null; then
  brew install --cask chromedriver
  CHROMEDRIVER_VERSION=`chromedriver --version`
  echo "Successful Installation. Your Chromedriver Version : $CHROMEDRIVER_VERSION"
else
  echo 'Please install Google Chrome before installing Chromedriver'
fi
GOOGLE_CHROME_VERSION=`/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version | cut -d' ' -f3 | cut -c1-12`
CHROMEDRIVER_VERSION=`chromedriver --version | cut -d' ' -f2 | cut -c1-12`
if [[ "$GOOGLE_CHROME_VERSION" != $CHROMEDRIVER_VERSION ]]; then
  echo "Chrome Browser and Webdriver are not in the same version"
  brew reinstall --cask google-chrome
  brew reinstall --cask chromedriver
else
  echo "Chrome Browser and Webdriver are in the same version"
fi
