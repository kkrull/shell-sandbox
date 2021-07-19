# OpenID Connect workflow for SalesForce

Establishing how an OpenID Connect workflow works for SalesForce.

__Follow the setup instructions in the parent directory, so `direnv` can provide
secrets.__


## Workflow

Call the scripts in order to authorize, then call one of the remaining scripts
to perform an authorized operation.  For example:

```shell
# Get the URL you need to log in and copy to the clipboard
$ ./code/01_authorize.sh | pbcopy

# Open that URL from the clipboard in your browser and sign in to SalesForce.
# After signing in, it should redirect you to oidcdebugger.com, so you can copy
# your authorization code.

# Exchange the authorization code for an access token
$ access_token=$(./code/02_exchange.sh <authorization code> | jq -r '.access_token')

# Use it for something
$ ./code/userinfo.sh "$access_token" | jq
```
