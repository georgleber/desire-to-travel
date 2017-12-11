<#if cnt == 1>
  <#assign opened = false>
  <div class="row">
<#elseif cnt % 2 == 0>
  <#assign opened = true>
  <div class="row">
<#else>
  <#assign opened = false>
</#if>

<#if cnt == 1>
  <div class="12u">
<#else>
  <div class="6u 12u(mobile)">
</#if>

    <article class="tile <#if cnt == 1>master</#if>" data-file="${content.rootpath}${post.noExtensionUri!post.uri}" data-target="article">
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

<#if opened == false>
  </div>
</#if>
