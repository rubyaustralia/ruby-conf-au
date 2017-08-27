const gulp = require('gulp');
const autoprefixer = require('gulp-autoprefixer');

gulp.task('autoprefix', function() {
  gulp.src('../public/2017/styles/all.css')
    .pipe(autoprefixer({
                         browsers: ['last 2 versions', 'ie >= 9', 'and_chr >= 2.3']
                       }))
    .pipe(gulp.dest('../public/2017/styles'))
});