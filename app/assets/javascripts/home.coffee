ready = ->
  $("a.why-yuk-link").click ->
    animate($("#why-yuk"))

  $("a.contact-link").click ->
    animate($("#contact"))

  animate = (element) ->
    $("html, body").animate
      scrollTop: element.offset().top
    , 800

$(document).ready(ready)
$(document).on("page:load", ready)