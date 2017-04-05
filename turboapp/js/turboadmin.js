$(function() {
    $('#side-menu').metisMenu();
    
});

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
    $(window).resize(function() {
        topOffset = 50;
        var win = $(this); //this = window
        //width = (win.window.innerWidth > 0) ? win.window.innerWidth : win.screen.width;
        width=win.width();
        if (width < 767) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
            $('.sidebar').css("display","none");
        } else {
            $('div.navbar-collapse').removeClass('collapse');
            $('.sidebar').css("display","block");
        }

        height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1) height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    });

    var url = window.location;
    var element = $('ul.nav a').filter(function() {
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).addClass('active').parent().parent().addClass('in').parent();
    if (element.is('li')) {
        element.addClass('active');
    }
});
