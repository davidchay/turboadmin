$(function () {
  $('[data-toggle="tooltip"]').tooltip();
});
(function(){
  var example1 = new Vue({
      el: '#app',
      data: {
        clientes: [
          { nombre: 'Camila hernandez vergugo', telefono:'96212345467', username:'@camihdz' },
          { nombre: 'Rodrigo alcazar mendez', telefono:'9626745323', username:'@rodri' },
          { nombre: 'Victor Hugo Perez Lopez', telefono:'962787654', username:'@vicgo' },
          { nombre: 'Sandra lopez Garcia', telefono:'96298765342', username:'@sandy' },
          { nombre: 'Samantha Galvez Sierra', telefono:'9628976234', username:'@sammy' },
          { nombre: 'Ulises Mendez Zarate', telefono:'9629876342', username:'@ulimendez' },
          { nombre: 'Miguel Coronado Perez', telefono:'9627907354', username:'@migue' },
        ]
      },
      methods: {
        // rm - remove / Eliminar registro
        delete:function(){
          console.log(this.clientes);
        },
        rm:function(index){
          var data=this; //para acceder desde the function
          swal({
            title: '¿Estas seguro? ',
            text: "El registro se eliminara permanentemente.",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, ¡Eliminar!',
            cancelButtonText: 'No, Cancelar'
          }).then(function () {
            data.clientes.splice(data.clientes.indexOf(index), 1);
            swal(
              '¡Eliminado!',
              'El registro se elimino exitosamente.',
              'success'
            );
          });
        } // rm
      } //methods
  });

  $('#sweedalert2').on('click',function(){

  });

})();
