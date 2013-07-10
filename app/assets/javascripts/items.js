jQuery(function($){
		
	//jquery for image gallary on item show page
	$("#thumbnails li a").click(function(e){
		e.preventDefault();
		$("#full li").hide();
		var href= $(this).attr("href")
		$(href).show();
	});
		
	$("#full li").hide();
	$("#full li").first().show();
	
	//jquery to display favorite link on item index page
	$(".image_box").hover(function(){
		$("a.favorite_link", this).show();
	}, function(){
		$("a.favorite_link", this).hide();
	})
	
	$(".hide_link").hover(function(){
		$(this).addClass("hide_link_hover");
	}, function(){
		$(this).removeClass("hide_link_hover");
	})
	

	

	
});