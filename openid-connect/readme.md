# cURL Scripts: SalesForce with OpenID Connect

Each directory is the name of a workflow.

```
code/   OpenID Connect workflow with Authorization Codes
```

## OpenID Connect

I used this guide to figure out which parameters were supposed to be in the
request body vs. query string.

https://help.salesforce.com/articleView?id=sf.remoteaccess_oauth_web_server_flow.htm&type=5


## Environment

### `direnv` for environment settings (secrets)

Try using direnv from HomeBrew: https://formulae.brew.sh/formula/direnv#default

1. Install `direnv` and the hook, by adding the `eval` call __at the bottom__ of
   your shell initializer (`.zshrc` and the like).  Yes, it really has to be at
   the bottom.
1. Make sure you are in the directory containing `.envrc[-template]`.
1. Copy `.envrc-template` to `.envrc` and fill in the values from SalesForce
   (Setup -> Manage Connected Apps -> <your app> -> Enable OAuth settings -> API
   -> Consumer Key/Secret).
1. Say `direnv allow` in this directory, and `direnv` should export those
   environment variables with your secrets.


### jq

Install `jq` with homebrew for later JSON parsing.  It's the bees' knees.
