// Common Javascript code for book reviews/rating
$(document).ready(function() {
	formatRatingNumber();
});
	
$(".book-detail-rating-star").rating({
	displayOnly: true,
	hoverOnClera: false,
	showCaption: false,
	theme: 'krajee-svg'
});

function formatRatingNumber() {
	ratingText = $("#ratingNumber").text();
	formattedRating = $.number(ratingText, 2, decimalSeparator, thousandSeparator);
	$("#ratingNumber").text(formattedRating);
}