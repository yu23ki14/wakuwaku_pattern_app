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
    $(window).on 'load scroll resize', ->
      $(".side-menu-sub-list .side-menu-inner").removeClass("is-active")
      scroll_position = $(window).scrollTop()
      if scroll_position < category_1_position
        $("#side-menu-category-0").addClass("is-active")
      else if scroll_position < category_2_position
        $("#side-menu-category-1").addClass("is-active")
      else if scroll_position < category_3_position
        $("#side-menu-category-2").addClass("is-active")
      else
        $("#side-menu-category-3").addClass("is-active")
        
      if $(window).width() > 767
        $.each $(".js-patterns-unit"), ->
          maxHeight = 0
          pattern_card = $(this).find('.pattern-card')
          pattern_card.each ->
            if $(this).height() > maxHeight
              maxHeight = $(this).height()
            return
          pattern_card.height maxHeight
          return
  
  if $("body").hasClass("patterns show")
    if $(window).width() > 767
      fullscreen = false
    else
      fullscreen = false
    
    id = ""
    $('.js-trigger-tiny-pattern-modal').click ->
      id = $(this).attr("tiny_id")
      
    modal_setting = (id) ->
      url = "/patterns/tiny/" + id
      $.ajax(
        type: 'GET',
        url: url
      ).done (data) ->
        pattern_name = data.name
        solution = data.solution
        $(".tiny_pattern_name").text(pattern_name)
        $(".tiny_pattern_solution").text(solution)
      
    $('.js-trigger-tiny-pattern-modal').modaal({
      fullscreen: fullscreen,
    	before_open: ->
        modal_setting(id)
        return
    })
  
  if $("body").hasClass("patterns list")
    $(".js-pattern-list-category-description-open").click ->
      id = $(this).attr("category_id")
      
      if $(".pattern-list-category-description[category_id='" + id + "']").hasClass("is-open")
        $(".pattern-list-category-description[category_id='" + id + "']").animate( { height: 'hide' }, 'slow' ).removeClass("is-open")
      else
        $(".pattern-list-category-description").animate( { height: 'hide' }, 'slow' ).removeClass("is-open")
        $(".pattern-list-category-description[category_id='" + id + "']").animate( { height: 'show' }, 'slow' ).addClass("is-open")
      
      if id == "D"
        setTimeout ->
          $(window).scrollTop($(window).scrollTop() + 150)
        , 100