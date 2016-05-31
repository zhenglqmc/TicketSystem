var movieId;
$(document).ready(function() {
	movieId = (window.location.search).split('=')[1];
	$('#bookTicket').attr('href', 'selectCinema?movieId='+movieId);
	
	requestInformation();
	requestDescription();
	// decodeInfoData("images/1.jpg;name;nameA,nameB;nameB,nameA;动作,爱情");
	// decodeDescData("标题1@内容1|标题2@内容2");
})

function requestInformation() {
	$.ajax({
		type: 'GET',
		url: '/MovieBooking/getMovieSummary',
		data: "movieId=" + movieId,
		success: function(data) {
			decodeInfoData(data);
		},
		error: function(request) {
			alert('require information fail');
		},
		dataType: "text"
	});
}

function requestDescription() {
	$.ajax({
		type: 'GET',
		url: '/MovieBooking/getMovieDscription',
		data: "movieId=" + movieId,
		success: function(data) {
			decodeDescData(data);
		},
		error: function(request) {
			alert('require information fail');
		},
		dataType: "text"
	});
}

function decodeInfoData(data) {
	var array = data.split(';');
	var url = array[0];
	var name = array[1];
	var director = array[2].split(',');
	var actor = array[3].split(',');
	var type = array[4].split(',');
	insertInformation(url, name, director, actor, type);
}

function decodeDescData(data) {
	var array = data.split('|');
	for (var i = 0; i < array.length; ++i) {
		var list = array[i].split('@');
		var title = list[0];
		var desc = list[1];
		insertDescription(title, desc);
	}
}

// url: picture.jpg
// movie: name
// director: [nameA, nameB, ...]
// actor: [nameA, nameB, ...]
// type: [action, adventure, love, ...]
function insertInformation(url, movie, director, actor, type) {
	$('#movie-img').attr('src', url);
	$('#movie-name').html(movie);
	for (var i = 0; i < director.length; ++i) {
		var div1 = $('<div></div>').addClass('item');
		var div2 = $('<div></div>').addClass('content').html(director[i]);
		div1.append(div2);
		$('#director-list').append(div1);
	}
	for (var i = 0; i < actor.length; ++i) {
		var div1 = $('<div></div>').addClass('item');
		var div2 = $('<div></div>').addClass('content').html(actor[i]);
		div1.append(div2);
		$('#actor-list').append(div1);
	}
	for (var i = 0; i < type.length; ++i) {
		var div1 = $('<div></div>').addClass('ui blue inverted label');
		var div2 = $('<div></div>').addClass('content').html(type[i]);
		div1.append(div2);
		$('#type-list').append(div1);
	}
}

// title: background
// description: long long ago ...
function insertDescription(title, description) {
	var div = $('<div></div>').addClass('content');
	var h = $('<h4></h4>').addClass('ui header').html(title);
	var p = $('<p></p>').html(description);
	div.append(h);
	div.append(p);
	$('#description').append(div);
}