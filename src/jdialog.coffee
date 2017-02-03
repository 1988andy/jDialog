"use strict"

((window)->
  if typeof jQuery is 'undefined'
    throw new Error('jDialog component requires jQuery')
  if typeof layer is 'undefined'
    throw new Error('jDialog component requires layer')


  jDialog = ->
    @VERSION = "2.0.0"
    @options =
      title: "jDialog v2"
      shade: [0.2, "#000"]
      shadeClose: false
      shift: 0    # 0-9
      maxmin: true
      fix: true
      btn: ["OK", "Cancel"]
      closeBtn: 1     #0-2
      tips: [1, '#f0ad4e']
      tipsTime: 3000
      loadingIcon: 1      #0-2
      loadingShade: [0.6, "#fff"]

      useAlertify: true
      wait: 2
      logPosition: "bottom right"
      closeLogOnClick: false
    @init()

  jDialog.prototype =
    init: ->
      if not $
        console.error "jQuery Required"
      if @options.useAlertify and typeof alertify is "undefined"
        console.error "alertify Required"

      if typeof alertify isnt "undefined"
        alertify.logPosition(@options.logPosition)
        alertify.closeLogOnClick(@options.closeLogOnClick)
      return

    _wrapSize: (size) ->
      if size and $.isArray size
        size[0] = size[0] + 'px' if $.isNumeric size[0]
        size[1] = size[1] + 'px' if $.isNumeric size[1]
      else
        size = ['50%', '50%']
      return size

    set: (options) ->
      @options = $.extend {}, @options, options
      @init()

    alert: (msg, callback, options)  ->
      root = @
      options = $.extend {}, root.options, {
        btn: root.options.btn[0]
      }, options
      layer.alert msg, options, callback

    success: (msg, callback, options) ->
      root = @
      options = $.extend {}, root.options, {
        icon: 1
        btn: root.options.btn[0]
      }, options
      if not root.options.useAlertify
        layer.alert msg, options.wait, callback
      else
        alertify.success msg
    info: (msg, callback, options) ->
      root = @
      options = $.extend {}, root.options, {
        icon: 0
        btn: root.options.btn[0]
      }, options
      if not root.options.useAlertify
        layer.alert msg, options, callback
      else
        console.debug options
        alertify.log msg, options.wait, callback

    error: (msg, callback, options) ->
      root = @
      options = $.extend {}, root.options, {
        icon: 2
        btn: root.options.btn[0]
      }, options
      if not root.options.useAlertify
        layer.alert msg, options, callback
      else
        alertify.error msg, options.wait, callback

    confirm: (msg, fnYes, fnCancel, options) ->
      root = @
      options = $.extend {}, root.options, {
        icon: 3
      }, options
      layer.confirm msg, options, (index) ->
        if fnYes
          fnYes(index)
        layer.close index
      , (index) ->
        if fnCancel
          fnCancel(index)

    prompt: (title, fnYes, formType) ->
      root = @
      options = $.extend {}, root.options, {
        title: title
        formType: formType || 1
      }
      layer.prompt options, fnYes

    tip: (msg, selector, options) ->
      layer.tips msg, selector, $.extend {}, @options, {
        shade: false
        btn: null
        closeBtn: 0
        time: @options.tipsTime
      }, options

    show: (selector, title, size) ->
      root = @
      size = ['50%', '50%'] if not size or not $.isArray size
      options = $.extend {}, root.options, {
        type: 1
        btn: null
        area: root._wrapSize size
        content: $(selector)
      }
      layer.open options
    iframe: (url, title, size) ->
      root = @
      size = ['50%', '50%'] if not size or not $.isArray size
      options = $.extend {}, root.options, {
        type: 2,
        btn: null
        area: root._wrapSize size
        content: url,
      }
      layer.open options

    loading: (selector, options) ->
      root = @
      if selector
        options = $.extend {}, {text: 'Loading...'}, options
        html = $('<div class="bn-jdialog-loading"><i class="icon fa fa-spin fa-spinner"></i> <span class="text">' + options.text + '</span></div>')
        $(selector).each ->
          $(this).find('.bn-jdialog-loaded').remove()
          if $(this).find('.bn-jdialog-loading').length > 0
            $(this).find('.bn-jdialog-loading').show()
          else
            h = html.clone()
            $(this).height $(this).height()
              .css 'position', 'relative'
            h.width $(this).outerWidth()
            h.height $(this).outerHeight()
            h.css 'padding-top', h.height() / 2 - 10
            $(this).append h
      else
        options = $.extend {}, root.options, {
# time: second * 1000
          btn: null,
          shade: root.options.loadingShade
        }
        layer.load root.options.loadingIcon, options
      return
    loaded: (selector, selectorContent) ->
      if selector
        $(selector).each ->
          if selectorContent
            $(this).children(':not(.bn-jdialog-loading)').remove()
            $(this).find('.bn-jdialog-loading')
              .removeClass('bn-jdialog-loading')
              .addClass('bn-jdialog-loaded')
              .html(selectorContent)
          else
            $(this).find('.bn-jdialog-loading').remove()
      else
        layer.closeAll "loading"
      return
    close: (dialogResult) ->
      index = layer.getFrameIndex window.name
      layer.close index
      if parent.layer
        index = parent.layer.getFrameIndex window.name
        parent.layer.close index
      return
    closeAll: (dialogResult) ->
      layer.closeAll()
      parent.layer.closeAll() if parent.layer
      return

  window.dialog = new jDialog()) window
