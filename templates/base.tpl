<!DOCTYPE HTML>
<html class="{% block classes %}{% endblock %}" lang="{{ z_language|default:"en"|escape }}>
	<head>
		<meta charset="utf-8" />

		<title>{% block title %}{{ m.rsc[id].title }}{% endblock %}</title>

		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" >
		<meta name="description" content="{% block description %}{{ id|summary:160 }}{% endblock %}">
		<meta name="keywords" content="{% block keywords %}{% endblock %}">

	{% if m.config.site.site_title.value %}
		<meta property="og:site_name" content="{{ m.config.site.site_title.value }}"/>
	{% endif %}
	{% if id %}
		<meta property="og:title" content="{{ id.title }}"/>
		<meta property="og:description" content="{{ id|summary:160 }}"/>
		<meta property="og:url" content="http://{{ m.site.hostname }}{{ id.page_url }}"/>
		{% if id.depiction %}
		<meta property="og:image" content="http://{{ m.site.hostname }}{% image_url id.depiction mediaclass="facebook-og" %}"/>
		{% endif %}
	{% endif %}


		<!-- FAV and TOUCH ICONS -->
		<link rel="shortcut icon" href="images/ico/favicon.ico">
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/logo-144.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/logo-114.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/logo-72.png">
		<link rel="apple-touch-icon-precomposed" href="images/ico/logo-57.png">

		<!-- FONTS -->
		<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type='text/css'>

		<!--[if lte IE 9]>
		    <script src="js/html5shiv.js"></script>
		    <script src="js/selectivizr-min.js"></script>
		<![endif]-->

		{% all include "_html_head.tpl" %}

		{% lib
			"css/print.css"
		%}

		{% lib
			"css/grid.css"
			"css/style.css"
			"css/normalize.css"
			"js/google-code-prettify/prettify.css"
			"css/uniform.default.css"
			"css/main.css"
			"css/flexslider.css"
			"css/additional.css"
		%}


	</head>

	<body>
		<div id="page" class="hfeed site">
			{% include "header.tpl" %}

			<section id="main" class="middle wrapper">
				<div class="row row-fluid">
					<div class="readable-content row-fluid page">
						{% block content %}{% endblock %}
					</div>
				</div>
			</section>

			{% include "footer.tpl" %}
		</div>

		{% include "_js_include_jquery.tpl" %}

		{% lib
			"js/detectmobilebrowser.js"
			"js/modernizr.js"
			"js/jquery.imagesloaded.min.js"
			"js/jquery.fitvids.js"
			"js/google-code-prettify/prettify.js"
			"js/jquery.uniform.min.js"

			"js/modules/ubf.js"
			"js/apps/zotonic-1.0.js"
			"js/apps/z.widgetmanager.js"
			"js/modules/livevalidation-1.3.js"
			"js/modules/z.inputoverlay.js"
			"js/modules/z.dialog.js"
			"js/modules/jquery.loadmask.js"

			"js/main.js"
			"js/custom.js"
		%}

		{% script %}

		{% all include "_html_body.tpl" %}

	</body>
</html>