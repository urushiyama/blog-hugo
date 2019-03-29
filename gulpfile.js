var gulp = require('gulp');
var sass = require('gulp-sass');
var autoprefixer = require('gulp-autoprefixer');

gulp.task('sass', function () {
  return gulp.src('sass/style.sass')
    .pipe(sass({outputStyle: 'compressed'}))
    .pipe(autoprefixer())
    .pipe(gulp.dest('static/css/'));
});

gulp.task('watch', function () {
  return gulp.watch('sass/style.sass', gulp.task('sass'));
});

gulp.task('default', gulp.series(
  gulp.parallel('sass')
));
