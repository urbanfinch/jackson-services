var jackson_services = {
  run: function() {
    
    $('nav#contact_us_form_nav a#contact_us_form_nav_contact').click(function(event) {
      $('a#contact_us_form_nav_request_service').removeClass('selected');
      $('a#contact_us_form_nav_contact').addClass('selected');
      $('div#contact_us_left_request_service').hide();
      $('div#contact_us_left_contact').show();
      event.preventDefault();
    });
    $('nav#contact_us_form_nav a#contact_us_form_nav_request_service').click(function(event) {
      $('a#contact_us_form_nav_contact').removeClass('selected');
      $('a#contact_us_form_nav_request_service').addClass('selected');
      $('div#contact_us_left_contact').hide();
      $('div#contact_us_left_request_service').show();
      event.preventDefault();
    });
  }
}