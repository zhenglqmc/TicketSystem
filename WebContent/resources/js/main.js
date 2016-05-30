jQuery(document).ready(function($){
	var formModal = $('.cd-user-modal'),
		formLogin = formModal.find('#cd-login'),
		formSignup = formModal.find('#cd-signup'),
		formForgotPassword = formModal.find('#cd-reset-password'),
		formModalTab = $('.cd-switcher'),
		tabLogin = formModalTab.children('li').eq(0).children('a'),
		tabSignup = formModalTab.children('li').eq(1).children('a'),
		forgotPasswordLink = formLogin.find('.cd-form-bottom-message a'),
		backToLoginLink = formForgotPassword.find('.cd-form-bottom-message a'),
		mainNav = $('.main-nav'),
		userBanner = $('.user-banner'),
		usernameText = $('.cd-username'),
		nameNav = $('.name-nav');

	
	if ($.cookie('uid')!= null) {
		has_login();
		
		$.ajax({
                type: "POST",
                url:"/MovieBooking/getUserName",
                data:"userId=" + $.cookie('uid'),
                async: false,
                error: function(request) {
                   // alert("Connection Error");
                },
                success: function(data) {
                    usernameText.text(data);
                },
                dataType: "text"
            });

	}

	

	nameNav.on('click', '.cd-logout', logout_selected);
	
	//open modal
	mainNav.on('click', function(event){
		$(event.target).is(mainNav) && mainNav.children('ul').toggleClass('is-visible');
	});

	//open sign-up form
	mainNav.on('click', '.cd-signup', signup_selected);
	//open login-form form
	mainNav.on('click', '.cd-signin', login_selected);

	//close modal
	formModal.on('click', function(event){
		if( $(event.target).is(formModal) || $(event.target).is('.cd-close-form') ) {
			formModal.removeClass('is-visible');
		}	
	});
	//close modal when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		formModal.removeClass('is-visible');
	    }
    });

	//switch from a tab to another
	formModalTab.on('click', function(event) {
		event.preventDefault();
		( $(event.target).is( tabLogin ) ) ? login_selected() : signup_selected();
	});

	// //hide or show password
	// $('.hide-password').on('click', function(){
	// 	var togglePass= $(this),
	// 		passwordField = togglePass.prev('input');
		
	// 	( 'password' == passwordField.attr('type') ) ? passwordField.attr('type', 'text') : passwordField.attr('type', 'password');
	// 	( 'Hide' == togglePass.text() ) ? togglePass.text('Show') : togglePass.text('Hide');
	// 	//focus and move cursor to the end of input field
	// 	passwordField.putCursorAtEnd();
	// });

	//show forgot-password form 
	forgotPasswordLink.on('click', function(event){
		event.preventDefault();
		forgot_password_selected();
	});

	//back to login from the forgot-password form
	backToLoginLink.on('click', function(event){
		event.preventDefault();
		login_selected();
	});

	function login_selected(){
		mainNav.children('ul').removeClass('is-visible');
		formModal.addClass('is-visible');
		formLogin.addClass('is-selected');
		formSignup.removeClass('is-selected');
		formForgotPassword.removeClass('is-selected');
		tabLogin.addClass('selected');
		tabSignup.removeClass('selected');
	}

	function signup_selected(){
		mainNav.children('ul').removeClass('is-visible');
		formModal.addClass('is-visible');
		formLogin.removeClass('is-selected');
		formSignup.addClass('is-selected');
		formForgotPassword.removeClass('is-selected');
		tabLogin.removeClass('selected');
		tabSignup.addClass('selected');
	}

	function forgot_password_selected(){
		formLogin.removeClass('is-selected');
		formSignup.removeClass('is-selected');
		formForgotPassword.addClass('is-selected');
	}

	function has_login(){
		nameNav.addClass('is-visible');
		mainNav.addClass('is-not-visible');
	}

	function logout_selected() {
		//clear cookie
		//$.cookie("uid", null);
		
		$.ajax({
            type: "POST",
            url:"/MovieBooking/logout",
            data:1,
            async: false,
            error: function(request) {
                alert("Connection Error");
            },
            success: function(data) {
            	nameNav.removeClass('is-visible');
        		mainNav.removeClass('is-not-visible');
            },
            dataType: "text"
        });
		
		
		
		
	}

	//REMOVE THIS - it's just to show error messages 
	formLogin.find('input[type="submit"]').on('click', function(event){
		event.preventDefault();
		$.ajax({
                type: "POST",
                url:"/MovieBooking/checkLogin",
                data:"username=" + formLogin.find('input[type="text"]').val() 
                + "&password=" + formLogin.find('input[type="password"]').val(),
                async: false,
                error: function(request) {
                    alert("Connection Error");
                },
                success: function(data) {
                    if (data == "1") {
                    	nameNav.addClass('is-visible');
						mainNav.addClass('is-not-visible');
                    	formModal.removeClass('is-visible');
                    	usernameText.text(formLogin.find('input[type="text"]').val());
                    }else{
                    	formLogin.find('input[type="password"]').toggleClass('has-error').next('span').toggleClass('is-visible');
                    }
                }
            });
	});
	formSignup.find('input[type="submit"]').on('click', function(event){
		event.preventDefault();
		$.ajax({
                type: "POST",
                url:"/MovieBooking/register",
                data:"username=" + formSignup.find('input[type="text"]').val() 
                + "&password=" + formSignup.find('input[type="password"]').val(),
                async: false,
                error: function(request) {
                    alert("Connection Error");
                },
                success: function(data) {
                    if (data == "1") {

                    	nameNav.addClass('is-visible');
						mainNav.addClass('is-not-visible');
                    	formModal.removeClass('is-visible');
          
                    	usernameText.text(formSignup.find('input[type="text"]').val());
                    }else{
                    	formSignup.find('input[type="text"]').toggleClass('has-error').next('span').toggleClass('is-visible');
                    }
                }
            });
		
	});


	//IE9 placeholder fallback
	//credits http://www.hagenburger.net/BLOG/HTML5-Input-Placeholder-Fix-With-jQuery.html
	// if(!Modernizr.input.placeholder){
	// 	$('[placeholder]').focus(function() {
	// 		var input = $(this);
	// 		if (input.val() == input.attr('placeholder')) {
	// 			input.val('');
	// 	  	}
	// 	}).blur(function() {
	// 	 	var input = $(this);
	// 	  	if (input.val() == '' || input.val() == input.attr('placeholder')) {
	// 			input.val(HTML5-Input-Placeholder-Fix-With-jQueryt.attr('placeholder'));
	// 	  	}
	// 	}).blur();
	// 	$('[placeholder]').parents('form').submit(function() {
	// 	  	$(this).find('[placeholder]').each(function() {
	// 			var input = $(this);
	// 			if (input.val() == input.attr('placeholder')) {
	// 		 		input.val('');
	// 			}
	// 	  	})
	// 	});
	// }

});


//credits http://css-tricks.com/snippets/jquery/move-cursor-to-end-of-textarea-or-input/
jQuery.fn.putCursorAtEnd = function() {
	return this.each(function() {
    	// If this function exists...
    	if (this.setSelectionRange) {
      		// ... then use it (Doesn't work in IE)
      		// Double the length because Opera is inconsistent about whether a carriage return is one character or two. Sigh.
      		var len = $(this).val().length * 2;
      		this.focus();
      		this.setSelectionRange(len, len);
    	} else {
    		// ... otherwise replace the contents with itself
    		// (Doesn't work in Google Chrome)
      		$(this).val($(this).val());
    	}
	});
};

jQuery.cookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options = $.extend({}, options); // clone object since it's unexpected behavior if the expired property were changed
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        // NOTE Needed to parenthesize options.path and options.domain
        // in the following expressions, otherwise they evaluate to undefined
        // in the packed version for some reason...
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};