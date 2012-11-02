$ ->
  class Form
    constructor: ->
      @el = $('form')
      @open = yes
      @inputEl = @el.find('input').first()
      @buttonEl = @el.find('a.button')
      @successEl = @el.find('.success')
      @errorEl = @el.find('.error')
      @spinner = null
      @_initHandlers()

    email: ->
      $.trim(@inputEl.val())

    isEmailValid: ->
      @email().match(/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i) != null

    _startSpinner: ->
      progressEl = @el.find('.progress')
      opts = {length: 6, width: 3, radius: 8}
      @spinner = new Spinner(opts).spin()
      progressEl.append @spinner.el

    _initHandlers: ->
      @el.submit =>
        @_handleSubmission() if @open
        false

      @buttonEl.click =>
        @_handleSubmission() if @open
        false

    _handleSubmission: ->
      if @isEmailValid()
        @inputEl.attr('readonly', 'readonly').blur()
        @errorEl.hide()
        @_startSpinner()
        $.ajax
          type: "POST"
          url: "/subscribe"
          data: {'email': @email()}
          success: =>
            @spinner.stop()
            @successEl.show()
            @open = no
      else
        @errorEl.show()

  new Form()
