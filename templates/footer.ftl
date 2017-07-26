
				<a id="back-to-top" href="#" class="fa fa-arrow-up fa-border fa-2x"></a>
				<div id="push"></div>
    </div>

		<footer id="footer">

			<p class="copyright">
				<a href="${config.site_host}/imprint.html" class="imprint">Impressum</a><br/>
				&copy; ${config.site_title}. Design: <a href="http://html5up.net" target="_blank">HTML5 UP</a>. Ported For SSG by <a href="https://github.com/jpescador/hugo-future-imperfect">Julio Pescador</a>. Adapted to JBake by <a href="//github.com/manikmagar" target="_blank">Manik Magar</a>. Baked with <a href="http://jbake.org">JBake ${version}</a>.
			</p>
		</footer>

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

		<script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/jquery.min.js"></script>
		<script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/skel.min.js"></script>
		<script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/util.js"></script>
		<script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/main.js"></script>
		<script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/backToTop.js"></script>
		<script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/highlight.pack.js"></script>
		<script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/readingTime.js"></script>

		<#if (config.site_disqus_shortname?has_content)>
			<script id="dsq-count-scr" src="//${config.site_disqus_shortname}.disqus.com/count.js" async></script>
		</#if>
		<#if (config.site_google_trackingid?has_content)>
			<#include "commons/google-analytics.ftl" />
		</#if>
		<!-- This is called by default since this theme uses highlight.js -->
		<script>hljs.initHighlightingOnLoad();</script>
		<!--[if lte IE 8]><script src="/js/ie/respond.min.js"></script><![endif]-->

  </body>
</html>
