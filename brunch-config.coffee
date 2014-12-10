exports.config =
  # docs -> http://brunch.io/#documentation
  paths:
    public: 'public',
  modules:
    definition: false
    wrapper: false
  files:
    javascripts:
      defaultExtension: 'js'
      joinTo:
        'scripts/app.js': /^app[\/\\]scripts/
        'scripts/vendor.js': /^(app[\/\\]vendor|bower_components)/
    stylesheets:
      defaultExtension: 'css'
      joinTo:
        'styles/app.css': /^app[\/\\]styles/
        'styles/vendor.css': /^(app[\/\\]vendor|bower_components)/
    templates:
      joinTo: 'app.js'
  plugins:
    autoReload:
      enabled:
        css: on
        js: on
        assets: off
      port: [9485..9495]
      delay: 200 if require('os').platform() is 'win32'
  overrides:
    production:
      paths:
        public: 'release'
      optimize: true
      sourceMap: false
      plugins:
        uglify:
          mangle: false
          compress:
            global_defs:
              DEBUG: false
        cleancss:
          keepSpecialComments: 0
          removeEmpty: true
        autoReload:
          enabled: false
