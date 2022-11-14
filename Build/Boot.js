const game = document.querySelector("#game");
const body = document.querySelector("body");
const gameFrame = document.querySelector("#game");
const cursor = document.querySelector("#cursor");
const uiFrame = document.querySelector("#uiFrame");

const Rect = new rect();
const AR = new ar();
const CursorInit = new cursorInit();
const AutotextInit = new autotextInit();
const AutotextBoot = new autotextBoot();
const Color = new color();
const Font = new font();
const Scene = new scene();
const FontsBoot = new fontsBoot();
const FontColorsInit = new fontColorsInit();
const touch = ('ontouchstart' in window) || (navigator.maxTouchPoints > 0) || (navigator.msMaxTouchPoints > 0);
const FlagsInit = new flagsInit();

var Flags = {};
var autotext_Temp = {};
var autotext = {};
var fonts = {};
var colors = {};
var Viewport = {
    uiSize: [0, 0, 1024, 768]
}

var env;
var bg;
var sc;

Flags.Night_FL = false;
Flags.Touch = touch;

if (Flags.Touch) {
    document.querySelector("body").classList.add("touch");
}

function autoResize() {
    let position = (window.innerHeight > window.innerWidth) ? "portrait" : "landscape";
    switch(position) {
        case "landscape":
            game.style.transform = "scale(" + (window.innerHeight - parseInt(getComputedStyle(document.documentElement).getPropertyValue("--sab"))) / 768 + ")";
            cursor.style.transform = "scale(" + (window.innerHeight - parseInt(getComputedStyle(document.documentElement).getPropertyValue("--sab"))) / 768 + ")";
            break;
        case "portrait":
            game.style.transform = "scale(" + window.innerWidth / 1024 + ")";
            cursor.style.transform = "scale(" + window.innerWidth / 1024 + ")";
            break;
    }   
}

function openFullscreen() {
    if (body.requestFullscreen) {
        body.requestFullscreen();
    } else if (body.webkitRequestFullscreen) { /* Safari */
        body.webkitRequestFullscreen();
    } else if (body.msRequestFullscreen) { /* IE11 */
        body.msRequestFullscreen();
    }
}

autoResize();
window.addEventListener("resize", function(event) {
    autoResize()
});

if(Flags.touch) {
    ScreenOrientation.addEventListener("change", function(event) {
        autoResize();
    });
}

document.addEventListener("keyup", function(event) {
    if (navigator.appVersion.indexOf('Mac') != -1 && (event.metaKey && event.key === "Enter")) {
        openFullscreen();
    } else if (event.altKey && event.key === "Enter") {
        openFullscreen();
    }
}, false);

document.addEventListener("mousemove", function(event) {
    let position = gameFrame.getBoundingClientRect();

    cursor.style.position = "absolute";
    cursor.style.left = event.pageX + "px";
    cursor.style.top = event.pageY + "px";
}, false);