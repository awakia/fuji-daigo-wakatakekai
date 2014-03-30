$ ->
  $('.ui-show-modal').each ->
    dialog = $($(this).attr("href"))
    $(this).click (e) ->
      e.stopPropagation()
      e.preventDefault()
      dialog.show()
      innerElement = dialog.find('.ui-modal-contents-inner')
      innerElement.css('margin-left', -innerElement.outerWidth() / 2).css('margin-top', -innerElement.outerHeight(false) / 2)
      dialog.hide()
      dialog.fadeIn(300)


    dialog.find(".ui-modal-close").click (e) ->
      e.preventDefault()
      dialog.fadeOut(300)
