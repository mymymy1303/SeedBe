const theHuyApp = {
	ready: (fn) => {
		if (document.attachEvent ? document.readyState === "complete" : document.readyState !== "loading") {
			fn();
		} else {
			document.addEventListener('DOMContentLoaded', fn);
		}
	},
	select: (s) => {
		return document.querySelector(s);
	},
	selectAll: (s) => {
		return document.querySelectorAll(s);
	},
	avoidNull: (f) => {
		try {
			f()
		} catch (error) { }
	},
	toggle: (el, className) => {
		let s = theHuyApp.select(el);
		if (s.classList) {
			s.classList.toggle(className);
		} else {
			let classes = s.className.split(' ');
			let i = classes.indexOf(className);

			if (i >= 0)
				classes.splice(i, 1);
			else
				classes.push(className);

			s.className = classes.join(' ');
		}
	},
	active: (el, a, o = false) => {
		if (o) {

		} else {
			theHuyApp.toggle(el, a);
		}
	},
	each: (s, f) => {
		let es = theHuyApp.selectAll(s);
		Array.prototype.forEach.call(es, f);
	}
}


theHuyApp.ready(() => {
	//Tiny slider initialization for Homepage banner
	theHuyApp.avoidNull(homeBannerInit);
	theHuyApp.avoidNull(homeSaleSliderInit);
	theHuyApp.avoidNull(homeSaleSliderMapping);
	theHuyApp.avoidNull(homeNewProductSliderInit);
	theHuyApp.avoidNull(homeNewProductSliderMapping);

	//About
	theHuyApp.avoidNull(aboutNavMapping);
	theHuyApp.avoidNull(aboutNavToggle);
	
	//Dichvuhotro
	theHuyApp.avoidNull(dichvuhotroNavMapping);
	theHuyApp.avoidNull(dichvuhotroNavToggle);

	//Hoidap
	theHuyApp.avoidNull(hoidapNavMapping);
	theHuyApp.avoidNull(hoidapNavToggle);
})


const homeBannerInit = () => {
	return tns({
		container: '.banner-home',
		items: 1,
		slideBy: 1,
		nav: false,
		controlsText: ["<span class='lnr lnr-chevron-left'></span>", "<span class='lnr lnr-chevron-right'></span>"],
	})
}

const homeSaleSliderInit = () => {
	return tns({
		container: '.home-product-sale-slider',
		items: 1,
		slideBy: 1,
		nav: false,
		controlsText: ["<span class='lnr lnr-chevron-left'></span>", "<span class='lnr lnr-chevron-right'></span>"],
		responsive: {
			576: {
				items: 2,
				gutter: 30
			},
			768: {
				items: 3,
			},
			992: {
				items: 4
			}
		}
	})
}

const homeNewProductSliderInit = () => {
	return tns({
		container: '.home-product-slider',
		items: 1,
		slideBy: 1,
		nav: false,
		controlsText: ["<span class='lnr lnr-chevron-left'></span>", "<span class='lnr lnr-chevron-right'></span>"],
		responsive: {
			576: {
				items: 2,
				gutter: 30
			},
			768: {
				items: 3,
			},
			992: {
				items: 4
			}
		}
	})
}

const homeSaleSliderMapping = () => {
	try {
		Mapping.mapElements.from('.home-3 .tns-controls').to('.home-3 .tns-ovh').use('prependTo');
	} catch (error) {

	}
}

const homeNewProductSliderMapping = () => {
	try {
		Mapping.mapElements.from('.home-5 .tns-controls').to('.home-5 .tns-ovh').use('prependTo');
	} catch (error) {

	}
}

const aboutNavMapping = () => {
	return new MappingListener({
		selector: ".about-nav",
		desktopWrapper: ".desktop-about-nav",
		desktopMethod: "appendTo",
		mobileWrapper: ".mobile-about-nav",
		mobileMethod: "prependTo",
		breakpoint: 992
	}).watch()
}


const aboutNavToggle = () => {
	$('.mobile-about-nav .mobile-toggle-button').on('click', function() {
		$('.mobile-about-nav').toggleClass('active');
	})
	$('.mobile-about-nav .mobile-about-nav-backdrop').on('click', function() {
		$('.mobile-about-nav').removeClass('active');
	})
}

const dichvuhotroNavMapping = () => {
	return new MappingListener({
		selector: ".dichvuhotro-nav",
		desktopWrapper: ".desktop-dichvuhotro-nav",
		desktopMethod: "appendTo",
		mobileWrapper: ".mobile-dichvuhotro-nav",
		mobileMethod: "prependTo",
		breakpoint: 992
	}).watch()
}


const dichvuhotroNavToggle = () => {
	$('.mobile-dichvuhotro-nav .mobile-toggle-button').on('click', function() {
		$('.mobile-dichvuhotro-nav').toggleClass('active');
	})
	$('.mobile-dichvuhotro-nav .mobile-dichvuhotro-nav-backdrop').on('click', function() {
		$('.mobile-dichvuhotro-nav').removeClass('active');
	})
}

const hoidapNavMapping = () => {
	return new MappingListener({
		selector: ".hoidap-nav",
		desktopWrapper: ".desktop-hoidap-nav",
		desktopMethod: "appendTo",
		mobileWrapper: ".mobile-hoidap-nav",
		mobileMethod: "prependTo",
		breakpoint: 992
	}).watch()
}


const hoidapNavToggle = () => {
	$('.mobile-hoidap-nav .mobile-toggle-button').on('click', function() {
		$('.mobile-hoidap-nav').toggleClass('active');
	})
	$('.mobile-hoidap-nav .mobile-hoidap-nav-backdrop').on('click', function() {
		$('.mobile-hoidap-nav').removeClass('active');
	})
}








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
	// $('.main-nav-item.cart-wrapper .cart-expand').on('click', (e) => {
	// 	e.stopPropagation()
	// })
	// $('.main-nav-item.cart-wrapper .cart-close-button').on('click', (e) => {
	// 	$(e.currentTarget).parent().parent().parent().removeClass('main-nav-item-active')
	// })


	//Menu on resize
	const logo_mapping = new MappingListener({
		selector: ".logo",
		mobileWrapper: ".logo-mobile",
		desktopWrapper: ".logo-desktop",
		mobileMethod: "appendTo",
		desktopMethod: "appendTo",
		breakpoint: 992
	}).watch()

	//Cart on resize
	const cart_mapping = new MappingListener({
		selector: ".searchbox",
		mobileWrapper: ".mobile-search",
		desktopWrapper: ".search-wrapper",
		mobileMethod: "appendTo",
		desktopMethod: "appendTo",
		breakpoint: 992
	}).watch()

	//Search on resize
	const search_mapping = new MappingListener({
		selector: ".cart",
		mobileWrapper: ".mobile-cart",
		desktopWrapper: ".cart-wrapper",
		mobileMethod: "appendTo",
		desktopMethod: "appendTo",
		breakpoint: 992
	}).watch()

	//Megamenu on resize
	const mega_product_mapping = new MappingListener({
		selector: ".desktop-nav-product",
		mobileWrapper: ".side-nav",
		desktopWrapper: ".desktop-nav-product-wrapper",
		mobileMethod: "appendTo",
		desktopMethod: "appendTo",
		breakpoint: 992
	}).watch()
	const mega_pages_mapping = new MappingListener({
		selector: ".desktop-nav-pages",
		mobileWrapper: ".side-nav",
		desktopWrapper: ".desktop-nav-pages-wrapper",
		mobileMethod: "appendTo",
		desktopMethod: "appendTo",
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