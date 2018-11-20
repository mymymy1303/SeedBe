$(document).ready(function () {

	//////////////////////////    HEADER    /////////////////////////////////

	//Hamburger Toogle Effect
	const $hamburger = $(".hamburger")
	$hamburger.on("click", (e) => {
		$hamburger.toggleClass("is-active")
	})

	//Trigger setItemHeight, setItemWidth when document is ready
	setItemWidth($('.megamenu'), $('.tools-nav>.container').width())
	setItemHeight($('.megamenu-item img'), $('.megamenu-item').width())

	//Megamenu toggle handler
	$('.main-nav-item').on('click', (e) => {
		let current_nav = e.currentTarget
		$('.main-nav-item').each((i, e) => {
			$(e).not($(current_nav)).removeClass('main-nav-item-active')
		})
		$(e.currentTarget).toggleClass('main-nav-item-active')
	})
	$('.main-nav-item.search-wrapper .searchbox').on('click', (e) => {
		e.stopPropagation()
	})
	$('.main-nav-item.cart-wrapper .cart-expand').on('click', (e) => {
		e.stopPropagation()
	})
	$('.main-nav-item.cart-wrapper .cart-close-button').on('click', (e) => {
		$(e.currentTarget).parent().parent().parent().removeClass('main-nav-item-active')
	})
})

const setItemHeight = (itemSelector, itemHeight) => {
	itemSelector.css('height', itemHeight)
}


const setItemWidth = (itemSelector, itemWidth) => {
	itemSelector.css('width', itemWidth)
}

window.onresize = function () {
	setItemWidth($('.megamenu'), $('.tools-nav>.container').width())
	setItemHeight($('.megamenu-item img'), $('.megamenu-item').width())
}
