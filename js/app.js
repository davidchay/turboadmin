new Vue({
  el: "#app",
  data: {
    name: "",
    gener: 'm',
    expphp: 0
  },
  methods: {
    signUp: function(r) {
      console.log('Entra a singUp');
      if (r) {
        alert('Welcome');
      } else {
        alert('Bye');
      }
    },
    chkphp: function(val) {
      this.expphp = this.expphp + val;
    }
  }
});
