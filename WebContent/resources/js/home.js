$(document).ready(function() {
	requestPoster();
	requestHotMovie();
	requestComingMovie();
});

function requestPoster() {
	$.ajax({
		type: 'GET',
		url: '/MovieBooking/getPoster',
		success: function(data) {
			decodePosterData(data);
		},
		error: function(request) {
			alert('require poster fail');
		},
		dataType: "text"
	});
}

function requestHotMovie() {
	$.ajax({
		type: 'GET',
		url: '/MovieBooking/getCurrentMovie',
		success: function(data) {
			decodeHotMovieData(data);
		},
		error: function(request) {
			alert('require hot movie fail');
		},
		dataType: "text"
	});
}

function requestComingMovie() {
	$.ajax({
		type: 'GET',
		url: '/MovieBooking/getLaterMovie',
		success: function(data) {
			decodeComingMovieData(data);
		},
		error: function(request) {
			alert('require coming movie fail');
		},
		dataType: "text"
	});
}

function decodePosterData(data) {
	var arr = data.split(';');
	for (var i = 0; i < arr.length; ++i) {
		insertPoster(arr[i]);
	}
}

function decodeHotMovieData(data) {
	var arr = data.split(';');
	for (var i = 0; i < arr.length; ++i) {
		var src = arr[i].split(',');
		insertHotMovie(src[0], src[1], src[2]);
	}
}

function decodeComingMovieData(data) {
	var arr = data.split(';');
	for (var i = 0; i < arr.length; ++i) {
		var src = arr[i].split(',');
		insertComingMovie(src[0], src[1], src[2]);
	}
}

function insertPoster(url) {
	var father = $('.poster-banner > .poster > .shape > .sides');
	var div = $('<div></div>');
	if (father.html().length == 5) {
		div.addClass('active side');
	} else {
		div.addClass('side');
	}
	var img = $('<img>').addClass('image').attr('src', url);

	father.append(div);
	div.append(img);

	$('.shape').shape();
	$('.left.button').click(function() {
		$('.shape').shape('flip left');
	});
	$('.right.button').click(function() {
		$('.shape').shape('flip right');
	});
}

function insertMovie(obj, id, url, name) {
	var div1 = $('<div></div>').addClass('four wide column');
	var div2 = $('<div></div>').addClass('movie');
	var a = $('<a></a>').attr('href', 'introduction?movieId='+id);
	var img = $('<img>').addClass('movie-image').attr('src', url);
	var p = $('<p></p>').addClass('movie-name').text(name);

	obj.append(div1);
	div1.append(div2);
	div2.append(a).append(p);
	a.append(img);
}

function insertHotMovie(id, url, name) {
	var father = $('.hot-list > .container > .grid');
	insertMovie(father, id, url, name);
}

function insertComingMovie(id, url, name) {
	var father = $('.upcoming-list > .container > .grid');
	insertMovie(father, id, url, name);
}
