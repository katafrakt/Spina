window.Spina = {}

Trix.config.blockAttributes = $.extend Trix.config.blockAttributes, {
  h1:
    tagName: 'h1'
    singleLine: true
    leaf: true
  h2:
    tagName: 'h2'
    singleLine: true
    leaf: true
  h3:
    tagName: 'h3'
    singleLine: true
    leaf: true
  h4:
    tagName: 'h4'
    singleLine: true
    leaf: true
  h5:
    tagName: 'h5'
    singleLine: true
    leaf: true
  h6:
    tagName: 'h6'
    singleLine: true
    leaf: true
}

class Spina.TrixAttachment
  @photoSelect: (e) ->
    editor_id = $(this).closest('trix-toolbar').data('editor-id')
    $.get("/admin/photos/wysihtml5_select/#{editor_id}")

  @photoInsert: (e, url) ->
    length = this.editor.getDocument().toString().length
    this.editor.setSelectedRange(length - 1)
    this.editor.insertHTML "<img src='#{ url }' />"

document.addEventListener 'trix-file-accept', (e) ->
  e.preventDefault()

$(document).on 'click', '.js-trix-photo', Spina.TrixAttachment.photoSelect

$(document).on 'photo-insert', 'trix-editor', Spina.TrixAttachment.photoInsert
