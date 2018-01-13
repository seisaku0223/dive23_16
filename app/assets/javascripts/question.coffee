$(document).on 'ready page:load', ->
  $('#question_tags').tagit
    fieldName:   'question[tag_list]'
    singleField: true

  if gon.question_tags?
    for tag in gon.question_tags
      $('#question_tags').tagit 'createTag', tag
