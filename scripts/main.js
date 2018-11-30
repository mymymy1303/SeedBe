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

	//Thuvien
	theHuyApp.avoidNull(galleryNavCollapsibleInit);
	theHuyApp.avoidNull(galleryNavCollapsible);
	theHuyApp.avoidNull(galleryNavMapping);
	theHuyApp.avoidNull(galleryNavToggle);
	theHuyApp.avoidNull(galleryInit);

	//Blogs
	theHuyApp.avoidNull(sideBlogFormMapping);
	theHuyApp.avoidNull(sideSocialFollowMapping);
})


const homeBannerInit = () => {
	try {
		return tns({
			container: '.banner-home',
			items: 1,
			slideBy: 1,
			nav: false,
			controlsText: ["<span class='lnr lnr-chevron-left'></span>", "<span class='lnr lnr-chevron-right'></span>"],
		})
	} catch (error) {

	}
}

const homeSaleSliderInit = () => {
	try {
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
	} catch (error) {

	}
}

const homeNewProductSliderInit = () => {
	try {
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
	} catch (error) {

	}
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
	try {
		return new MappingListener({
			selector: ".about-nav",
			desktopWrapper: ".desktop-about-nav",
			desktopMethod: "appendTo",
			mobileWrapper: ".mobile-about-nav",
			mobileMethod: "prependTo",
			breakpoint: 992
		}).watch()
	} catch (error) {

	}
}


const aboutNavToggle = () => {
	$('.mobile-about-nav .mobile-toggle-button').on('click', function () {
		$('.mobile-about-nav').toggleClass('active');
	})
	$('.mobile-about-nav .mobile-about-nav-backdrop').on('click', function () {
		$('.mobile-about-nav').removeClass('active');
	})
}

const dichvuhotroNavMapping = () => {
	try {
		return new MappingListener({
			selector: ".dichvuhotro-nav",
			desktopWrapper: ".desktop-dichvuhotro-nav",
			desktopMethod: "appendTo",
			mobileWrapper: ".mobile-dichvuhotro-nav",
			mobileMethod: "prependTo",
			breakpoint: 992
		}).watch()
	} catch (error) {

	}
}


const dichvuhotroNavToggle = () => {
	$('.mobile-dichvuhotro-nav .mobile-toggle-button').on('click', function () {
		$('.mobile-dichvuhotro-nav').toggleClass('active');
	})
	$('.mobile-dichvuhotro-nav .mobile-dichvuhotro-nav-backdrop').on('click', function () {
		$('.mobile-dichvuhotro-nav').removeClass('active');
	})
}

const hoidapNavMapping = () => {
	try {
		return new MappingListener({
			selector: ".hoidap-nav",
			desktopWrapper: ".desktop-hoidap-nav",
			desktopMethod: "appendTo",
			mobileWrapper: ".mobile-hoidap-nav",
			mobileMethod: "prependTo",
			breakpoint: 992
		}).watch()
	} catch (error) {

	}
}


const hoidapNavToggle = () => {
	$('.mobile-hoidap-nav .mobile-toggle-button').on('click', function () {
		$('.mobile-hoidap-nav').toggleClass('active');
	})
	$('.mobile-hoidap-nav .mobile-hoidap-nav-backdrop').on('click', function () {
		$('.mobile-hoidap-nav').removeClass('active');
	})
}

const galleryNavCollapsibleInit = () => {
	$('.gallery-nav .sub-links a.active').closest('.sub-links').slideDown(300);
	$('.gallery-nav .sub-links a.active').closest('.links').addClass('gallery-nav-active');
}

const galleryNavCollapsible = () => {
	try {
		$('.gallery-nav i.lnr.lnr-chevron-down').on('click', function (e) {

			let currentParent = $(e.currentTarget).closest('.links');
			let dropdown = $(currentParent).children(".sub-links");
			$(dropdown).slideToggle(300)
			$(currentParent).toggleClass('gallery-nav-active')

		})
	} catch (error) {

	}
}

const galleryNavMapping = () => {
	try {
		return new MappingListener({
			selector: ".gallery-nav",
			desktopWrapper: ".desktop-gallery-nav",
			desktopMethod: "appendTo",
			mobileWrapper: ".mobile-gallery-nav",
			mobileMethod: "prependTo",
			breakpoint: 992
		}).watch()
	} catch (error) {

	}
}


const galleryNavToggle = () => {
	$('.mobile-gallery-nav .mobile-toggle-button').on('click', function () {
		$('.mobile-gallery-nav').toggleClass('active');
	})
	$('.mobile-gallery-nav .mobile-gallery-nav-backdrop').on('click', function () {
		$('.mobile-gallery-nav').removeClass('active');
	})
}

const galleryInit = () => {
	$(".g-image .images").lightGallery({
		thumbnail: true
	});
}

const sideBlogFormMapping = () => {
	try {
		return new MappingListener({
			selector: ".blog-form",
			desktopWrapper: ".desktop-blog-form",
			desktopMethod: "appendTo",
			mobileWrapper: ".mobile-blog-form",
			mobileMethod: "appendTo",
			breakpoint: 992
		}).watch()
	} catch (error) {

	}
}


const sideSocialFollowMapping = () => {
	try {
		return new MappingListener({
			selector: ".social-follow",
			desktopWrapper: ".desktop-social-follow",
			desktopMethod: "appendTo",
			mobileWrapper: ".mobile-social-follow",
			mobileMethod: "appendTo",
			breakpoint: 992
		}).watch()
	} catch (error) {

	}
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