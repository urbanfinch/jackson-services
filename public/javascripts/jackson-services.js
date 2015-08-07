var jackson_services = {
  run: function() {

    jackson_services.addPlaceholders();

    var hash = window.location.hash.substring(1);
    if (hash == "make_a_payment") {
      $('a#contact_us_form_nav_contact').removeClass('selected');
      $('a#contact_us_form_nav_request_service').removeClass('selected');
      $('a#contact_us_form_nav_make_a_payment').addClass('selected');
      $('div#contact_us_left_contact').hide();
      $('div#contact_us_left_request_service').hide();
      $('div#contact_us_left_make_a_payment').show();
      setTimeout(function() {
        window.scrollTo(0, 0);
      }, 1);
    }

    $('nav#contact_us_form_nav a#contact_us_form_nav_contact').click(function(event) {
      $('a#contact_us_form_nav_request_service').removeClass('selected');
      $('a#contact_us_form_nav_make_a_payment').removeClass('selected');
      $('a#contact_us_form_nav_contact').addClass('selected');
      $('div#contact_us_left_request_service').hide();
      $('div#contact_us_left_make_a_payment').hide();
      $('div#contact_us_left_contact').show();
      event.preventDefault();
    });
    $('nav#contact_us_form_nav a#contact_us_form_nav_request_service').click(function(event) {
      $('a#contact_us_form_nav_contact').removeClass('selected');
      $('a#contact_us_form_nav_make_a_payment').removeClass('selected');
      $('a#contact_us_form_nav_request_service').addClass('selected');
      $('div#contact_us_left_contact').hide();
      $('div#contact_us_left_make_a_payment').hide();
      $('div#contact_us_left_request_service').show();
      event.preventDefault();
    });
    $('nav#contact_us_form_nav a#contact_us_form_nav_make_a_payment').click(function(event) {
      $('a#contact_us_form_nav_contact').removeClass('selected');
      $('a#contact_us_form_nav_request_service').removeClass('selected');
      $('a#contact_us_form_nav_make_a_payment').addClass('selected');
      $('div#contact_us_left_contact').hide();
      $('div#contact_us_left_request_service').hide();
      $('div#contact_us_left_make_a_payment').show();
      event.preventDefault();
    });
  },

  addPlaceholders: function() {
    if ('placeholder' in document.createElement('input')) {
      return;
    }

    $.merge($('input[placeholder]'), $('textarea[placeholder]')).each(function (){
      var placeholderName = $(this).attr('id');
      var placeholderText = $(this).attr('placeholder');
      var placeholder = $('<label for='+ $(this).attr('id') +'>'+ placeholderText + '</label>');
      placeholder.attr('style', 'position: absolute; cursor: text; left: 8px; top: 8px; font-size: 10px; color: #AAAAAA;');

      $(this).before(placeholder);

      $(placeholder).click(function(){
        $('label[for=' + placeholderName + ']').hide();
        document.getElementById(placeholderName).focus();
        //$('label[for=' + placeholderName + ']').triggerHandler('focus');
      })
      $(this).focus(function(){
        $('label[for=' + placeholderName + ']').hide();
      })

      $(this).blur(function(){
        $('label[for=' + placeholderName + ']').show();
      })
    });

  }
}
