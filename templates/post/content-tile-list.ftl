
<#if (cnt - 1) % 3 == 0>
  <#if cnt gt 1></div></#if>
  <div class="row">
</#if>

  <div class="4u 12u(mobile)">
    <article class="tile" data-file="${content.rootpath}${post.noExtensionUri!post.uri}" data-target="article">
      <#include "../commons/featured.ftl">

      <div class="content">
        <#include "tile-header.ftl">

        <p>${post.summary!''}</p>

        <footer>
          <ul class="actions">
            <li><a href="${content.rootpath}${post.noExtensionUri!post.uri}" class="button big">Weiterlesen ...</a></li>
          </ul>
        </footer>
      </div>
    </article>
  </div>
