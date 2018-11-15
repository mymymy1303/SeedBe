$(document).ready(function () {

	//////////////////////////    HEADER    /////////////////////////////////

	//Hamburger Toogle Effect
	const $hamburger = $(".hamburger")
	$hamburger.on("click", (e) => {
		$hamburger.toggleClass("is-active")
	})

	//Trigger setItemHeight, setItemWidth when document is ready
	setItemWidth($('.megamenu'), $('main-nav-item-wrapper').width())
	setItemHeight($('.megamenu-item img'), $('.megamenu-item').width())

	// $('.main-nav-item').on('mouseenter', (e) => {
	// 	$(e.currentTarget).toggleClass('main-nav-item-active')
	// })
	// $('.main-nav-item').on('mouseleave', (e) => {
	// 	$(e.currentTarget).removeClass('main-nav-item-active')
	// })
})

const setItemHeight = (itemSelector, itemHeight) => {
	itemSelector.css('height', itemHeight)
}


const setItemWidth = (itemSelector, itemWidth) => {
	itemSelector.css('width', itemWidth)
}

window.onresize = function () {
	setItemWidth($('.megamenu'), $('main-nav-item-wrapper').width())
	setItemHeight($('.megamenu-item img'), $('.megamenu-item').width())
}
