$(document).ready(function () {

	//////////////////////////    HEADER    /////////////////////////////////

	//Hamburger Toogle Effect
	const $hamburger = $(".hamburger")
	$hamburger.on("click", (e) => {
		$hamburger.toggleClass("is-active")
		$('.side-nav').toggleClass('side-nav-active')
	})

	//Trigger setItemHeight, setItemWidth when document is ready
	setItemWidth($('.megamenu'), $('.tools-nav>.container').width())
	setItemHeight($('.megamenu-item img'), $('.megamenu-item').width())

	//Megamenu toggle handler
	$('.desktop-nav-product .main-nav-item').on('click', (e) => {
		let current_nav = e.currentTarget
		$('.main-nav-item').each((i, e) => {
			$(e).not($(current_nav)).removeClass('main-nav-item-active')
		})
		$(e.currentTarget).toggleClass('main-nav-item-active')
	})
	$('.desktop-nav-pages .main-nav-item').on('click', (e) => {
		let current_nav = e.currentTarget
		$('.main-nav-item').each((i, e) => {
			$(e).not($(current_nav)).removeClass('main-nav-item-active')
		})
		$(e.currentTarget).toggleClass('main-nav-item-active')
	})
	$('.desktop-nav-product .main-nav-item .megamenu-item-title').on('click', (e) => {
		e.stopPropagation()
	})
	$('.desktop-nav-product .main-nav-item ul li a').on('click', (e) => {
		e.stopPropagation()
	})
	$('.desktop-nav-product .megamenu').on('click', (e) => {
		e.stopPropagation()
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


	//Menu on resize
	const logo_mapping = new MappingListener({
		selector: ".logo",
		mobileWrapper: ".logo-mobile",
		desktopWrapper: ".logo-desktop",
		method: "appendTo",
		breakpoint: 992
	}).watch()

	//Cart on resize
	const cart_mapping = new MappingListener({
		selector: ".searchbox",
		mobileWrapper: ".mobile-search",
		desktopWrapper: ".search-wrapper",
		method: "appendTo",
		breakpoint: 992
	}).watch()

	//Search on resize
	const search_mapping = new MappingListener({
		selector: ".cart",
		mobileWrapper: ".mobile-cart",
		desktopWrapper: ".cart-wrapper",
		method: "appendTo",
		breakpoint: 992
	}).watch()

	//Megamenu on resize
	const mega_product_mapping = new MappingListener({
		selector: ".desktop-nav-product",
		mobileWrapper: ".side-nav",
		desktopWrapper: ".desktop-nav-product-wrapper",
		method: "appendTo",
		breakpoint: 992
	}).watch()
	const mega_pages_mapping = new MappingListener({
		selector: ".desktop-nav-pages",
		mobileWrapper: ".side-nav",
		desktopWrapper: ".desktop-nav-pages-wrapper",
		method: "appendTo",
		breakpoint: 992
	}).watch()

	//Search mobile onclick
	$('.mobile-search').on('click', (e) => {
		$(e.currentTarget).toggleClass('active');
	})

	$('.side-nav .megamenu-item-title i').on('click', (e) => {
		let current_nav = $(e.currentTarget).parent().parent()
		$('.megamenu-item').each((i, e) => {
			$(e).not($(current_nav)).removeClass('active')
		})
		$(e.currentTarget).parent().parent().toggleClass('active')
	})
})

const setItemHeight = (itemSelector, itemHeight) => {
	itemSelector.css('height', itemHeight)
}


const setItemWidth = (itemSelector, itemWidth) => {
	itemSelector.css('width', itemWidth)
}

window.onresize = function () {
	if ($(window).width() >= 992) {
		setItemWidth($('.megamenu'), $('.tools-nav>.container').width())
		setItemHeight($('.megamenu-item img'), $('.megamenu-item').width())
	}
}

