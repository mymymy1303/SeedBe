function CanhCamResponsive() {
	// Set BG Mask
	$('[bg-mask]').each(function () {
		var bgimg = $(this).attr('bg-mask');
		$(this).css({
			"mask-image": "url(" + bgimg + ")",
			"mask-position": "center center",
			"mask-repeat": "no-repeat",
			"-webkit-mask-image": "url(" + bgimg + ")",
			"-webkit-mask-position": "center center",
			"-webkit-mask-repeat": "no-repeat"
		});
	})
	// Set BG Resposive
	$('[bg-img]').each(function () {
		var bgimg = $(this).attr('bg-img');
		var pos = $(this).attr('bg-pos');
		var size = $(this).attr('bg-size');
		if (pos && pos.length > 0) {
			$(this).css({
				"background-position": pos
			});
		} else {
			$(this).css({
				"background-position": "center center"
			});
		}
		if (size && size.length > 0) {
			$(this).css({
				"background-size": size
			});
		} else {
			$(this).css({
				"background-size": "cover"
			});
		}
		$(this).css({
			"background-image": "url(" + bgimg + ")"
		});
	});
};

$(function () {
	if (true) {
		CanhCamResponsive();
	}
})