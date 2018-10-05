<#if (config.render_tags?boolean == true) && post.tags?? >
	<ul class="stats">
  	<!-- Display the categories associated with this post -->
  	<li><i class="fa fa-tags">&nbsp;</i> Tags: </li>
    <#list post.tags as tag>
    	<li>
    	    <a href='${content.rootpath}${config.tag_path}/${tag}${config.output_extension}'>
                <#if tag?ends_with("(travel)")>
                    ${tag?remove_ending(" (travel)")}
                <#elseif tag?ends_with("(mountain-tour)")>
                    ${tag?remove_ending(" (mountain-tour)")}
                <#else>
                    ${tag}
                </#if>
            </a>
        </li>
    </#list>

		<#if (config.site_disqus_shortname?has_content)>
			<li><a class="icon fa-comment" href="${content.rootpath}${post.noExtensionUri!post.uri}#disqus_thread"> &nbsp;</a></li>
		</#if>
	</ul>
</#if>
