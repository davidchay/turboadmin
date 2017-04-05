var gulp = require('gulp'),
    less = require('gulp-less'),
    LessAutoprefix = require('less-plugin-autoprefix'),
    autoprefixer = require('gulp-autoprefixer'),
    gutil = require('gulp-util'),
    rename = require('gulp-rename'),
    concat = require('gulp-concat'),
    uglify = require('gulp-uglify'),
    connect = require('gulp-connect'),
    sass    = require('gulp-sass');

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
    turboapp:{
        html:'./turboapp/*.html',
        less:'./turboapp/less/bootstrap.less',
        css:'./turboapp/css/'
    }

};

gulp.task('less', function(){
  gulp.src(path.turboapp.less)
  .pipe(less({
    plugins: [autoprefix]
  }))
	.pipe(rename({
    basename:'style',
    extname:'.css'
  }))
  .pipe(gulp.dest(path.turboapp.css))
  .pipe(connect.reload());
});

gulp.task('html', function () {
  gulp.src(path.turboapp.html)
    .pipe(connect.reload());
});


gulp.task('connect',function(){
    connect.server({
      root:'./turboapp/',
      port: 8000,
      livereload:true
    });
});

gulp.task('watch',function(){
  gulp.watch([path.turboapp.less],['less']);
  gulp.watch(path.turboapp.html,['html']);
});

gulp.task('default',['less','html','connect','watch']);
