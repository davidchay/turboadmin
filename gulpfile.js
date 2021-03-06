var gulp = require('gulp'),
    sass = require('gulp-sass'),
    autoprefixer = require('gulp-autoprefixer'),
    gutil = require('gulp-util'),
    rename = require('gulp-rename'),
    concat = require('gulp-concat'),
    uglify = require('gulp-uglify'),
    connect = require('gulp-connect');

var path={
    bootstrap:{
      scss:'./componentes/bootstrap/scss/*.scss',
    },

    desarrollo:{
      css:'./builds/desarrollo/assets/css',
      js:'./builds/desarrollo/assets/js',

    },
    produccion:{
      css:'./builds/produccion/assets/css',
      js:'./builds/produccion/assets/js'
    }
};

gulp.task('sass', function(){
  gulp.src(path.bootstrap.scss)
  .pipe(sass({outputStyle:'expanded'}))
  .on('error',gutil.log)
  .pipe(autoprefixer({
    versions:['last 2']
  }))
  .pipe(gulp.dest(path.desarrollo.css))
  .pipe(connect.reload())
  .pipe(rename({suffix:'.min'}))
  .pipe(gulp.dest(path.produccion.css));

});


gulp.task('js',function(){
  gulp.src(path.app.js)
  .pipe(concat('app.js',{newLine:';'}))
  .pipe(gulp.dest(path.desarrollo.js))
  .pipe(connect.reload())
  .pipe(uglify())
  .pipe(rename({suffix:'.min'}))
  .pipe(gulp.dest(path.produccion.js));
});

gulp.task('connect',function(){
    connect.server({
      root:'./builds/desarrollo/',
      port: 8000,
      livereload:true
    });
});

gulp.task('watch',function(){
  gulp.watch([path.bootstrap.scss],['sass']);
  //gulp.watch(path.app.js,['js']);
});

gulp.task('default',['sass','connect','watch']);
