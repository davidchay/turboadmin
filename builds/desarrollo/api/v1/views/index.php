<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <!-- Google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Quicksand" rel="stylesheet">
    <!-- css app -->
    <link rel="stylesheet" href="css/app.css">
  </head>
  <body>
    <h1>Hello, world!</h1>
    <div id="app">
        <form v-on:submit.prevent="signUp(true)">
            <div v-show="name">
                <h1>{{gener == 'm'? 'Bienvenido' : 'Bienvenida' }}, {{name}}</h1>
                <p>Espero disfrutes tu visita</p>
                <p>Tu nombre al reves: {{ name.split('').reverse().join('') }}</p>
            </div>
            <br>
            <input type="text" v-model="name" name="nombre" class="form-control">
            <p class="alert alert-danger" v-if="!name">
                Campo obligatorio
            </p>
            <p v-else>Exelente</p>
            <label>
              <input type="radio" name="genero" v-model="gener" value="m"> Male
            </label>
            <br>
            <label for="">
              <input type="radio" name="gener0" v-model="gener" value="f"> Female
            </label>
            <br>
            <p>Años de experiencia e PHP {{expphp}} |
              <button  :class="{btn:true, 'btn-danger':expphp > 10}" v-on:click.prevent="chkphp(1) ">+</button>
              <button class="btn btn-default" v-bind:disabled="expphp==0" v-on:click.prevent="chkphp(-1)">-</button></p>
            <p>
                <button type="submit" class="btn btn-primary">Enviar</button>
                <button type="submit" class="btn btn-primary"  v-on:click.prevent="signUp(false)">enviar y Salir del sistema</button>
            </p>
        </form>
        <br>
        <pre>{{ $data }}</pre>
    </div>

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    <script src="js/vue.js" charset="utf-8"></script>
    <script src="js/app.js" charset="utf-8"></script>
  </body>
</html>
