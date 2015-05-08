"use sct"

# Define variables
bower    = require('bower')
sh       = require('shelljs')
gulp     = require("gulp")
coffeelint = require('gulp-coffeelint')
scsslint = require('gulp-scsslint')
istanbul = require('gulp-coffee-istanbul')
mocha    = require('gulp-mocha')
docco    = require('gulp-docco')
styledocco = require('gulp-styledocco')
$        = require("gulp-load-plugins")(lazy: false)
$run     = require('run-sequence')
$logger  = $.util.log

# Define path
paths =
  styles:  ['./app/styles/ionic.app.scss']
  scripts: ['./app/scripts/**/*.coffee']
  views:   ['./app/views/**/*.jade']
  assets:  ['./app/assets/**']
  tests:   ['./test/e2e/**/*.js']


# Copy assets
gulp.task "copy", ->
  gulp.src(paths.assets)
    .pipe(gulp.dest('./www/'))

# Minimize css and copy
gulp.task 'sass', (done) ->
  gulp.src(paths.styles)
    .pipe($.plumber(errorHandler: $.notify.onError("Error: <%= error.message %>")))
    .pipe($.sass(errLogToConsole: true))
    .pipe($.concat('style.css'))
    .pipe(gulp.dest('./www/css'))
    .pipe($.minifyCss(keepSpecialComments: 0))
    .pipe($.rename(extname: '.min.css'))
    .pipe(gulp.dest('./www/css/'))
    .pipe($.size(showFiles: true))

# Compile coffeescript to js file
gulp.task 'coffee', (done) ->
  gulp.src(paths.scripts)
    .pipe($.plumber(errorHandler: $.notify.onError("Error: <%= error.message %>")))
    .pipe($.coffee(bare: false).on('error', $logger))
    .pipe($.jshint(".jshintrc"))
    .pipe($.jshint.reporter('jshint-stylish'))
    .pipe($.concat('app.js'))
    .pipe($.insert.prepend("'use strict';\n"))
    .pipe(gulp.dest('./www/js'))
    .pipe($.size(showFiles: true))

# Compile jade to html file
gulp.task 'jade', (done) ->
  gulp.src(paths.views)
    .pipe($.plumber(errorHandler: $.notify.onError("Error: <%= error.message %>")))
    .pipe($.jade())
    .pipe(gulp.dest('./www/templates'))
    .pipe($.angularTemplatecache('templates', {standalone:true, root: '/templates/'} ))
    .pipe($.rename(extname: '.js'))
    .pipe(gulp.dest('./www/js'))
    .pipe($.size(showFiles: true))

# Check coffeescript coding convention
gulp.task 'coffeelint', ->
  gulp.src(paths.scripts)
    .pipe(coffeelint())
    .pipe(coffeelint.reporter())

# Check css coding convention
gulp.task 'scsslint', ->
  gulp.src(paths.styles)
    .pipe(scsslint())
    .pipe(scsslint.reporter())

# Unit test coverage
gulp.task 'coverage', ->
  gulp.src paths.scripts
    .pipe istanbul({includeUntested: true}) # Covering files 
    .pipe istanbul.hookRequire()
    .on 'finish', ->
      gulp.src paths.tests
        .pipe mocha reporter: 'spec'
        .pipe istanbul.writeReports() # Creating the reports after tests run

# Generate coffeedoc
gulp.task 'docco', ->
  gulp.src(paths.scripts)
    .pipe(docco())
    .pipe(gulp.dest('./docs/coffee'))

# Generate styledoc
gulp.task 'styledocco', ->
  gulp.src('./scss/*.scss')
    .pipe styledocco(
      out: './docs/style'
      name: 'fefs'
      'no-minify': true)

# Watcher that will spy on files
gulp.task 'watch', ->
  gulp.watch(paths.styles, ['sass'])
  gulp.watch(paths.scripts, ['coffee'])
  gulp.watch(paths.views, ['jade'])
  gulp.watch(paths.scripts, ['coffeelint'])
  gulp.watch(paths.styles, ['scsslint'])
  gulp.watch(paths.scripts, ['coverage'])

# Build
gulp.task 'build', (callback) ->
  $run("sass", "coffee", "jade", "coffeelint", "scsslint", callback)

# Generate all doc
gulp.task 'doc-generate', (callback) ->
  $run("docco", "styledocco", callback)

# Defaul task when run gulp with no parameter
gulp.task('default', ['build']);

# Install
gulp.task 'install', ['git-check'], ->
  bower.commands.install().on 'log', (data) ->
    $logger('bower', $.util.colors.cyan(data.id), data.message)

# Git check
gulp.task 'git-check', (done) ->
  if !sh.which('git')
    console.log(
      '  ' + $.util.colors.red('Git is not installed.'),
      '\n  Git, the version control system, is required to download Ionic.',
      '\n  Download git here:', $.util.colors.cyan('http://git-scm.com/downloads') + '.',
      '\n  Once git is installed, run \'' + $.util.colors.cyan('gulp install') + '\' again.'
    )
    process.exit(1)
  done()
