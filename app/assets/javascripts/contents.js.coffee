# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('video').mediaelementplayer({
    videoWidth: 460,
    videoHeight: 270,
    audioWidth: 400,
    audioHeight: 30,
    startVolume: 0.8,
    loop: false,
    enableAutosize: true,
    features: ['playpause','progress','current','duration','tracks','volume','fullscreen'],
    alwaysShowControls: false,
    iPadUseNativeControls: false,
    iPhoneUseNativeControls: false,
    AndroidUseNativeControls: false,
    alwaysShowHours: false,
    showTimecodeFrameCount: false,
    framesPerSecond: 25,
    enableKeyboard: true,
    pauseOtherPlayers: true,
    keyActions: []
});
