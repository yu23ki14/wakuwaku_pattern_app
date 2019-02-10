$ ->
  $('#fav').click ->
    $.post '/patterns/' + $(this).attr('language_id') + '/' + $(this).attr('pattern_no') + '/fav'
  $('#js-trigger-add-practice').click ->
    $('#add-practice').modal()
  $('#js-trigger-add-project-practice').click ->
    $('#add-project-practice').modal()

  if $("body").hasClass("patterns index")
    category_1_position = $("#category-1").offset().top - 50
    category_2_position = $("#category-2").offset().top - 50
    category_3_position = $("#category-3").offset().top - 50
    category_4_position = $("#category-4").offset().top - 50
    $(window).on 'load scroll resize', ->
      $(".side-menu-sub-list .side-menu-inner").removeClass("is-active")
      scroll_position = $(window).scrollTop()
      if scroll_position < category_1_position
        $("#side-menu-category-0").addClass("is-active")
      else if scroll_position < category_2_position
        $("#side-menu-category-1").addClass("is-active")
      else if scroll_position < category_3_position
        $("#side-menu-category-2").addClass("is-active")
      else if scroll_position < category_4_position
        $("#side-menu-category-3").addClass("is-active")
      else
        $("#side-menu-category-4").addClass("is-active")