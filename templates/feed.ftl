<?xml version="1.0"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>Desire to Travel</title>
    <link>${config.site_host}</link>
    <atom:link href="${config.site_host}/${config.feed_file}" rel="self" type="application/rss+xml" />
    <description>Ein Reiseblog von Imke und Georg.</description>
    <language>de-DE</language>
    <pubDate>${published_date?string("EEE, d MMM yyyy HH:mm:ss Z")}</pubDate>
    <lastBuildDate>${published_date?string("EEE, d MMM yyyy HH:mm:ss Z")}</lastBuildDate>

    <#list published_posts as post>
		<item>
		  <title><#escape x as x?xml>${post.title}</#escape></title>
		  <link>${config.site_host}/${post.noExtensionUri!post.uri}</link>
		  <pubDate>${post.date?string("EEE, d MMM yyyy HH:mm:ss Z")}</pubDate>
      <#if post.author?? && config['site_author_' + post.author]?? ><dc:creator>${config['site_author_' + post.author]}</dc:creator></#if>
      <guid isPermaLink="false">${post.noExtensionUri!post.uri}</guid>
			<description>
				<#escape x as x?xml>
				${post.body}
				</#escape>
			</description>
		</item>
    </#list>
  </channel>
</rss>
