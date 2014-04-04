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
  var elementIndex;
  switch(e.keyCode) {
    case key.tab: {
      if(tab==null) {
        tab=1;
       $("dl").first.first.focus();
      }
      break;
    }
    case key.right: {
      if(activeElement.next.length != 0) {
        activeElement.next().focus();
      }
break;
    }
    case key.left: {
      if(activeElement.prev.length != 0) {
        activeElement.prev().focus();
      }
      break;
    }
    case key.up: {
      pElement = activeElement.parent().prev();
      if(pElement != "") {
        pElement.children().eq(activeElement.index()).focus();
      }
      break;
    }
    case key.down: {
      nElement = activeElement.parent().next();
      if(nElement != "") {
        nElement.children().eq(activeElement.index()).focus();
      }
      break;
    }
  } //End switch
}

$(document).ready(function() {
  $(".application").bind("keyup", function(e) {
    navigateGrid(e);
});// End bind handler
});

