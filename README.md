# Bower custom github install
bower install <github>
***
ignore [array]: An array of paths not needed in production that you want Bower to ignore when installing your package.」
***
Description:
    Because ignore attribute only apply project file, not it's dependencies project.
    
    copy the latest version to custom structure directory using postinstall at git project
    then bower install from git && ignore unwanted file


* [github collect bower repository](#collect-bower)
  * [generate bower.json](#bower-init)
  * [diff dependencies && devDependencies](#bower-dependencies)
  * [postinstall script](#script-postinstall)
* [bower install from custom bower repository](#bower-install)
  * [install directory && postinstall setup](#bowerrc)
  * [ignore unwanted file](#bower-ignore)
  * [install from custom repository](#bower-git-install)
  * [finally file structure](#bower-file-result)

## Collect Bower
### Bower Init
#### generate bower.json
Command:

    bower init

***
Example:
    #]bower init
    bower existing      The existing bower.json file will be used and filled in
    ? name components
    ? description gene test bower install
    ? main file static/components/angular/angular.js
    ? keywords bower static file install
    ? authors gene <gene@uitox.com>
    ? license MIT
    ? homepage 
    ? set currently installed components as dependencies? No
    ? add commonly ignored files to ignore list? Yes
    ? would you like to mark this package as private which prevents it from being accidentally published to the registry? No

    {
      name: 'components',
      authors: [
        'gene <gene@uitox.com>'
      ],
      description: 'gene test bower install',
      main: 'static/components/angular/angular.js',
      license: 'MIT',
      homepage: '',
      directory: 'static/components/',
      ignore: [
        'LICENSE.md',
        'package.json',
        'test',
        'tests',
        '**/.*',
        'node_modules',
        'bower_components'
      ],
      dependencies: {
        angular: 'angular2#^1.5.6'
      },                                                                                                                                                                                                                                         
      keywords: [                                                                                                                                                                                                                                
        'bower',                                                                                                                                                                                                                                 
        'static',                                                                                                                                                                                                                                
        'file',                                                                                                                                                                                                                                  
        'install'                                                                                                                                                                                                                                
      ]                                                                                                                                                                                                                                          
    }
***

### Bower Dependencies
#### diff dependencies && devDependencies
install && save to production's dependencies at bower.json
Command:

    bower install bootstrap --save


install && save to production's devDependencies at bower.json
Command:

    bower install bootstrap --save-dev

### Script Postinstall
#### postinstall script
STEP1:

    create .bowerrc file

Code:
    
    {
      "scripts": {
          "postinstall": "./.bower-postinstall.sh"
      }
    }

STEP2:

    create postinstall scripts
    copy dependencies file to your custom directory ['css', 'js', 'fonts']

Code:

    for dir in js fonts css; do
        if [ ! -d $dir ]; then
            mkdir $dir
        fi
    done
    #minimal=".min"
    minimal=""

    cp -af bower_components/angular/angular${minimal}.js js/angular${minimal}.js
    cp -af  bower_components/bootstrap/dist/js/bootstrap${minimal}.js js/bootstrap${minimal}.js
    cp -af bower_components/bootstrap/dist/fonts/* fonts/
    cp -af bower_components/bootstrap/dist/css/bootstrap-theme${minimal}.css css/bootstrap-theme${minimal}.css
    cp -af bower_components/bootstrap/dist/css/bootstrap${minimal}.css css/bootstrap${minimal}.css
    cp -af bower_components/jquery/dist/jquery${minimal}.js js/jquery${minimal}.js
    cp -af bower_components/angular-google-maps/dist/angular-google-maps${minimal}.js js/angular-google-maps${minimal}.js
    cp -af bower_components/lodash/dist/lodash${minimal}.js js/lodash${minimal}.js
    cp -af bower_components/angular-simple-logger/dist/angular-simple-logger${minimal}.js js/angular-simple-logger${minimal}.js

STEP3:

    run bower install

Command:

    bower install

# Bower Install
## bower install from custom bower repository
### Bowerrc
#### install directory && postinstall setup
STEP1:

    create .bowerrc file

Code:

    {
      "directory": "static",
      "scripts": {
          "postinstall": "./.bower-postinstall.sh"
      }
    }

STEP2:

    create postinstall scripts

Code:

    rm -rf static/components/.bower.json
    rm -rf static/components/bower.json
### Bower Ignore
#### ignore unwanted file
Description:

    Edit bower.json

Code:

    {
      ...
      "ignore": [
        "**/.*",
        ".*",
        "README.md",
        "bower_components"
      ],
      ...
    }

### Bower Custom Git Install
#### install from custom repository
Description:
    
    bower will install to your path <directory>/<bower-project-name>
    <dirctory> default is bower_components, it can be override by .bowerrc file

Command:

    bower install git@gitlab.idc1.ux:gene/bower-lab.git
### Bower File Result
#### finally file structure
Result:

    #] ls static/components/
    total 0
    drwxr-xr-x 1 gene gene  20 Jun 13 13:45 .
    drwxr-xr-x 1 gene gene  54 Jun 13 13:45 ..
    drwxr-xr-x 1 gene gene  64 Jun 13 13:45 css
    drwxr-xr-x 1 gene gene 326 Jun 13 13:45 fonts
    drwxr-xr-x 1 gene gene 172 Jun 13 13:45 js

