$(document).ready(function(){
  $("#user_form").validate({
    error: function(label) {
      $(this).addClass("error");
    },
    rules: {
      'user[username]' : "required",
      'user[password]' : "required",
      'user[password_confirmation]' : "required"
    },
    messages: { 
      'user[username]' : "please enter username",
      'user[password]' : "please enter password",
      'user[password_confirmation]' : "please enter password_confirmation"
    }
  });
});  