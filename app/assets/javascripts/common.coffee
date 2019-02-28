$ ->  
  #modalclosescript
  $(".close-modal").click ->
    $(".modal").modal("hide")
  $("#practicecontent").on "click", ".close-modal", ->
    $(".modal").modal("hide")
  $("#pattern-detail-container").on "click", ".close-modal", ->
    $(".modal").modal("hide")
  $("#practice-comment-container").on "click", ".close-modal", ->
    $(".modal").modal("hide")
    
  $(document).on 'click', '.close-modal', (e) ->
    $('.modal').modal('hide')
    return false
  $(document).on 'click', '.modal-close', (e) ->
    $('.modal').modal('hide')
    return false
  $(document).on 'click', '[data-dismiss="modal"]', (e) ->
    $('.modal').modal('hide')
    return false
  $(document).on 'click', '[data-toggle="modal"]', (e) ->
    contentattr = $(this).attr('href')
    $(contentattr).modal()
    return false
  
  $(document).on 'click', '.js-trigger-toggle-password', (e) ->
    if $("input[type='password']").length > 0
      $("input[type='password']").attr("type", "text").addClass("password-is-shown")
      $(this).text("パスワードを非表示")
    else if $(".password-is-shown").length > 0
      $(".password-is-shown").attr("type", "password")
      $(this).text("パスワードを表示")
    return false
  
  $(document).on 'click', '.js-trigger-edit-password', (e) ->
    $(".password-container").css("display", "block")
    
  if $("body").hasClass("recommends")
    height = $(window).height()
    $("body").css("min-height", height + "px")
    
  #実践リスト共通JS
  if $("body").hasClass("practices") or $("body").hasClass("projects")
    #アーカイブに入れる時のレーティング
    $(document).on 'click', '.range-group>a',->
      index = $(this).index()
      $(this).siblings().removeClass 'on'
      i = 0
      while i < index
        $(this).parent().find('a').eq(i).addClass 'on'
        i++
      $(this).parent().find('.input-range').attr 'value', index
      return
    return
    
    $("li").click ->
      $('#practicecontent').css({opacity: '1'}).animate({opacity: '0'}, 300)
  
  #ローダー
  $(document).on 'click', 'input[type="submit"]',->
    $(".loading-modal").css("display", "block")

  #bodyのmin-heightをwindowのサイズに
  $("body").css("min-height", $(window).innerHeight() + "px")
  
  $(".alert").delay(1300).fadeOut("normal")
  
  #side-menuの処理
  $(document).on 'click', '.js-side-menu-hum',->
    $("body").toggleClass("menu-opened")
    return false
  
  $(document).on 'click', '.side-menu-inner',->
    $("body").removeClass("menu-opened")