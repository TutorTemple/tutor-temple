$(document).on('turbolinks:load', function () {
  $('.auth-tabs > .auth-tab').on('click', function () {
    $(this).parent().find('.auth-tab').removeClass('active')
    $(this).toggleClass('active')
  })
});
