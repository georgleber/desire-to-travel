<!-- Header -->
<header id="header">
    <h1><a href="${config.site_host}">${config.site_title}</i></a></h1>

  <nav class="links">
    <ul>
      <#list config.site_menus_main as menuItem1>
        <#if (config.site_menus_main_showTagsDropdown?boolean)?? == true && menuItem1 == 'tags'>
          <li>
	          <a href="javascript:void(0)">
              <i class="${config['site_menus_main_' + menuItem1 + '_icon']}">&nbsp;</i>${config['site_menus_main_' + menuItem1 + '_label']}
	          </a>
	          <ul class="dropdown-menu">
				      <#list alltags as tag>
							  <li><a class="plain" href="/${config.tag_path}/${tag}.html">${tag}</a></li>
							</#list>
			      </ul>
      	  </li>
    		<#else>
    			<li>
            <a href="<#if (config['site_menus_main_' + menuItem1 + '_url'] != "/")> ${content.rootpath}${config['site_menus_main_' + menuItem1 + '_url']}<#else> ${config.site_host}</#if>">
              <i class="${config['site_menus_main_' + menuItem1 + '_icon']}">&nbsp;</i>${config['site_menus_main_' + menuItem1 + '_label']}
            </a>
        	</li>
    		</#if>
			</#list>
    </ul>
  </nav>

  <nav class="main">
    <ul>
      <#if content.shareNav??>
        <li id="share-nav" class="share-menu" style="display:none;">
          <a class="fa-share-alt" href="#share-menu">Share</a>
        </li>
      </#if>
      <li class="search">
        <a class="fa-search" href="#search">Search</a>
        <form id="search" method="get" action="//google.com/search">
          <input type="text" name="q" placeholder="Suche" />
          <input type="hidden" name="q" value="site:${config.site_host}">
        </form>
      </li>
      <li class="menu">
        <a class="fa-bars" href="#menu">Menu</a>
      </li>
    </ul>
  </nav>
</header>

<!-- Menu -->
<section id="menu">
    <!-- Search -->
    <section>
      <form class="search" method="get" action="//google.com/search">
        <input type="text" name="q" placeholder="Suche" />
        <input type="hidden" name="q" value="site:${config.site_host}">
      </form>
    </section>

    <!-- Links -->
    <section>
      <ul class="links">
        <#list config.site_menus_main as menuItem>
          <li>
            <a href="${config.site_host}">
              <i class="${config['site_menus_main_' + menuItem + '_icon']}">&nbsp;</i>${config['site_menus_main_' + menuItem + '_label']}
            </a>
          </li>
				</#list>
      </ul>
    </section>

    <!-- Recent Posts -->
    <section>
      <ul class="links">
        <header>
          <h3>Aktuelle Posts</h3>
        </header>
        <#list posts as menuPost1>
          <#if (menuPost1?counter > config.sidebar_postAmount?number) ><#break/></#if>
          <li>
            <a href="${content.rootpath}${content.rootpath}${menuPost1.noExtensionUri!menuPost1.uri}"><p>${menuPost1.title}</p></a>
          </li>
        </#list>
      </ul>
    </section>

    <section>
      <ul class="icons">
        <#if (config.sidebar_social_show?boolean == true)>
          <#include "commons/social.ftl">
        </#if>
        <#if (config.render_feed?boolean == true) >
          <li><a href="${config.feed_file}" type="application/rss+xml" target="_blank" title="RSS" class="fa fa-rss"></a></li>
        </#if>
      </ul>
    </section>
</section>
