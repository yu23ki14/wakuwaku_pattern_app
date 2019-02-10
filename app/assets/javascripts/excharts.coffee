$ ->
  if $("body").hasClass("excharts index") || $("body").hasClass("excharts compare")
    $(document).on 'click', '.js-trigger-modal-select-mode',->
      $("#select_mode").modal()
      return false
    $(".myChart").each (index) ->
      data = eval 'gon.data' + index
      
      data1_color = "rgba(243, 158, 155, 0.7)"
      
      ctx = eval 'document.getElementById("myChart' + index + '").getContext("2d")'
      
      #データの成形
      original_data = JSON.parse(data)
      data_length = Object.keys(original_data).length - 1
      
      data = [] 
      label = ["test","test","test","test","test","test","test","test","test","test","test","test","test"]
      for i in [1..data_length] by 3
        d1 = original_data[i] + original_data[i+1] + original_data[i+2]
        data.push(d1)
      #チャートのオプション
      options = {scale:
                  display: true
                  pointLabels:
                    display: false
                    fontSize: 0
                  ticks:
                    stepSize: 1
                    beginAtZero: true
                    display: false
                    max: 3
                    min: 0
                legend:
                  display: false
                animation: false
                }
                  
      #チャート生成
      myChart = new Chart(ctx,
        type: 'radar'
        data:
          labels: label
          datasets: [
            data: data
            pointRadius:0
            pointHitRadius:20
            backgroundColor: data1_color
            borderColor: data1_color
            borderWidth: 1
          ]
          #datasets: [ {
          #  data: data1
          #  pointRadius:0
          #  pointHitRadius:20
          #  backgroundColor: data1_color
          #  borderColor: data1_color
          #  borderWidth: 1
          #},{
          #  data: data2
          #  pointRadius:0
          #  pointHitRadius:20
          #  backgroundColor: data2_color
          #  borderColor: data2_color
          #  borderWidth: 1
          #} ]
        options: options)
      
      
  if $("body").hasClass("excharts new")
    
    #ベース
    $(window).load ->
      if $(window).width() > 767
        maxHeight = 0
        $('.js-chart-card-main').each ->
          if $(this).height() > maxHeight
            maxHeight = $(this).height()
          return
        $(".js-chart-card-main").height(maxHeight)
    
    
    #コントローラ
    practicing_data = {}
    single_span = $(".progressbar-outline").width() / $(".pattern-card").length
    
    $(document).on 'click', '.js-exchart-controller',->
      
      $(this).siblings().removeClass("active")
      $(this).addClass("active")
      
      pattern_no = $(this).attr("pattern_no")
      param = $(this).attr("param")
      practicing_data[pattern_no] = parseInt(param, 10)
      
      $("#exchart_data").val(JSON.stringify(practicing_data))
      
      if $("#exchart_data").val() != ""
        progress = Object.keys(JSON.parse($("#exchart_data").val())).length
      else
        progress = 0
      
      bar_width = single_span * progress
      $(".js-trigger-bar").css("width", bar_width)

  if $("body").hasClass("excharts show") || $("body").hasClass("excharts compare_result") || $("body").hasClass("mypage")
    if $("body").hasClass("excharts show") || $("body").hasClass("mypage")
      data1_color = "rgba(235, 137, 94, .85)"
      data2_color = "rgba(235, 137, 94, .35)"
    else if $("body").hasClass("excharts compare_result")
      data1_color = "rgba(110, 174, 133, 0.85)"
      data2_color = "rgba(110, 174, 133, 0.35)"
    
    patterns = gon.patterns
    ctx = document.getElementById("myChart").getContext("2d")
    
    #データの成形
    original_data = JSON.parse(gon.data)
    if $("body").hasClass("excharts compare_result")
      original_data2 = JSON.parse(gon.data2)
    data_length = Object.keys(original_data).length - 1
    
    if $("body").hasClass("excharts compare_result")
      cleaned_data = {}
      for i in [0..data_length] by 1
        if original_data2[i] == 0 && original_data[i] == 1
          cleaned_data[i] = 1
        else if original_data2[i] == 1
          cleaned_data[i] = 1
        else
          cleaned_data[i] = 0
      original_data2 = cleaned_data
    
    data = []
    data2 = []
    
    for i in [1..data_length] by 3
      d1 = original_data[i] + original_data[i+1] + original_data[i+2]
      data.push(d1)
      if $("body").hasClass("excharts compare_result")
        d2 = original_data2[i] + original_data2[i+1] + original_data2[i+2]
        data2.push(d2)
      
    #ラベル
    label = ["test","test","test","test","test","test","test","test","test","test","test","test","test"]
    
    #チャートのオプション
    options = {scale:
                display: true
                pointLabels:
                  display: true
                  fontSize: 15
                ticks:
                  stepSize: 1
                  beginAtZero: true
                  display: false
                  max: 3
                  min: 0
              legend:
                display: false
              animation: false
              }
                
    #チャート生成
    myChart = new Chart(ctx,
      type: 'radar'
      data:
        labels: label
        
        datasets: [ {
          data: data
          pointRadius:0
          pointHitRadius:20
          backgroundColor: data1_color
          borderColor: data1_color
          borderWidth: 1
        },{
          data: data2
          pointRadius:0
          pointHitRadius:20
          backgroundColor: data2_color
          borderColor: data2_color
          borderWidth: 1
        } ]
      options: options)
    
    #ラベルクリック
    #$('#myChart').click (e) ->
    #  helpers = Chart.helpers
    #  eventPosition = helpers.getRelativePosition(e, myChart.chart)
    #  mouseX = eventPosition.x
    #  mouseY = eventPosition.y
    #  activePoints = []
    #  # loop through all the labels
    #  helpers.each myChart.scale.ticks, ((label, index) ->
    #    i = @getValueCount() - 1
    #    while i >= 0
    #      # here we effectively get the bounding box for each label
    #      pointLabelPosition = @getPointPosition(i, @getDistanceFromCenterForValue(if @options.reverse then @min else @max) + 5)
    #      pointLabelFontSize = helpers.getValueOrDefault(@options.pointLabels.fontSize, Chart.defaults.global.defaultFontSize)
    #      pointLabeFontStyle = helpers.getValueOrDefault(@options.pointLabels.fontStyle, Chart.defaults.global.defaultFontStyle)
    #      pointLabeFontFamily = helpers.getValueOrDefault(@options.pointLabels.fontFamily, Chart.defaults.global.defaultFontFamily)
    #      pointLabeFont = helpers.fontString(pointLabelFontSize, pointLabeFontStyle, pointLabeFontFamily)
    #      ctx.font = pointLabeFont
    #      labelsCount = @pointLabels.length
    #      halfLabelsCount = @pointLabels.length / 2
    #      quarterLabelsCount = halfLabelsCount / 2
    #      upperHalf = i < quarterLabelsCount or i > labelsCount - quarterLabelsCount
    #      exactQuarter = i == quarterLabelsCount or i == labelsCount - quarterLabelsCount
    #      width = ctx.measureText(@pointLabels[i]).width + 20
    #      height = pointLabelFontSize + 20
    #      x = undefined
    #      y = undefined
    #      if i == 0 or i == halfLabelsCount
    #        x = pointLabelPosition.x - (width / 2)
    #      else if i < halfLabelsCount
    #        x = pointLabelPosition.x
    #      else
    #        x = pointLabelPosition.x - width
    #      if exactQuarter
    #        y = pointLabelPosition.y - (height / 2)
    #      else if upperHalf
    #        y = pointLabelPosition.y - height
    #      else
    #        y = pointLabelPosition.y
    #      # check if the click was within the bounding box
    #      if mouseY >= y and mouseY <= y + height and mouseX >= x and mouseX <= x + width
    #        activePoints.push
    #          index: i
    #          label: @pointLabels[i]
    #      i--
    #    return
    #  ), myChart.scale
    #  firstPoint = activePoints[0]
    #  if firstPoint != undefined
    #    $("#pattern_list").modal()
    #    $(".js-place-pattern-list").empty()
    #    if gon.locale == "ja"
    #      for i in [1..3]
    #        pattern = patterns[(firstPoint.index * 3) + i]
    #        $(".js-place-pattern-list").append('<a href="/patterns/' + pattern.language_id + '/' + pattern.pattern_no + '?path_id=' + path_id + '"><p class="row-space-2">・' + pattern.pattern_name_ja + '</p></a>')
    #    else
    #      for i in [1..3]
    #        pattern = patterns[(firstPoint.index * 3) + i]
    #        $(".js-place-pattern-list").append('<a href="/patterns/' + pattern.language_id + '/' + pattern.pattern_no + '?path_id=' + path_id + '"><p class="row-space-2">・' + pattern.pattern_name_en + '</p></a>')
    #  return
    
    $(document).on 'click', '.js-trigger-switch-primary', ->
      $(this).removeClass("in-active")
      $(".js-trigger-switch-secondary").addClass("in-active")
      $(".exchart-patterns-list-container").removeClass("is-secondary")
    
    $(document).on 'click', '.js-trigger-switch-secondary', ->
      $(this).removeClass("in-active")
      $(".js-trigger-switch-primary").addClass("in-active")
      $(".exchart-patterns-list-container").addClass("is-secondary")
      
    $(document).on 'click', '.js-trigger-pattern-detail', ->
      $.ajax(
        type: 'GET',
        url: '/excharts/' + $(this).attr('language_id') + '/'+$(this).attr('pattern_no') + '/detail'
      ).done ->
        $('#pattern_detail').modal()
        href = $('.js-link-to-pattern').attr("href")
        href = href + "?path_id=" + path_id
        $('#pattern_detail a').attr("href", href)
    
    $('.js-trigger-add-practice').click ->
      language_id = $(this).attr("language_id")
      pattern_no = $(this).attr("pattern_no")
      $("#practice_language_id").val(language_id)
      $("#practice_pattern_no").val(pattern_no)
      $('#add-practice').modal()
      
      
    #canvas画像化
    
    
    Base64toBlob = (base64) ->
      tmp = base64.split(',')
      data = atob(tmp[1])
      mime = tmp[0].split(':')[1].split(';')[0]
      buf = new Uint8Array(data.length)
      i = 0
      while i < data.length
        buf[i] = data.charCodeAt(i)
        i++
      blob = new Blob([ buf ], type: mime)
      blob
      
    imageType = 'image/png'
    fileName = 'sample.png'
    canvas = document.getElementById('myChart')
    base64 = canvas.toDataURL(imageType)
    blob = Base64toBlob(base64)
    
    $(".chart-image").val(base64)
    
  if $("body").hasClass("excharts compare")
    array = []
    changed = false
    $('.js-set-compare-result').click (e)->
      e.preventDefault()
      if $(this).hasClass("selected")
        id = $(this).attr("chart_id")
        if $("#compare_chart_id_1").val() == id
          $("#compare_chart_id_1").val("")
        else if $("#compare_chart_id_2").val() == id
          $("#compare_chart_id_2").val("")
        $(this).removeClass("selected")
        $(this).find(".p").text("選択する")
      else
        id = $(this).attr("chart_id")
        $(this).addClass("selected")
        $(this).find(".p").text("選択中")
        if $("#compare_chart_id_1").val() == ""
          $("#compare_chart_id_1").val(id)
        else if $("#compare_chart_id_2").val() != "" && changed == false
          pre = $("#compare_chart_id_1").val()
          $("#card"+pre).removeClass("selected")
          $(this).find(".p").text("選択する")
          $("#compare_chart_id_1").val(id)
          changed = true
        else if $("#compare_chart_id_2").val() != "" && changed == true
          pre = $("#compare_chart_id_2").val()
          $("#card"+pre).removeClass("selected")
          $(this).find(".p").text("選択する")
          $("#compare_chart_id_2").val(id)
          changed = false
        else
          $("#compare_chart_id_2").val(id)
      
      if $("#compare_chart_id_1").val() != "" && $("#compare_chart_id_2").val() != ""
        $(".js-compare-submit").show()
      else
        $(".js-compare-submit").hide()
        
    $('.js-compare-submit').click (e)->
      e.preventDefault()
      
      id_1 = $("#compare_chart_id_1").val()
      id_2 = $("#compare_chart_id_2").val()
      
      location.href = "compare/result?chart_id_1=" + id_1 + "&chart_id_2=" + id_2