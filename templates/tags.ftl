<#assign pageType = 'tags' />

<#include "header.ftl">

<#include "menu.ftl">

<div id="main">
	<h1>
	    <#if tag?ends_with("(travel)")>
	        ${tag?remove_ending(" (travel)")}
	    <#elseif tag?ends_with("(mountain-tour)")>
	        ${tag?remove_ending(" (mountain-tour)")}
	    <#else>
	        ${tag}
        </#if>
    </h1>

  <#list tag_posts?reverse as post>
  	<#include "post/content-list.ftl">
  </#list>
</div>

<#include "commons/sidebar.ftl">

<#include "footer.ftl">
