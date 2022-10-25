const game = document.querySelector("#game");
const Rect = new rect();
const AR = new ar();
const CursorInit = new cursorInit();
const touch = (('ontouchstart' in window) || (navigator.maxTouchPoints > 0) || (navigator.msMaxTouchPoints > 0));

var Flags = {
    Night_FL: false,
    Touch: !touch
}

//ЗДЕСЬ ВСЁ ХОРОШО, ПРОСТО ВРЕМЕННО, ПОКА НЕТ РЕАЛИЗАЦИЮЮ СМЕНЫ СЦЕН
/*var splashSFX = AR.Sound({
    sounds: "VEN_Splash_SFX",
    channel: "Theme",
    volume: 0.6,
    loop: false,
    active: true
    //active: function(this)
    //  return partner2LogoANIM.done
    //end
});
var HER_Logo_ANIM = AR.Movie({
    movie: "HER_Logo_ANIM",
    z: 5,
    active: true,
    id: "HER_Logo_ANIM",
    OnEnd: function() {
        oneSecond.start();
    }
});
var oneSecond = AR.Timer({
    duration: 1,
    OnEnd: function() {
        document.querySelector("#nancyANIM").play();
    }
});
var nancyANIM = AR.Movie({
    movie: "ND_LOGO_ANIM",
    z: 5,
    active: false,
    id: "nancyANIM",
    OnEnd: function() {
        document.querySelector("#game").append(nancyDrewOVL);
    }
});
var nancyDrewOVL = AR.Overlay({
    ovl: "UI_MainMenuTitleND_OVL",
    source: [0, 0, 808, 366],
    onScreen: [108, 83, 916, 449],
    z: 4,
})*/