$(document).ready(function(){
  $("#feature_form").validate({
    error: function(label) {
      $(this).addClass("error");
    },
    rules: {
      'feature[title]' : "required"
    },
    messages: { 
      'feature[title]' : "Please enter Title"
    }
  });
});  
