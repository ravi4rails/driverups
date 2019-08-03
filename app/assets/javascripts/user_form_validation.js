$(document).ready(function(){
  $("#user_form").validate({
    error: function(label) {
      $(this).addClass("error");
    },
    rules: {
      'user[email]' : "required",
      'user[password]' : "required"
    },
    messages: { 
      'user[email]' : "please enter username",
      'user[password]' : "please enter password"
    }
  });
});  