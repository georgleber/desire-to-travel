$(document).ready(function() {
	Handlebars.registerHelper('thumbnail', function() {
		var src = Handlebars.escapeExpression(this.url_sq);
		var title = Handlebars.escapeExpression(this.title);
		var srcM = Handlebars.escapeExpression(this.url_m);

		return new Handlebars.SafeString(
			"<img src='" + src + "' class='img-responsive' alt='" + title + "' title='" + title + "' data-srcm='" + srcM + "'/>"
		);
	});

	$('gallery').each(function(idx, gallery) {
		var photosetId = $(this).data('photoset');
		var apiKey = $(this).data('apikey');
		var userId = $(this).data('userid');

		$.ajax({
			url: "https://api.flickr.com/services/rest/?method=flickr.photosets.getPhotos&api_key=" + apiKey + "&photoset_id=" + photosetId + "&user_id=" + userId + "&extras=url_sq%2C+url_m&format=json&nojsoncallback=1",
		}).done(function(result) {
			var template = Handlebars.templates.todo;
			var firstPhoto = result.photoset.photo && result.photoset.photo.length > 0 ? result.photoset.photo[0] : null;
			var photos = result.photoset.photo && result.photoset.photo.length > 1 ? result.photoset.photo.slice(1) : [];
			$(gallery).html(template({title: result.photoset.title, firstPhoto: firstPhoto, photos: photos}));
		});
	});

	$(document).on('click', '.gh-gallery-thumbs li img', function() {
		var srcM = $(this).data('srcm');
		$('.gh-gallery-preview img').attr('src', srcM);
	});
});
