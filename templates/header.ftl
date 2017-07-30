<!DOCTYPE HTML>
<!--
    Future Imperfect by HTML5 UP
    html5up.net | @n33co
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html lang="de">
  <head>
    <meta charset="utf-8"/>
    <title>${config.site_title}<#if (content.title)??> - <#escape x as x?xml>${content.title}</#escape></#if></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="${config.site_author}">
    <meta name="keywords" content="">
    <meta name="generator" content="JBake">

    <link rel="stylesheet" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/google-font.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=" crossorigin="anonymous" />
    <link rel="stylesheet" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/main.css" />
    <link rel="stylesheet" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>css/add-on.css" />

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" integrity="sha256-3Jy/GbSLrg0o9y5Z5n1uw0qxZECH7C6OQpVBgNFYa0g=" crossorigin="anonymous"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <!--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">-->
    <link rel="shortcut icon" href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>img/favicon/favicon.png">
  </head>
  <body>
    <!-- Wrapper -->
    <div id="wrapper">
