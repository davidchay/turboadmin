var gulp = require('gulp'),
    sass = require('gulp-sass'),
    autoprefixer = require('gulp-autoprefixer'),
    gutil = require('gulp-util'),
    rename = require('gulp-rename'),
    concat = require('gulp-concat'),
    uglify = require('gulp-uglify');

var path={
    bootstrap:{
      scss:'./componentes/bootstrap/scss/*.scss',
      js:'./componentes/bootstrap/js/*.js'
    },
    app: {
      scss:'./componentes/app/scss/*.scss',
      js:'./componentes/app/js/*.js'
    },
    desarrollo:{
      css:'./builds/desarrollo/css',
      js:'./builds/desarrollo/js',
    },
    produccion:{
      css:'./builds/produccion/css',
      js:'./builds/produccion/js'
    }
};

gulp.task('log',function(){
  gutil.log('Esto funciona');
});

gulp.task('sass', function(){
  gulp.src([path.bootstrap.scss,path.app.scss])
  .pipe(sass())
  .on('error',gutil.log)
  .pipe(autoprefixer({
    versions:['last 2']
  }))
  .pipe(gulp.dest(path.desarrollo.css))
  .pipe(rename({suffix:'.min'}))
  .pipe(gulp.dest(path.produccion.css));

});

gulp.task('js',function(){
      gulp.src(path.bootstrap.js)
      .pipe(concat('bootstrap.js',{newLine:';'}))
      .pipe(gulp.dest(path.desarrollo.js))
      .pipe(uglify())
      .on('error',gutil.log)
      .pipe(rename({suffix:'.min'}))
      .pipe(gulp.dest(path.produccion.js));
});
gulp.task('appjs',function(){
  gulp.src(path.app.js)
  .pipe(concat('app.js',{newLine:';'}))
  .pipe(gulp.dest(path.desarrollo.js))
  .pipe(uglify())
  .pipe(rename({suffix:'.min'}))
  .pipe(gulp.dest(path.produccion.js));
});

gulp.task('default',function(){
  gulp.watch([path.bootstrap.scss,path.app.scss],['sass']);
  gulp.watch(path.bootstrap.js,['js']);
  gulp.watch(path.app.js,['appjs']);
});
