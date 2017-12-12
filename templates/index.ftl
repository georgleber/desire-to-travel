<#include "header.ftl">

	<#include "menu.ftl">

<div id="main">
	<#list published_posts as post>
		<#assign cnt = post?counter>
		<#if (post??) >
			<#include "post/content-tile-list.ftl">
		</#if>
	</#list>

	<#list 0..2 as x>
		<#if (cnt + x - 1) % 3 != 0>
			<div class="4u 12u(mobile)"></div>
		<#else>
			</div>
		</#if>
	</#list>

	<#include "post/prev-next.ftl">
</div>

<#include "commons/sidebar.ftl">

<#include "footer.ftl">
