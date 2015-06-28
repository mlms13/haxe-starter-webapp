var gulp = require('gulp'),
    gutil = require('gulp-util'),

    // gulp plugins and utilities
    concat = require('gulp-concat'),
    shell = require('shelljs'),
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
      }
    };

gulp.task('copy:html', function () {
  return gulp.src(paths.html.all)
    .pipe(gulp.dest(paths.html.dest));
});

gulp.task('haxe', function () {
  if (shell.exec('haxe build.hxml').code !== 0) {
    shell.echo('haxe build failed');
    shell.exit(1);
  }
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
})

gulp.task('default', ['copy:html', 'js', 'stylus']);
