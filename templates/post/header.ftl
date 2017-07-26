<header>
  <div class="title">
    <#if (titleH1 == true)??>
      <h1><a href="${content.rootpath}${post.noExtensionUri!post.uri}">${post.title}</a></h1>
      <#assign titleH1 = false />
    <#else>
      <h2><a href="${content.rootpath}${post.noExtensionUri!post.uri}">${post.title}</a></h2>
    </#if>

    <#if (post.description?has_content)>
      <p>${post.description}</p>
    </#if>
  </div>
  <div class="meta">
    <time class="published" datetime='${post.date?string("MMM dd, yyyy")}'>
      ${post.date?string("MMM dd, yyyy")}
    </time>
    <#if ((config.site_includeReadTime!'true')?boolean == true)>
      <div class="published eta"></div>
    </#if>
    <#if post.author?? && config['site_author_' + post.author]?? >
      <span class="author">
        <span class="name">${config['site_author_' + post.author]}</span>
        <img src="/${config['site_author_' + post.author + '_avatar']}" alt="${config['site_author_' + post.author]}" />
      </span>
    </#if>
  </div>
</header>
