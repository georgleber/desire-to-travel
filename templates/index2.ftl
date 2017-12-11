<#include "header.ftl">

	<#include "menu.ftl">

<div id="main">
	<#list published_posts as post>
		<#assign cnt = post?counter>
		<#if (post??) >
			<#include "post/content-tile-list.ftl">
		</#if>
	</#list>

	<#if cnt % 2 == 0>
			<div class="6u 12u(mobile)"></div>
		</div>
	</#if>

	<#include "post/prev-next.ftl">
</div>

<#include "commons/sidebar.ftl">

<#include "footer.ftl">
