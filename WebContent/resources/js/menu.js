var thisYear;
var thisMouth;
var thisDay;
var thisCity;
var thisMovie;
window.onload = function() {
	thisCity = "广州";
	initDay();
	thisMovie = 1;
	getArea(thisCity);
	$("#menu_day").delegate("a", "click", function() {
	var current_day = $("#menu_day .active");
		current_day.removeClass("active");
		$(this).addClass("active");
		thisMouth = $(this).attr("mouth");
		thisDay = $(this).attr("day");
		getSession($("#menu_cinema .active").attr("cinemaNum"), thisMovie, thisYear+"-"+thisMouth+"-"+thisDay);
	});

	$("#menu_zone").delegate("a", "click", function() {
		var current_zone = $("#menu_zone .active");
		current_zone.removeClass("active");
		$(this).addClass("active");

		getCinema(thisCity, $(this).text(), thisMovie);
		getSession($("#menu_cinema .active").attr("cinemaNum"), thisMovie, thisYear+"-"+thisMouth+"-"+thisDay);
		
	});

	$("#menu_cinema").delegate("a", "click", function() {
		var current_cinema = $("#menu_cinema .active");
		current_cinema.removeClass("active");
		$(this).addClass("active");
		getSession($("#menu_cinema .active").attr("cinemaNum"), thisMovie, thisYear+"-"+thisMouth+"-"+thisDay);
	});
$("#inputTest").change(function() {
	console.log($(this).text());
});
}

function getDate(AddDayCount) { 
	var dd = new Date(); 
	dd.setDate(dd.getDate()+AddDayCount);
	return dd;
} 

function initDay() {
	var day1 = getDate(0);
	var day2 = getDate(1);
	var day3 = getDate(2);
	var day4 = getDate(3);
	$("#menu_day .item").remove();
	$("#menu_day").append("<a class=\"item\" year = \"" + day1.getFullYear() + "\" mouth=\"" + (day1.getMonth() + 1) + "\" day=\"" + day1.getDate() + "\">今天(" + (day1.getMonth() + 1) + "月" + day1.getDate() + "日)</a>");
	$("#menu_day").append("<a class=\"item\" year = \"" + day2.getFullYear() + "\" mouth=\"" + (day2.getMonth() + 1) + "\" day=\"" + day2.getDate() + "\">明天(" + (day2.getMonth() + 1) + "月" + day2.getDate() + "日)</a>");
	$("#menu_day").append("<a class=\"item\" year = \"" + day3.getFullYear() + "\" mouth=\"" + (day3.getMonth() + 1) + "\" day=\"" + day3.getDate() + "\">后天(" + (day3.getMonth() + 1) + "月" + day3.getDate() + "日)</a>");
	$("#menu_day").append("<a class=\"item\" year = \"" + day4.getFullYear() + "\" mouth=\"" + (day4.getMonth() + 1) + "\" day=\"" + day4.getDate() + "\">大后天(" + (day4.getMonth() + 1) + "月" + day4.getDate() + "日)</a>");
	$("#menu_day .item").eq(0).addClass("active");
	thisYear = day1.getFullYear();
	thisMouth = day1.getMonth() + 1;
	thisDay = day1.getDate();
}

function getArea(cityName) {
	$.ajax({
		type: "GET",
  		url: "/MovieBooking/getArea",
  		data: "city=" + cityName,
  		async: true,
 		error: function(textStatus, errorThrown) {
 			alert("系统ajax交互错误: " + textStatus);
 		},
  		success: function(data) {
					menuArea(data)
				},
		dataType: "text"
	});
}

function getCinema(cityName, zoneName, movie) {
	$.ajax({
		type: "GET",
	  	url:  "/MovieBooking/getCinema",
	  	data: "city=" + cityName + "&zone=" + zoneName + "&movieId=" + movie,
	  	async: true,
 		error: function(textStatus, errorThrown) {
 			alert("系统ajax交互错误: " + textStatus);
 			},
  		success: function(data) {
  					menuCinema(data)
  				},
		dataType: "text"
	});
}


function getSession(cinemaNum, movie, whichDay) {
	$.ajax({
		type: "GET",
	  	url:  "/MovieBooking/getSession",
	  	data: "cinemaId=" +  cinemaNum + "&movieId=" + movie + "&time=" + whichDay,
	  	async: true,
 		error: function(textStatus, errorThrown) {
 			alert("系统ajax交互错误: " + textStatus);
 			},
  		success: function(data) {
  			tableSession(data)
  			},
		dataType: "text"
  		});
  	}

//get area
function menuArea(data) {
	var zones = data.split(";");
	var zoneNum = zones.length;
	$("#menu_zone .item").remove();
	$("#menu_zone").append("<a class=\"active item\" zoneNum=\"0\">" + zones[0] +"</a>");
	for (var i = 1; i < zoneNum; i++) {
		$("#menu_zone").append("<a class=\"item\" zoneNum=\"" + i + "\">" + zones[i] +"</a>");
	}
	getCinema(thisCity, $("#menu_zone .active").text(), thisMovie);
	
}

//get cinema
function menuCinema(data) {
	var cinemas = data.split(";");
	var len = cinemas.length;
	$("#menu_cinema .item").remove();
	for (var l = 0; l < len; l++) {
		var number = cinemas[l].split("|")[0];
		var name = cinemas[l].split("|")[1];
		$("#menu_cinema").append("<a class=\"item " + i + "\" cinemaNum=\"" + number +"\">" + name +"</a>");
	}
	$("#menu_cinema .item").eq(0).addClass("active");
	getSession($("#menu_cinema .active").attr("cinemaNum"), thisMovie, thisYear+"-"+thisMouth+"-"+thisDay);

}

//get sessions
function tableSession(data) {
	var sessions = data.split(";");
	var len = sessions.length;
	$("tbody").children().remove();
	for (var i = 0; i < len; i++) {
		addOneSession(sessions[i]);
	}
}

function addOneSession(data) {
	var tmpdata = data.split("|");
	var startTime = tmpdata[0];
	var endTime = tmpdata[1];
	var language = tmpdata[2];
	var room = tmpdata[3];
	var price = tmpdata[4];
	var number = tmpdata[5];
	var input = "<tr><td><h2 class=\"ui center aligned header\">" + startTime
	+ "</h2></td><td class=\"single line center aligned\">" + endTime
	+ "</td><td class=\"single line center aligned\">" + language
	+ "</td><td class=\"single line center aligned\">" + room
	+ "</td><td class=\"single line center aligned\">" + price
	+ "</td><td class=\"single line center aligned\"><div class=\"ui button\" href=\"" + number
	+ "\"> 选座购票</div></td></tr>";
	$("tbody").append(input);
}