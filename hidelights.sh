#!/bin/bash

# Paths
EXTRACT_PATH="$HOME/Library/Application Support/BetterDiscord/data/betterdiscord"
ASAR_PATH="$HOME/Library/Application Support/BetterDiscord/data/betterdiscord.asar"
INJECTOR_JS="$EXTRACT_PATH/injector.js"

# Extract asar
npx asar extract "$ASAR_PATH" "$EXTRACT_PATH"

# Modify the injector.js file
if [[ -f "$INJECTOR_JS" ]]; then
    sed -i '' 's/v=(s,n,t)=>{e.BrowserWindow.fromWebContents(s.sender).setMinimumSize(n,t)/v=(s,n,t)=>{e.BrowserWindow.fromWebContents(s.sender).setMinimumSize(n,t);\
  e.BrowserWindow.fromWebContents(s.sender).setWindowButtonVisibility(false)/' "$INJECTOR_JS"
else
    echo "injector.js was not found."
    exit 1
fi

# Pack asar
npx asar pack "$EXTRACT_PATH" "$ASAR_PATH"

echo "Process completed."
