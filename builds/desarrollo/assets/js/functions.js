jQuery.noConflict();
(function ($) {
  $('[data-toggle="tooltip"]').tooltip();
  $('#buttons-save-cancel').hide();
  $('#btn-edit').on('click',function(e){
    e.preventDefault();
    $('#button-edit').hide();
    $('form .form-control').removeClass('input-hidden').attr("readonly", false);
    $('#buttons-save-cancel').show();
  });
  $('#btn-cancel').on('click',function(){
    $('#button-edit').show();
    $('form .form-control').addClass('input-hidden').attr("readonly", true);
    $('#buttons-save-cancel').hide();
  });
  $('#btn-save').on('click',function(e){
    e.preventDefault();
    swal(
      'Guardado',
      'Los datos se guardaron con exito',
      'success'
    );
  });
})(jQuery);
