
				<a id="back-to-top" href="#" class="fa fa-arrow-up fa-border fa-2x"></a>
				<div id="push"></div>
    </div>

		<footer id="footer">

			<p class="copyright">
				<a href="${config.site_host}/imprint.html" class="imprint">Impressum</a><br/>
				&copy; ${config.site_title}<br/>
				Design: <a href="http://html5up.net" target="_blank">HTML5 UP</a>. Adapted to JBake by <a href="//github.com/manikmagar" target="_blank">Manik Magar</a>. Baked with <a href="http://jbake.org" target="_blank">JBake ${version}</a>.
			</p>
		</footer>

		<noscript id="deferred-styles">
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=" crossorigin="anonymous" />
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/featherlight/1.7.9/featherlight.min.css" integrity="sha256-lpBLysR8pdmLZklwWA6kc+HmprKFyH6Ms8qi8ZKOchk=" crossorigin="anonymous" />
		</noscript>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.10/handlebars.min.js" integrity="sha256-0JaDbGZRXlzkFbV8Xi8ZhH/zZ6QQM0Y3dCkYZ7JYq34=" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/skel/3.0.1/skel.min.js" integrity="sha256-3e+NvOq+D/yeJy1qrWpYkEUr6SlOCL5mHpc2nZfX74E=" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/featherlight/1.7.9/featherlight.min.js" integrity="sha256-DkGoQ3CfGfUycHitDk/Kf/hIXSgPJFjBW1VZV6DmRs0=" crossorigin="anonymous"></script>
		<script src="/js/main.min.js"></script>

		<#if (config.site_disqus_shortname?has_content)>
			<script id="dsq-count-scr" src="//${config.site_disqus_shortname}.disqus.com/count.js" async></script>
		</#if>
		<#if (config.site_google_trackingid?has_content)>
			<#include "commons/google-analytics.ftl" />
		</#if>
		<#if (config.site_flickr_apikey?has_content && config.site_flickr_userid?has_content)>
			<#include "commons/flickr.ftl">
		</#if>
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js" integrity="sha256-g6iAfvZp+nDQ2TdTR/VVKJf3bGro4ub5fvWSWVRi2NE=" crossorigin="anonymous"></script>
		<![endif]-->
  </body>
</html>
