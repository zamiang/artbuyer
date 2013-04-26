# Getting Started

## Install Node

It is recommended to use the nvm tool to manage node versions and install node.

    $ git clone git://github.com/creationix/nvm.git ~/.nvm

Add the following to `~/.bash_profile`.

    source "$HOME/.nvm/nvm.sh"
    [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

Use node 0.6.18.

    nvm install v0.10
    nvm alias default 0.10

Follow [NVM Installation Instructions](https://github.com/creationix/nvm/blob/master/README.markdown) if you're having issues.

## Install NPM

    $ curl https://npmjs.org/install.sh | sh
    
Set your NPM directory
    
    npm config set registry http://registry.npmjs.org

See [installation instructions](http://npmjs.org/) for any issues.

## Install packages

    npm install -g coffee-script
    npm install -g mocha
    npm install
  
## Run Gravity on port 3000

Because Torque uses the Artsy API to do it's CRUD operations, you will need to also run your [Gravity](https://github.com/artsy/gravity) project on port 3000 (This is the default port for Gravity). You will also need to set a TOKEN_TRUST_KEY to enable authentication to both Gravity and MASS.
  
    cd your/gravity/project/
    TOKEN_TRUST_KEY=development rails s

## Add API keys

Create an Artsy API client and add to your env

    export ARTSY_CLIENT_ID='id
    export ARTSY_CLIENT_SECRET='secret'
    export EXPRESS_SECRET='randomStringForHashingCookies'

## Run your node server

    coffee app.coffee
    
It's advised to use [node-supervisor](https://github.com/isaacs/node-supervisor) to run your server so any changes made to app.coffee will be refreshed.

    npm install supervisor -g
    supervisor -p 3001 app.coffee
    
Visit http://localhost:3001
