// This function checks if the username field
// is at least 6 characters long.
// If so, it attaches class="welldone" to the
// containing fieldset.

function checkUsernameForLength(whatYouTyped) {
	var fieldset = whatYouTyped.parentNode;
	var txt = whatYouTyped.value;
	if (txt.length > 5) {
		fieldset.className = "welldone";
	}
	else {
		fieldset.className = "kindagood";
	}
}

// If the password is at least 4 characters long, the containing
// fieldset is assigned class="kindagood".
// If it's at least 8 characters long, the containing
// fieldset is assigned class="welldone", to give the user
// the indication that they've selected a harder-to-crack
// password.

function checkPassword(whatYouTyped) {
	var fieldset = whatYouTyped.parentNode;
	var txt = whatYouTyped.value;
	if (txt.length < 7) {
		fieldset.className = "kindagood";
	} else if (txt.length >= 7) {
		fieldset.className = "welldone";
	} else {
		fieldset.className = "";
	}
}
// This function checks the email address to be sure
// it follows a certain pattern:
// blah@blah.blah
// If so, it assigns class="welldone" to the containing
// fieldset.

function checkEmail(whatYouTyped) {
	var fieldset = whatYouTyped.parentNode;
	var txt = whatYouTyped.value;
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(txt)) {
		fieldset.className = "welldone";
	} else {
		fieldset.className = "kindagood";
	}
}

// this part is for the form field hints to display
// only on the condition that the text input has focus.
// otherwise, it stays hidden.

function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      oldonload();
      func();
    }
  }
}
function prepareInputsForHints() {
  var inputs = document.getElementsByTagName("input");
  for (var i=0; i<inputs.length; i++){
    inputs[i].onfocus = function () {
      this.parentNode.getElementsByTagName("span")[0].style.display = "inline";
    }
    inputs[i].onblur = function () {
      this.parentNode.getElementsByTagName("span")[0].style.display = "none";
    }
  }
}
addLoadEvent(prepareInputsForHints);

