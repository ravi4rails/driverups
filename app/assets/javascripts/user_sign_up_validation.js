$(document).ready(function(){
  $("#user_form1").validate({
    error: function(label) {
      $(this).addClass("error");
    },
    rules: {
      'user[email]' : "required",
      'user[password]' : "required",
      'user[password_confirmation]' : "required"
    },
    messages: { 
      'user[email]' : "please enter username",
      'user[password]' : "please enter password",
      'user[password_confirmation]' : "please enter password_confirmation"
    }
  });
});  