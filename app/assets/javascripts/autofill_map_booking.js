var placeSearch, autocomplete;
var componentForm = { 
};

var componentForm_2nd = {
  };

function initAutocomplete() {
  autocomplete = new google.maps.places.Autocomplete(
    (document.getElementById('autocomplete')), { types: ['geocode'] });
  autocomplete.addListener('place_changed', fillInAddress);

  autocomplete_2nd = new google.maps.places.Autocomplete(
    (document.getElementById('autocomplete_2nd')), { types: ['geocode'] });
  autocomplete_2nd.addListener('place_changed', fillInAddress_2nd);
}

function fillInAddress() {
  var place = autocomplete.getPlace();

  $("#source_latitude").val(place.geometry.location.lat());
  $("#source_longitude").val(place.geometry.location.lng());

  for (var component in componentForm) {
    document.getElementById(component).value = '';
    document.getElementById(component).disabled = false;
  }

  for (var i = 0; i < place.address_components.length; i++) {
    var addressType = place.address_components[i].types[0];
    if (componentForm[addressType]) {
      var val = place.address_components[i][componentForm[addressType]];
      document.getElementById(addressType).value = val;
    }
  }
}

function fillInAddress_2nd() {
  var place = autocomplete_2nd.getPlace();

  $("#destination_latitude").val(place.geometry.location.lat());
  $("#destination_longitude").val(place.geometry.location.lng());

  for (var component in componentForm_2nd) {
    document.getElementById(component).value = '';
    document.getElementById(component).disabled = false;
  }

  for (var i = 0; i < place.address_components.length; i++) {
    var addressType = place.address_components[i].types[0] + '_2nd';
    if (componentForm_2nd[addressType]) {
      var val = place.address_components[i][componentForm_2nd[addressType]];
      document.getElementById(addressType).value = val;
    }
  }
}

function geolocate() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geolocation = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      var circle = new google.maps.Circle({
        center: geolocation,
        radius: position.coords.accuracy
      });
      autocomplete.setBounds(circle.getBounds());
    });
  }
}

function geolocate_2nd() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geolocation = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      var circle = new google.maps.Circle({
        center: geolocation,
        radius: position.coords.accuracy
      });
      autocomplete_2nd.setBounds(circle.getBounds());
    });
  }
}