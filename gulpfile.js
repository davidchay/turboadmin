var gulp = require('gulp'),
    less = require('gulp-less'),
    LessAutoprefix = require('less-plugin-autoprefix'),
    gutil = require('gulp-util'),
    rename = require('gulp-rename'),
    concat = require('gulp-concat'),
    uglify = require('gulp-uglify'),
    connect = require('gulp-connect');

var autoprefix = new LessAutoprefix({ browsers: ['last 2 versions'] });

var path={
    dev:{
      html:'./dev/*.html',
      less:'./dev/less/sb-admin-2.less',
      css:'./dev/styles/'
    },
    dist:{
      css:'',
      js:'',
    },

};

gulp.task('less', function(){
  gulp.src(path.dev.less)
  .pipe(less({
    plugins: [autoprefix]
  }))
  .pipe(rename({
    basename:'sb-admin-2',
    extname:'.css'
  }))
  .pipe(gulp.dest(path.dev.css))
  .pipe(connect.reload());
});

gulp.task('html', function () {
  gulp.src(path.dev.html)
    .pipe(connect.reload());
});


gulp.task('connect',function(){
    connect.server({
      root:'./dev/',
      port: 8000,
      livereload:true
    });
});

gulp.task('watch',function(){
  gulp.watch([path.dev.less],['less']);
  gulp.watch(path.dev.html,['html']);
});

gulp.task('default',['less','html','connect','watch']);
