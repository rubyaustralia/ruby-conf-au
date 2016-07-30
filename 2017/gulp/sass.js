'use strict';

var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('sass', function () {
  return gulp.src('./styles/all.scss')
    .pipe(sass(
      {includePaths: ['./node_modules/foundation-sites/scss']}
    ).on('error', sass.logError))
    .pipe(gulp.dest('../public/2017/styles'));
});

gulp.task('sass:watch', function () {
  gulp.watch('./styles/**/*.scss', ['sass']);
});