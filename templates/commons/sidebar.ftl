<!-- Sidebar -->
<section id="sidebar">
  <!-- Intro -->
  <section id="intro">
    <#if (config.sidebar_intro_pic_circle?boolean == true)>
      <a href="${config.site_host}" class="logo">
        <img src="/${config.sidebar_intro_pic_src}" class="intro-circle" width="${config.sidebar_intro_pic_width}" alt="${config.sidebar_intro_pic_alt}" />
      </a>
    <#elseif (config.sidebar_intro_pic_imperfect?boolean == true) >
      <a href="${config.site_host}" class="logo">
        <img src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>${config.sidebar_intro_pic_src}" alt="${config.sidebar_intro_pic_alt}" />
      </a>
    <#else>
      <a href="${config.site_host}" class="logo">
        <img src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>${config.sidebar_intro_pic_src}" width="${config.sidebar_intro_pic_width}" alt="${config.sidebar_intro_pic_alt}" />
      </a>
    </#if>

    <header>
      <h2>${config.sidebar_intro_header}</h2>
      <p>${config.sidebar_intro_summary}</p>
    </header>
  </section>

  <#if (pageType == 'tags')??>
    <!-- Content List -->
    <section id="recent-posts">
      <ul class="posts">
        <header>
          <h3>Inhalt</h3>
        </header>
        <#list posts?reverse as sideBarPost>
          <li>
            <article>
              <header>
                <h3><a href="${content.rootpath}${sideBarPost.noExtensionUri!sideBarPost.uri}">${sideBarPost.title}</a></h3>
                <time class="published" datetime='${sideBarPost.date?string("MMM dd, yyyy")}'>${sideBarPost.date?string("MMM dd, yyyy")}</time>
              </header>
            </article>
          </li>
        </#list>
      </ul>
    </section>
  <#else>
    <!-- Travels List -->
    <section id="travels">
      <ul class="posts">
        <header>
          <h3>Unsere Reisen</h3>
        </header>
        <#list alltags as tag>
          <li>
            <a class="plain" href="/${config.tag_path}/${tag}.html">
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
      </ul>
    </section>

    <!-- Posts List -->
    <section id="recent-posts">
      <ul class="posts">
        <header>
          <h3>Aktuelle Posts</h3>
        </header>
    	  <#list posts as sideBarPost1>
          <#if (sideBarPost1?counter > config.sidebar_postAmount?number) ><#break/></#if>
          <li>
            <article>
              <header>
                <h3><a href="${content.rootpath}${sideBarPost1.noExtensionUri!sideBarPost1.uri}">${sideBarPost1.title}</a></h3>
                <time class="published" datetime='${sideBarPost1.date?string("MMM dd, yyyy")}'>${sideBarPost1.date?string("MMM dd, yyyy")}</time>
              </header>
            </article>
          </li>
        </#list>

  	    <#if (published_posts?size > config.sidebar_postAmount?number) >
          <li>
            <ul class="actions">
              <li><a href="${content.rootpath}${config.sidebar_viewMorePostLink?has_content?then(config.sidebar_viewMorePostLink,config.archive_path)}" class="button">View more posts</a></li>
            </ul>
          </li>
        </#if>
      </ul>
    </section>
  </#if>

  <!-- Tags List can be show/hide from config-->
  <#if (config.sidebar_tags_show?boolean == true)>
    <section id="tags">
      <ul class="posts">
        <header>
          <h3>Tags</h3>
        </header>

        <#list alltags as sideBarTag1>
          <li>
            <article>
              <header>
                <a href="${content.rootpath}${config.tag_path}/${sideBarTag1}${config.output_extension}">${sideBarTag1}</a>
                <!-- JBake 2.5.1 Issue#357 prevents accessing db, This can be enabled once issue is fixed. -->
                <!-- <span style="float:right;"> (db.getPublishedPostsByTag(sideBarTag1).size()) </span>-->
              </header>
            </article>
          </li>
        </#list>
      </ul>
    </section>
  </#if>

  <!-- About -->
  <section class="blurb">
    <h2>About</h2>
    <p>${config.sidebar_intro_about}</p>

    <ul class="actions">
      <li><a href="${content.rootpath}${config.sidebar_intro_about_learnMore}" class="button">Mehr erfahren</a></li>
    </ul>
  </section>

  <section id="footer">
    <ul class="icons">
      <#if (config.sidebar_social_show?boolean == true)>
        <#include "social.ftl">
      </#if>
      <#if (config.render_feed?boolean == true) >
        <li><a href="${config.feed_file}" type="application/rss+xml" target="_blank" title="RSS" class="fa fa-rss"></a></li>
      </#if>
    </ul>
  </section>
</section>
