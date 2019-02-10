$ ->
  if $('body').hasClass('welcome')
    height = $(window).height()
    $('.page-container').css('height', height + 'px')