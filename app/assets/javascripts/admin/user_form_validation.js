$(document).ready(function(){
  $("#admin_user_form").validate({
    error: function(label) {
      $(this).addClass("error");
    },
    rules: {
      'user[first_name]' : "required",
      'user[last_name]' : "required",
      'user[contact_number]' : "required",
      'user[city]' : "required",
      'user[state]' : "required",
      'user[country]' : "required",
      'user[address]' : "required",
      'user[id_proof]' : "required",
      'user[username]' : "required",
      'user[password]' : "required",
      'user[password_confirmation]' : "required"
    },
    messages: { 
      'user[first_name]' : "please enter first name",
      'user[last_name]' : "please enter last name",
      'user[contact_number]' : "please enter contact number",
      'user[city]' : "please enter city",
      'user[state]' : "please enter state",
      'user[country]' : "please enter country",
      'user[address]' : "please enter address",
      'user[id_proof]' : "please upload id proof",
      'user[username]' : "please enter username",
      'user[password]' : "please enter password",
      'user[password_confirmation]' : "please enter confirm password"
    }
  });
});  