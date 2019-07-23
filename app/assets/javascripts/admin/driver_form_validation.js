$(document).ready(function(){
  $("#driver_form").validate({
    error: function(label) {
      $(this).addClass("error");
    },
    rules: {
      'driver[first_name]' : "required",
      'driver[last_name]' : "required",
      'driver[contact_1]' : "required",
      'driver[contact_2]' : "required",
      'driver[city]' : "required",
      'driver[state]' : "required",
      'driver[country]' : "required",
      'driver[address]' : "required",
      'driver[id_proof]' : "required",
      'driver[additional_id]' : "required",
      'driver[profile_image]' : "required"
    },
    messages: { 
      'driver[first_name]' : "please enter first_name",
      'driver[last_name]' : "please enter last_name",
      'driver[contact_1]' : "please enter contact_1",
      'driver[contact_2]' : "please enter contact_2",
      'driver[city]' : "please enter city",
      'driver[state]' : "please enter state",
      'driver[country]' : "please enter country",
      'driver[address]' : "please enter address",
      'driver[id_proof]' : "please upload id_proof",
      'driver[additional_id]' : "please upload additonal_id",
      'driver[profile_image]' : "please upload profile image"
    }
  });
});  

