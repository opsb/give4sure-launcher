function setDefaultsForIphoneBookmark(opts){
	document.title = opts.title;
	$("[rel='apple-touch-icon']").attr("href", opts.touchIconUrl);
}

function updateBrowserAddress(href){
	history.pushState({}, '', href);
}

function showInstructions(){
	$('.instructions').show();
}

$(document).ready(function(){

	$(".retailers a").click(function(event){
		event.preventDefault();
		
		updateBrowserAddress($(this).attr("href"));

		setDefaultsForIphoneBookmark({
			title: $(this).data('retailer-name'),
			touchIconUrl: $(this).data("retailer-touch-icon")
		});

		showInstructions();
	});
});
