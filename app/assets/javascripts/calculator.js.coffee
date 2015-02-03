ready = ->
  $('#person_type').change ->
    person_type = $('#person_type :selected').text()
    if person_type == 'Child'
      $('#child_coverage').show()
      $('#field_group').hide()
    else
      $('#field_group').show()
      $('#child_coverage').hide()

$(document).ready(ready)
$(document).on('page:load', ready)
