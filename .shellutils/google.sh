#!/usr/bin/env sh
terms=$@
encoded_value=$(python -c "import urllib; print urllib.quote('''$terms''')")
chromium "http://www.google.com/webhp?hl=en#q=$encoded_value"
