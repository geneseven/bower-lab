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
cp -af bower_components/angular-block-ui/dist/angular-block-ui${minimal}.js js/angular-block-ui${minimal}.js
cp -af bower_components/angular-block-ui/dist/angular-block-ui${minimal}.css css/angular-block-ui${minimal}.css
cp -af bower_components/angular-animate/angular-animate${minimal}.js js/angular-animate${minimal}.js
cp -af bower_components/angular-bootstrap/ui-bootstrap-tpls${minimal}.js js/ui-bootstrap-tpls${minimal}.js
cp -af bower_components/angular-messages/angular-messages${minimal}.js js/angular-messages${minimal}.js
cp -af bower_components/angular-ui-validate/dist/validate${minimal}.js js/validate${minimal}.js
cp -af bower_components/angularUtils-pagination/dirPagination.js js/dirPagination.js
