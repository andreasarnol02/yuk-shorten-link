$(document).on "click", "#url_type_url_default", ->
	$(".type").html("")
	$("#btn-short-url").removeClass("col-md-2")
	$("#btn-short-url").addClass("col-md-6")

$(document).on "click", "#url_type_url_custom", ->
	$(".type").html("
		<input type='text' name='url[shorten]' class='form-control' placeholder='Put your shorten ex: MyMusic' />
	")
	$('.type').addClass("col-md-4")
	$("#btn-short-url").removeClass("col-md-6")
	$("#btn-short-url").addClass("col-md-2")

$(document).on "click", ".btn-edit-shorten", ->
	id = $(@).data("id")
	urlDestination = $(".link-url-#{id} a").text()
	shorten = $(".shorten-#{id} a").text()
	$(".link-url-#{id}").html("<input type='text' name='url[url]' class='form-control' value='#{urlDestination}' data-url='#{urlDestination}' />")
	$(".shorten-#{id}").html("<input type='text' name='url[shorten]' class='form-control' value='#{shorten}' data-shorten='#{shorten}' />")
	$(".action-button-#{id}").html("
		<input type='submit' value='Save' class='btn btn-primary btn-sm' />
		&nbsp;
		<a href='javascript:void(0);' class='btn btn-sm btn-danger btn-cancel-shorten' data-id='#{id}'>Cancel</a>
	")

$(document).on "click", ".btn-cancel-shorten", ->
	id = $(@).data("id")
	urlDestination = $(".link-url-#{id} input").data("url")
	shorten = $(".shorten-#{id} input").data("shorten")
	$(".link-url-#{id}").html("<a href='#{urlDestination}' target='_blank'>#{urlDestination}</a>")
	$(".shorten-#{id}").html("<a href='#{shorten}' target='_blank'>#{shorten}</a>")
	$(".action-button-#{id}").html("
		<a data-id='#{id}' class='btn btn-edit-shorten edit-shorten-#{id}' href='javascript:void(0);'>Edit</a>
		<span>|</span>
		<a data-confirm='Do you wish to delete this Short URL?' rel='nofollow' data-method='delete' data-remote='true' href='/urls/#{id}'>Delete</a>
	")