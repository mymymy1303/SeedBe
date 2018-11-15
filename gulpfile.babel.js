import del from 'del';
import gulp from 'gulp';
import pug from 'gulp-pug';
import sass from 'gulp-sass';
import babel from 'gulp-babel';
import concat from 'gulp-concat';
import rename from 'gulp-rename';
import uglify from 'gulp-uglify-es';
import imagemin from 'gulp-imagemin';
import cleanCSS from 'gulp-clean-css';
import prefix from 'gulp-autoprefixer';
import sourcemap from 'gulp-sourcemaps';
import browserSync from 'browser-sync';
import {
	readFileSync
} from 'fs';




const paths = {
	dist: 'dist',
	fonts: {
		src: 'fonts/**/**',
		dest: 'dist/fonts/'
	},
	webfonts: {
		src: 'webfonts/**/**',
		dest: 'dist/webfonts/'
	},
	images: {
		src: 'img/**/**.{jpg,svg,jpeg,png}',
		dest: 'dist/img/'
	},
	scripts: {
		src: 'scripts/main.js',
		allSrc: 'scripts/**/*.js',
		dest: 'dist/scripts/',
	},
	styles: {
		src: 'lib/main.sass',
		allSrc: 'lib/**/*.sass',
		dest: 'dist/styles/',
	},
	templates: {
		src: 'templates/*.pug',
		allSrc: 'lib/**/*.pug',
		dest: 'dist/'
	}
}

// Remove Folder Dist
const clean = () => del([paths.dist])
export {
	clean
}

const cleanImg = () => del([paths.dist + '/img'])
export {
	cleanImg
}
// Copy Images from Source to Dist
export function copyImages() {
	return gulp.src(paths.images.src)
		// .pipe(imagemin({
		// 	interlaced: true,
		// 	progressive: true,
		// 	optimizationLevel: 5,
		// }))
		.pipe(gulp.dest(paths.images.dest))
}

// Copy Fonts from Source to Dist
export function copyFonts1() {
	return gulp.src(paths.fonts.src)
		.pipe(gulp.dest(paths.fonts.dest))
}

// Copy Webfonts from Source to Dist
export function copyFonts2() {
	return gulp.src(paths.webfonts.src)
		.pipe(gulp.dest(paths.webfonts.dest))
}

export function copyFonts3() {
	return gulp.src(paths.fonts.src)
		.pipe(gulp.dest(paths.styles.dest+ '/fonts'))
}

export function concatCss() {
	let plugins = JSON.parse(readFileSync('./plugins.json'));
	return gulp.src(plugins.styles)
		.pipe(concat('core.min.css'))
		.pipe(cleanCSS())
		.pipe(gulp.dest(paths.styles.dest))
}

export function concatJs() {
	let plugins = JSON.parse(readFileSync('./plugins.json'));
	return gulp.src(plugins.scripts)
		.pipe(concat('core.min.js'))
		.pipe(uglify())
		.pipe(gulp.dest(paths.scripts.dest))
}

export function pugProcess() {
	return gulp.src(paths.templates.src)
		.pipe(pug())
		.pipe(gulp.dest(paths.templates.dest))
		.pipe(browserSync.stream({
			match: "/dist"
		}));
}

export function sassProcess() {
	return gulp.src(paths.styles.src)
		.pipe(sourcemap.init())
		.pipe(sass().on('error', sass.logError))
		.pipe(prefix({
			browsers: ['last 4 versions'],
			cascade: false
		}))
		.pipe(cleanCSS())
		.pipe(rename({
			suffix: '.min'
		}))
		.pipe(sourcemap.write('.'))
		.pipe(gulp.dest(paths.styles.dest))
}

export function jsProcess() {
	return gulp.src(paths.scripts.src)
		.pipe(sourcemap.init())
		.pipe(babel())
		.pipe(uglify())
		.pipe(rename({
			suffix: '.min',
		}))
		.pipe(sourcemap.write('.'))
		.pipe(gulp.dest(paths.scripts.dest))
}

function watchDist() {
	browserSync.init({
		server: {
			baseDir: paths.dist
		},
		port: 9999,
	})
	gulp.watch('plugins.json', gulp.series(concatCss, concatJs))
	gulp.watch('plugins/**/**.*', gulp.series(concatCss, concatJs))
	gulp.watch(paths.images.src, gulp.series(cleanImg, copyImages))
	gulp.watch(paths.styles.allSrc, sassProcess)
	gulp.watch(paths.scripts.allSrc, jsProcess)
	gulp.watch('templates/**/*.pug', pugProcess)
	gulp.watch(paths.templates.allSrc, pugProcess)
	gulp.watch(paths.templates.src, pugProcess)
	gulp.watch(paths.dist).on('change', browserSync.reload)
}

const build = gulp.series(
	clean,
	copyImages,
	copyFonts1,
	copyFonts2,
	copyFonts3,
	concatCss,
	concatJs,
	jsProcess,
	sassProcess,
	pugProcess,
	watchDist)
export {
	build
}


export default build