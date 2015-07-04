var gulp = require('gulp'),
    gutil = require('gulp-util'),

    // gulp plugins and utilities
    concat = require('gulp-concat'),
    exec = require('child_process').exec,
    nodemon = require('nodemon'),
    stylus = require('gulp-stylus'),
    uglify = require('gulp-uglify'),

    // configuration
    paths = {
      html: {
        all: ['./client/index.html'],
        dest: './public'
      },
      js: {
        all: ['./node_modules/mithril/mithril.js',
              './public/js/client.js'],
        dest: './public/js'
      },
      stylus: {
        main: './client/styl/index.styl',
        all: ['./client/styl/**/*.styl'],
        dest: './public/css'
      },
      haxe: {
        all: ['./client/app/**/*.hx', './staticserver/**/*.hx']
      }
    };

gulp.task('copy:html', function () {
  return gulp.src(paths.html.all)
    .pipe(gulp.dest(paths.html.dest));
});

gulp.task('haxe', function (cb) {
  exec('haxe build.hxml', function (err) {
    cb(err);
  });
});

gulp.task('js', ['haxe'], function () {
  return gulp.src(paths.js.all)
    .pipe(concat('bundle.js'))
    .pipe(uglify())
    .pipe(gulp.dest(paths.js.dest));
});

gulp.task('stylus', function () {
  return gulp.src(paths.stylus.main)
    .pipe(stylus())
    .pipe(gulp.dest(paths.stylus.dest));
});

gulp.task('build', ['copy:html', 'js', 'stylus']);

gulp.task('watch', function () {
  gulp.watch(paths.haxe.all, ['js']);
});

gulp.task('static', ['build'], function () {
  nodemon({
    'script': 'bin/staticserver.js',
    'ignore': ['.git', 'public/**']
  });
});

gulp.task('default', ['static', 'watch']);
