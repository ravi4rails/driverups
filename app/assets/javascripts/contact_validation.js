$(document).ready(function(){
  $("#contact_form").validate({
    error: function(label) {
      $(this).addClass("error");
    },
    rules: {
      'contact[name]' : "required",
      'contact[email]' : "required",
      'contact[message]' : "required"
    },
    messages: { 
      'contact[name]' : "please enter name",
      'contact[email]' : "please enter email",
      'contact[message]' : "please enter message"
    }
  });
});  