
$(document).on 'ready page:load', ->
  $('#question_tags').tagit
    fieldName:   'question[tag_list]'
    singleField: true
