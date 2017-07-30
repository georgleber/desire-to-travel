<article class="post">
  <#include "header.ftl">

  <#if (config.site_google_mapsid?has_content && content?? && content.locations??)>
    <div class="ribbon-container">
      <a href="#map" class="ribbon">
        <i class="fa fa-map-marker"></i> Google Maps
      </a>
    </div>
  </#if>

  <#include "../commons/featured.ftl">

  <div id="content">
    ${post.body}
  </div>

  <#if (config.site_google_mapsid?has_content && content?? && content.locations??)>
    <#include "../commons/google-maps.ftl">
  </#if>
  
  <footer>
  	<#include "../commons/footer-tags.ftl">
  </footer>
</article>
