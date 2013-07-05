jQuery(function($) {
    $('#cropbox').Jcrop({
			aspectRatio: 1,
			setSelect: [0, 0, 400, 400],
      onSelect: showCoords,
      onChange: showCoords	
		});
});

function showCoords(c)
{
	$('#shop_crop_x').val(c.x);
	$('#shop_crop_y').val(c.y);
	$('#shop_crop_w').val(c.w);
	$('#shop_crop_h').val(c.h);
	updatePreview(c);

};

function updatePreview(c)
{
	$('#preview').css({
	      width: Math.round(62/c.w * $('#cropbox').width())+'px',
				height: Math.round(62/c.h * $('#cropbox').height())+'px',
				"margin-left": "-"+ Math.round(62/c.w * c.x)+"px",
				"margin-top": "-"+Math.round(62/c.h * c.y)+"px"
	    });

};