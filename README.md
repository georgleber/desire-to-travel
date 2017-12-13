# Create a post

1. Create folder with the nmame of the current year (e.g. 2017) under **content/blog** if not exists.
2. Create a new file in that folder and give it a meaningful name (e.g. USA-Day-1.html).

## Contents of the new file:

The header contains some important information:
- title = Title of the post
- date = Date when the post was created/published in english format (e.g. 2017-07-24)
- type = post (fixed value for now)
- tags = Destination of the journey (used for categorizing of posts, e.g. USA for all posts belonging to USA journey)
- status = Status of post (can be published to show on page or draft, if it is not ready yet)
- author = Author of the post (use one of imke or georg)

Further information can be given:
- featuredimage = The main image used for the post (use absolute path or url)
- description = A very short description which is shown under the headline
- summary = A summary of the contents, shown on the overview pages

In order to include Google Maps and show up the routes a further information must be added in the head sections:
- locations = An array of location objects describing the route. One entry contains name, latitude and longitude of the location in json format (e.g. {"name":"San Francisco, Kalifornien, USA","lat":37.7749295,"lng":-122.4194155}).

Example of a complete entry which prints a route from San Francisco to Las Vegas:
```json
locations=[{"name":"San Francisco, Kalifornien, USA","lat":37.7749295,"lng":-122.4194155},{"name":"Las Vegas, Nevada, USA","lat":36.1699412,"lng":-115.1398296}]
```

The format of the post file is html, so you can use HTML markup to define the contents.

If you want to include a gallery backed by flickr you can do as follows:

```html
<gallery data-photoset="72157686774921486"></gallery>
```
The identifier given in the attribute data-photoset is the id of the desired flickr gallery. You can find it in the url, if you navigate to the desired album on flickr:
https://www.flickr.com/photos/georg-henkel/albums/72157686774921486
