$ ->
  exchart_clean_data = (data) ->
    data_1 = data[2] + data[3] + data[4]
    data_2 = data[5] + data[6] + data[7]
    data_3 = data[8] + data[9] + data[10]
    data_4 = data[12] + data[13] + data[14]
    data_5 = data[15] + data[16] + data[17]
    data_6 = data[18] + data[19] + data[20]
    data_7 = data[22] + data[23] + data[24]
    data_8 = data[25] + data[26] + data[27]
    data_9 = data[28] + data[29] + data[30]
    data_10 = data[32] + data[33] + data[34]
    data_11 = data[35] + data[36] + data[37]
    data_12 = data[38] + data[39] + data[40]
    creaned_data = [data_1, data_2, data_3, data_4, data_5, data_6, data_7, data_8, data_9, data_10, data_11, data_12]
    return creaned_data
      
  if $("body").hasClass("excharts index") || $("body").hasClass("excharts compare")
    $(document).on 'click', '.js-trigger-modal-select-mode',->
      $("#select_mode").modal()
      return false
    $(".myChart").each (index) ->
      data = eval 'gon.data' + index
      
      data1_color = "rgba(235, 137, 94, .85)"
      
      ctx = eval 'document.getElementById("myChart' + index + '").getContext("2d")'
      
      #データの成形
      original_data = JSON.parse(data)
      delete original_data['1']; delete original_data['11']; delete original_data['21']; delete original_data['31'];
      data = exchart_clean_data(original_data)

      label = ["test","test","test","test","test","test","test","test","test","test","test","test"]
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
      
      pattern_index = $(this).attr("pattern_index")
      param = $(this).attr("param")
      practicing_data[pattern_index] = parseInt(param, 10)
      
      $("#exchart_data").val(JSON.stringify(practicing_data))
      
      if $("#exchart_data").val() != ""
        progress = Object.keys(JSON.parse($("#exchart_data").val())).length
      else
        progress = 0
      
      bar_width = single_span * progress
      $(".js-trigger-bar").css("width", bar_width)
      
      if progress == 40
        $("input[type='submit']").attr("disabled", false)
      else
        $("input[type='submit']").attr("disabled", true)

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
      cleaned_data = {}
      for i in [1..40] by 1
        if original_data2[i] == 0 && original_data[i] == 1
          cleaned_data[i] = 1
        else if original_data2[i] == 1
          cleaned_data[i] = 1
        else
          cleaned_data[i] = 0
      original_data2 = cleaned_data
      delete original_data2['1']; delete original_data2['11']; delete original_data2['21']; delete original_data2['31'];
      data2 = exchart_clean_data(original_data2)
      console.log data2
      
    delete original_data['1']; delete original_data['11']; delete original_data['21']; delete original_data['31'];
    data = exchart_clean_data(original_data)
    console.log data
    
    #ラベル
    label = ["一歩踏み出す","自分なりに\n実践を重ねる","本質を\n捉えて動く","知ってもらう","価値を伝える","幸せをもたらす","つながり始める","心が通う体験を\n共有する","ファンとともに進む","実践仲間と\n出会う","さらに磨いていく","実践コミュニティを\nともにつくる"]
    
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
    
    $(document).on 'click', '.js-trigger-switch-primary', ->
      $(this).removeClass("in-active")
      $(".js-trigger-switch-secondary").addClass("in-active")
      $(".exchart-patterns-list-container").removeClass("is-secondary")
    
    $(document).on 'click', '.js-trigger-switch-secondary', ->
      $(this).removeClass("in-active")
      $(".js-trigger-switch-primary").addClass("in-active")
      $(".exchart-patterns-list-container").addClass("is-secondary")
      
    
    #ラベルクリック処理      
    if $(window).width() > 767
      fullscreen = false
    else
      fullscreen = false
    
    unit_no = ""
    $('.js-exchart-label').click ->
      unit_no = $(this).attr('unit_no')
      
    modal_setting = (unit_no) ->
      $(".exchart-axis-pattern").addClass("hide").removeClass("is-active")
      url = "/patterns/unit/" + unit_no
      $.ajax(
        type: 'GET',
        url: url
      ).done (data) ->
        if $("body").hasClass("excharts compare_result")
          original_data = original_data2
        for value, index in data
          pattern_index = value.pattern_index
          if original_data[pattern_index] == 1
            $(".exchart-axis-pattern:eq(" + index + ")").addClass("is-active")
          $(".exchart-axis-pattern:eq(" + index + ")").attr("href", "/patterns/" + value.id)
          $(".exchart-axis-pattern:eq(" + index + ") h4").text(value.pattern_name)
          $(".exchart-axis-pattern:eq(" + index + ") p").text(value.summary)
        $(".exchart-axis-pattern").removeClass("hide")
      
    $('.js-exchart-label').modaal({
        fullscreen: fullscreen
        before_open: ->
          modal_setting(unit_no)
          return
      })
      
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