const game = document.querySelector("#game");
const body = document.querySelector("body");
const gameFrame = document.querySelector("#game");
const cursor = document.querySelector("#cursor");
const uiFrame = document.querySelector("#uiFrame");
const gameScene = document.querySelector("#scene");

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

var Brain = {};
var Flags = {};
var cachedEnvs = [];
var autotext_Temp = {};
var autotext = {};
var fonts = {};
var colors = {};
var Viewport = { uiSize: [0, 0, 1024, 768] };

var env;
var bg;
var sc;

Flags.Touch = touch;

if (Flags.Touch) {
    document.querySelector("body").classList.add("touch");
}

function autoResize() {
    let position = (window.innerHeight > window.innerWidth) ? "portrait" : "landscape";
    let transformValue;
    switch(position) {
        case "landscape":
            transformValue = "scale(" + (window.innerHeight - parseInt(getComputedStyle(document.documentElement).getPropertyValue("--sab"))) / 768 + ")";
            game.style.transform = transformValue;
            game.style.webkitTransform = transformValue;
            cursor.style.transform = transformValue;
            cursor.style.webkitTransform = transformValue;
            break;
        case "portrait":
            transformValue = "scale(" + window.innerWidth / 1024 + ")";
            game.style.transform = transformValue;
            game.style.webkitTransform = transformValue;
            cursor.style.transform = transformValue;
            cursor.style.webkitTransform = transformValue;
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

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}

function MakeVideoFader(object) {
    let action = {};

    let opacity = (object["fade"] == "out") ? 0 : 1;
    let time = object["duration"];
    let timeout = time * 1000;

    action.Restart = function() {
        gameScene.style.animationName = (opacity) ? "fadeIn" : "fadeOut";
        gameScene.style.animationDuration = time + "s";
        gameScene.style.animationDelay = (object["delay"]) ? object["delay"] + "s" : "0s";
        gameScene.style.opacity = opacity;
        gameScene.style.animationFillMode = "forwards";
        gameScene.style.pointerEvents = "none";
        if(typeof(object["OnDone"]) === "function") {
            window.setTimeout(object["OnDone"], timeout);
        }
    }

    return action;
}
  

autoResize();
window.addEventListener("resize", autoResize);

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