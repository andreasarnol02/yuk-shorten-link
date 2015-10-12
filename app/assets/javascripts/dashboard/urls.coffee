$(document).on "click", ".btn-edit", ->
	id = $(@).data("id")
	urlDestination = $(".link-url-#{id}").value()
	$(".link-url-#{id}").html("<input type='text' name='url[url]' class='form-control' value='#{urlDestination}' />")
	