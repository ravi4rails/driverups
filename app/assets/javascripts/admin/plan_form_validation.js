$(document).ready(function(){
  $("#plan_form").validate({
    error: function(label) {
      $(this).addClass("error");
    },
    rules: {
      'plan[name]' : "required",
      'plan[price]' : "required"
    },
    messages: { 
      'plan[name]' : "Please enter Name",
      'plan[price]' : "Please enter price"
    }
  });
});  