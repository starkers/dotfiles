#!/usr/bin/env bash
set -eu

BASE="${HOME}/.mozilla/firefox"
CSSURL="https://raw.githubusercontent.com/OneJaredNewman/firefoxcss/main/userChrome.css"

mkdir -p "${BASE}"
cd "${BASE}" || exit
for i in * ; do
  # find dirs in here
  if [[ -d "$i" ]]; then
    # it doesn't matter which is the active profile
    # lets just add the userChrome.css to all profiles
    CHROME_DIR="${BASE}/${i}/chrome"
    CHROME_FILE="${CHROME_DIR}/userChrome.css"
    echo "mkdir -p ${CHROME_DIR}"
    mkdir -p "${CHROME_DIR}"
    echo curl "${CSSURL}" -o "${CHROME_FILE}"
    curl "${CSSURL}" -o "${CHROME_FILE}" -s
  fi
done

echo "############ now you need to do something yourself #############"
echo "#"
echo "#  1. open   'about:config'  in the browser"
echo "#"
echo "#  2. set 'toolkit.legacyUserProfileCustomizations.stylesheets'  to be 'true' "
echo "#"
echo "#  3. restart firefox"
echo "#"
echo "################################################################"
