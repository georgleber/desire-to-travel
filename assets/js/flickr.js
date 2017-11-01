$(function() {
	$(document).ready(function() {
		(function() {
			var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
			templates['todo'] = template({"1":function(container,depth0,helpers,partials,data) {
			var helper, alias1=depth0 != null ? depth0 : (container.nullContext || {}), alias2=helpers.helperMissing, alias3="function", alias4=container.escapeExpression;

			return "		<li tabindex=\""
				+ alias4(((helper = (helper = helpers.index || (data && data.index)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"index","hash":{},"data":data}) : helper)))
				+ "\">"
				+ alias4(((helper = (helper = helpers.thumbnail || (depth0 != null ? depth0.thumbnail : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"thumbnail","hash":{},"data":data}) : helper)))
				+ "</li>\r\n";
			},"compiler":[7,">= 4.0.0"],"main":function(container,depth0,helpers,partials,data) {

			var stack1, helper, alias1=container.lambda, alias2=container.escapeExpression, alias3=depth0 != null ? depth0 : (container.nullContext || {});

			return "<div class=\"gh-gallery\">\r\n	<div class=\"gh-gallery-preview\">\r\n		<a data-featherlight=\"image\" href=\""
				+ alias2(alias1(((stack1 = (depth0 != null ? depth0.firstPhoto : depth0)) != null ? "https://farm" + stack1.farm + ".staticflickr.com/" + stack1.server + "/" + stack1.id + "_" + stack1.secret + "_b.jpg" : stack1), depth0))
				+ "\"><img src=\""
				+ alias2(alias1(((stack1 = (depth0 != null ? depth0.firstPhoto : depth0)) != null ? stack1.url_m : stack1), depth0))
				+ "\" alt=\""
				+ alias2(alias1(((stack1 = (depth0 != null ? depth0.firstPhoto : depth0)) != null ? stack1.title : stack1), depth0))
				+ "\"/></a>\r\n	</div>\r\n	<ul class=\"gh-gallery-thumbs\">\r\n"
				+ ((stack1 = helpers.each.call(alias3,(depth0 != null ? depth0.photos : depth0),{"name":"each","hash":{},"fn":container.program(1, data, 0),"inverse":container.noop,"data":data})) != null ? stack1 : "")
				+ "	</ul>\r\n </div>\r\n <div class=\"gh-gallery-title\">\r\n		"
				+ alias2(((helper = (helper = helpers.title || (depth0 != null ? depth0.title : depth0)) != null ? helper : helpers.helperMissing),(typeof helper === "function" ? helper.call(alias3,{"name":"title","hash":{},"data":data}) : helper)))
				+ "\r\n	</div>";
			},"useData":true});
		})();

		Handlebars.registerHelper('thumbnail', function() {
			var src = Handlebars.escapeExpression(this.url_sq);
			var title = Handlebars.escapeExpression(this.title);
			var srcM = Handlebars.escapeExpression(this.url_m);
			var id = Handlebars.escapeExpression(this.id);
			var secret = Handlebars.escapeExpression(this.secret);
			var server = Handlebars.escapeExpression(this.server);
			var farm = Handlebars.escapeExpression(this.farm);
			var srcB = "https://farm" + farm + ".staticflickr.com/" + server + "/" + id + "_" + secret + "_b.jpg";

			return new Handlebars.SafeString(
				"<img src='" + src + "' class='img-responsive' alt='" + title + "' title='" + title + "' data-srcm='" + srcM + "' data-srcb='" + srcB + "'/>"
			);
		});

		$('gallery').each(function(idx, gallery) {
			var photosetId = $(this).data('photoset');

			$.ajax({
				url: "https://api.flickr.com/services/rest/?method=flickr.photosets.getPhotos&api_key=${config.site_flickr_apikey}&photoset_id=" + photosetId + "&user_id=${config.site_flickr_userid}&extras=url_sq%2C+url_m%2C+url_o&format=json&nojsoncallback=1",
			}).done(function(result) {
				var template = Handlebars.templates.todo;
				var firstPhoto = result.photoset.photo && result.photoset.photo.length > 0 ? result.photoset.photo[0] : null;
				var photos = result.photoset.photo && result.photoset.photo.length > 1 ? result.photoset.photo : [];

				$(gallery).html(template({title: result.photoset.title, firstPhoto: firstPhoto, photos: photos}));
				$($('.gh-gallery-thumbs li img')[0]).addClass('active');
			});
		});

		$(document).on('click', '.gh-gallery-thumbs li img', function() {
			$(this).parent().siblings().find('img.active').removeClass('active');
			$(this).addClass('active');

			var srcM = $(this).data('srcm');
			var srcB = $(this).data('srcb');
			var preview = $(this).parent().parent().siblings('.gh-gallery-preview');
			preview.find('img').attr('src', srcM);
			preview.find('a').attr('href', srcB);
		});
	});
});
