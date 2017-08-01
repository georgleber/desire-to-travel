
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

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.10/handlebars.min.js" integrity="sha256-0JaDbGZRXlzkFbV8Xi8ZhH/zZ6QQM0Y3dCkYZ7JYq34=" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/skel/3.0.1/skel.min.js" integrity="sha256-3e+NvOq+D/yeJy1qrWpYkEUr6SlOCL5mHpc2nZfX74E=" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.9.0/js/lightbox.min.js" integrity="sha256-9r7DHolfe5aoH+bUj4FEqRBq2tmaIXBxOYUZFalCjSE=" crossorigin="anonymous"></script>
		<script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/main.js"></script>

		<#if (config.site_disqus_shortname?has_content)>
			<script id="dsq-count-scr" src="//${config.site_disqus_shortname}.disqus.com/count.js" async></script>
		</#if>
		<#if (config.site_google_trackingid?has_content)>
			<#include "commons/google-analytics.ftl" />
		</#if>
		<#if (config.site_flickr_apikey?has_content && config.site_flickr_userid?has_content)>
			<#include "commons/flickr.ftl">
		</#if>
		<!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js" integrity="sha256-g6iAfvZp+nDQ2TdTR/VVKJf3bGro4ub5fvWSWVRi2NE=" crossorigin="anonymous"></script><![endif]-->
  </body>
</html>
