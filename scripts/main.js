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
	theHuyApp.avoidNull(storeSideBlogFormAndFollowsToMap);
	theHuyApp.avoidNull(injectSideBlogFormAndFollowsToBlogDetails);

	//Ytuongloikhuyen
	theHuyApp.avoidNull(ideaNavCollapsibleInit);
	theHuyApp.avoidNull(ideaNavCollapsible);
	theHuyApp.avoidNull(ideaNavMapping);
	theHuyApp.avoidNull(ideaNavToggle);
	theHuyApp.avoidNull(ideaInit);
	theHuyApp.avoidNull(sideYTuongSocialFollowMapping);
	
	//BST
	theHuyApp.avoidNull(collectionNavMapping);
	theHuyApp.avoidNull(collectionNavToggle);


	//Filter
	theHuyApp.avoidNull(filterNavMapping);
	theHuyApp.avoidNull(filterNavToggle);
	
	//Filter init
	let firstFilter = $('.filter').first();
	firstFilter.children('.name').addClass('active');
	firstFilter.children('.attributes').slideDown(300);
	//Filter toggle
	$('.filter .name').on('click', function (e) {
		let filterParent = $(e.currentTarget).parents('.filter');
		let currentAttributes = $(filterParent).children('.attributes');
		$(e.currentTarget).toggleClass('active');
		$(currentAttributes).slideToggle(300);
	})

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
			selector: ".blog-1 .blog-form",
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
			selector: ".blog-1 .social-follow",
			desktopWrapper: ".desktop-social-follow",
			desktopMethod: "appendTo",
			mobileWrapper: ".mobile-social-follow",
			mobileMethod: "appendTo",
			breakpoint: 992
		}).watch()
	} catch (error) {

	}
}

const ideaNavCollapsibleInit = () => {
	$('.idea-nav .sub-links a.active').closest('.sub-links').slideDown(300);
	$('.idea-nav .sub-links a.active').closest('.links').addClass('idea-nav-active');
}

const ideaNavCollapsible = () => {
	try {
		$('.idea-nav i.lnr.lnr-chevron-down').on('click', function (e) {

			let currentParent = $(e.currentTarget).closest('.links');
			let dropdown = $(currentParent).children(".sub-links");
			$(dropdown).slideToggle(300)
			$(currentParent).toggleClass('idea-nav-active')

		})
	} catch (error) {

	}
}

const ideaNavMapping = () => {
	try {
		return new MappingListener({
			selector: ".idea-nav",
			desktopWrapper: ".desktop-idea-nav",
			desktopMethod: "appendTo",
			mobileWrapper: ".mobile-idea-nav",
			mobileMethod: "prependTo",
			breakpoint: 992
		}).watch()
	} catch (error) {

	}
}


const ideaNavToggle = () => {
	$('.mobile-idea-nav .mobile-toggle-button').on('click', function () {
		$('.mobile-idea-nav').toggleClass('active');
	})
	$('.mobile-idea-nav .mobile-idea-nav-backdrop').on('click', function () {
		$('.mobile-idea-nav').removeClass('active');
	})
}

const ideaInit = () => {
	$(".g-image .images").lightidea({
		thumbnail: true
	});
}

const sideYTuongSocialFollowMapping = () => {
	try {
		return new MappingListener({
			selector: ".ytuong-social-follow",
			desktopWrapper: ".desktop-ytuong-social-follow",
			desktopMethod: "appendTo",
			mobileWrapper: ".mobile-ytuong-social-follow",
			mobileMethod: "appendTo",
			breakpoint: 992
		}).watch()
	} catch (error) {

	}
}

const storeSideBlogFormAndFollowsToMap = () => {
	try {
		let blogFormHtml = $('.blog-1 .blog-form').parent().html();
		let blogFollowHtml = $('.blog-1 .social-follow').parent().html();
		if (Cookies.get('blog_form_html') == null) {
			Cookies.set('blog_form_html', blogFormHtml, { expires: 1 });
		}
		if (Cookies.get('blog_follow_html') == null) {
			Cookies.set('blog_follow_html', blogFollowHtml, { expires: 1 });
		}
	} catch (error) {

	}
}

const injectSideBlogFormAndFollowsToBlogDetails = () => {
	try {
		let currentSideBlogDetail = $('.side-blog-detail-wrapper').html();
		currentSideBlogDetail = currentSideBlogDetail + Cookies.get('blog_form_html') + Cookies.get('blog_follow_html');
		$('.side-blog-detail-wrapper').html(currentSideBlogDetail);
	} catch (error) {

	}
}

const collectionNavMapping = () => {
	try {
		return new MappingListener({
			selector: ".collection-nav",
			desktopWrapper: ".desktop-collection-nav",
			desktopMethod: "prependTo",
			mobileWrapper: ".mobile-collection-nav",
			mobileMethod: "prependTo",
			breakpoint: 992
		}).watch()
	} catch (error) {

	}
}


const collectionNavToggle = () => {
	$('.mobile-collection-nav .mobile-toggle-button').on('click', function () {
		$('.mobile-collection-nav').toggleClass('active');
	})
	$('.mobile-collection-nav .mobile-collection-nav-backdrop').on('click', function () {
		$('.mobile-collection-nav').removeClass('active');
	})
}

const filterNavMapping = () => {
	try {
		return new MappingListener({
			selector: ".filter-nav",
			desktopWrapper: ".desktop-filter-nav",
			desktopMethod: "prependTo",
			mobileWrapper: ".mobile-filter-nav",
			mobileMethod: "prependTo",
			breakpoint: 992
		}).watch()
	} catch (error) {

	}
}


const filterNavToggle = () => {
	$('.mobile-filter-nav .mobile-toggle-button').on('click', function () {
		$('.mobile-filter-nav').toggleClass('active');
	})
	$('.mobile-filter-nav .mobile-filter-nav-backdrop').on('click', function () {
		$('.mobile-filter-nav').removeClass('active');
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

	const cart_expand_mapping = new MappingListener({
		selector: ".cart-expand",
		mobileWrapper: ".side-cart-nav",
		desktopWrapper: ".cart-wrapper",
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

	

	$('.mobile-cart').on('click', function() {
		$('.side-cart-nav').toggleClass('active')
	})
	$('.side-cart-nav .cart-close-button').on('click', function() {
		$('.side-cart-nav').removeClass('active')
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