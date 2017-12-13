<#include "header.ftl">

	<#include "menu.ftl">

<div id="main">
	<#list published_posts as post>
		<#assign cnt = post?counter>
		<#if (post??) >
			<#include "post/content-tile-list.ftl">
		</#if>
	</#list>

	</div>

	<#include "post/prev-next.ftl">
</div>

<#include "commons/sidebar.ftl">

<#include "footer.ftl">
