function keyCodes () {
  // Define values for keycodes
  this.backspace  = 8;
  this.tab        = 9;
  this.enter      = 13;
  this.esc        = 27;

  this.space      = 32;
  this.pageup     = 33;
  this.pagedown   = 34;
  this.end        = 35;
  this.home       = 36;

  this.left       = 37;
  this.up         = 38;
  this.right      = 39;
  this.down       = 40;

  this.insert     = 45;
  this.del        = 46;

  this.f2         = 113;
}

function navigateGrid(e) {
  var tab;
  var key = new keyCodes();
  var activeElement = $(":focus");

  switch(e.keyCode) {
    case key.tab: {
      if(tab==null) {
        tab=1;
       $("dl:first").focus();
      }
      break;
    }
    case key.right: {
      if(activeElement.parent().next.length != 0) {
        activeElement.parent().next().children().focus();
      }
break;
    }
    case key.left: {
      if(activeElement.parent().prev.length != 0) {
        activeElement.parent().prev().children().focus();
      }
      break;
    }
    case key.up: {
      pElement = activeElement.parent().parent().prev();
      if(pElement != "") {
        pElement.children().eq(activeElement.parent().index()).children().focus();
      }
      break;
    }
    case key.down: {
      nElement = activeElement.parent().parent().next();
      console.log(activeElement)
      if(nElement != "") {
        nElement.children().eq(activeElement.parent().index()).children().focus();
      }
      break;
    }
  } //End switch
}

$(document).ready(function() {
  $(".application").on("keyup", function(e) {
    navigateGrid(e);
  });// End bind handler
});

