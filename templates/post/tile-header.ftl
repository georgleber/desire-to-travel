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
</header>
