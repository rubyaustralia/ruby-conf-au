$ ->
  class Form
    constructor: ->
      @el = $('form')
      @inputEl = @el.find('input').first()
      @buttonEl = @el.find('input.button')
      @progressEl = @el.find('.progress')
      @successEl = @el.find('.success')
      @_initHandlers()

    email: ->
      $.trim(@inputEl.val())

    isEmailValid: ->
      @email().match(/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i) != null

    _initHandlers: ->
      @el.submit =>
        @_handleSubmission()
        false

      @buttonEl.click =>
        @_handleSubmission()
        false

    _handleSubmission: ->
      if @isEmailValid()
        @inputEl.removeClass('error').attr('readonly', 'readonly').blur()
        @buttonEl.hide()
        @successEl.hide()
        @progressEl.show()
        $.ajax
          type: "POST"
          url: "/subscribe"
          data: {'email': @email()}
          success: =>
            @progressEl.hide()
            @successEl.show()

      else
        @inputEl.addClass('error')

  new Form()
