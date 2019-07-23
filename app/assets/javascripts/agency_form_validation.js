$(document).ready(function(){
  $("#agency_form").validate({
    error: function(label) {
      $(this).addClass("error");
    },
    rules: {
      'agency[name]' : "required",
      'agency[cover_image]' : "required",
      'agency[logo]' : "required"
    },
    messages: { 
      'agency[name]' : "Please enter Name",
      'agency[cover_image]' : "Please Upload Cover Image",
      'agency[logo]' : "Please Upload logo"
    }
  });
});  