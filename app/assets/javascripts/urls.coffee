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
	shorten = $(".shorten-#{id} a").text().split("/").pop().trim()
	$(".link-url-#{id}").html("<input type='text' name='url[url]' class='form-control' value='#{urlDestination}' data-url='#{urlDestination}' /><div class='text'></div>")
	$(".shorten-#{id}").html("<input type='text' name='url[shorten]' class='form-control' value='#{shorten}' data-shorten='#{shorten}' /><div class='text'></div>")
	$(".action-button-#{id}").html("
		<a href='javascript:void(0);' class='btn btn-primary btn-sm btn-save save-action#{id}' data-id='#{id}'>Save</a>
		&nbsp;
		<a href='javascript:void(0);' class='btn btn-sm btn-danger btn-cancel-shorten' data-id='#{id}'>Cancel</a>
	")
	$("#form-my-links").attr("action", "/urls/#{id}/update")

$(document).on "click", ".btn-cancel-shorten", ->
	id = $(@).data("id")
	urlDestination = $(".link-url-#{id} input").data("url")
	shorten = $(".shorten-#{id} input").data("shorten")
	short = window.location.origin + "/" + shorten
	$(".link-url-#{id}").html("<a href='#{urlDestination}' target='_blank'>#{urlDestination}</a>")
	$(".shorten-#{id}").html("<a href='#{short}' target='_blank'>#{short}</a>")
	$(".action-button-#{id}").html("
		<a data-id='#{id}' class='btn btn-edit-shorten edit-shorten-#{id}' href='javascript:void(0);'>Edit</a>
		<span>|</span>
		<a data-confirm='Do you wish to delete this Short URL?' rel='nofollow' data-method='delete' data-remote='true' href='/urls/#{id}'>Delete</a>
	")

$(document).on "click", ".btn-save", ->
	id = $(@).data("id")
	urlDestination = $(".link-url-#{id} input").val()
	shorten = $(".shorten-#{id} input").val()

	$.ajax
		url: "/urls/#{id}"
		type: "PUT"
		data:
			id: id
			url:
				url: urlDestination
				shorten: shorten