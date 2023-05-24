#!/bin/bash
SUB_CHROME="Google Chrome"
# To see all chrome version http://170.210.201.179/linux/chrome/deb/pool/main/g/google-chrome-stable/
STABLE_CHROME_VERSION="113.0.5672.63-1"
# Check if google-chrome command exist else we download it
if ! command -v google-chrome &> /dev/null; then
  echo "GOOGLE_CHROME_VERSION could not be found"
  echo "Let's try to install Google Chrome"
  wget https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${STABLE_CHROME_VERSION}_amd64.deb
  apt install ./google-chrome-stable_${STABLE_CHROME_VERSION}_amd64.deb
fi
GOOGLE_CHROME_VERSION=`google-chrome --version`
if [[ "$GOOGLE_CHROME_VERSION" =~ .*"$SUB_CHROME"*  ]]; then
  echo "Your Chrome version : $GOOGLE_CHROME_VERSION"
  GOOGLE_CHROME_VERSION=`google-chrome --version | cut -d' ' -f3 | cut -c1-3`
  CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE_$GOOGLE_CHROME_VERSION`
  wget -q "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" -O /tmp/chromedriver.zip
  unzip /tmp/chromedriver.zip -d /usr/bin/
  rm -rf /tmp/chromedriver.zip
  CHROMEDRIVER_VERSION=`chromedriver --version`
  echo "Successful Installation. Your Chromedriver Version : $CHROMEDRIVER_VERSION"
else
  echo 'Please install Google Chrome before installing Chromedriver'
fi
