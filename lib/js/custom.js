/*
 * Social share pop-up plugin
 *
 *
 *
 */

var sociallinks = function(){

	// Pop-up window parameters
	var position = {};
	position.width = 500;
	position.height = 300;
	position.left = (window.innerWidth - position.width)/2,
	position.top = (window.innerHeight - position.height)/2

	// Get array of elements with class "social". Doesn't work in IE 8 and lower.
	var socials = document.getElementsByClassName("social");

	// Handler for click
	var clickHandler = function(e){
		e.preventDefault();

		// NOTE! This section added for code flexibility instead using this.href in window.open
		// Get data attribute
		var data;
		if (this.dataset){
			data = this.dataset;
		}
		else{
			// IE 10 and lower;
			data = {};
			data.social = this.getAttribute("data-social");
			data.url = this.getAttribute("data-url");
			data.text = this.getAttribute("data-text");
		}

		// Make correct link
		var url;
		switch(data.social){
			case "facebook":
				url = "https://www.facebook.com/sharer/sharer.php?u="+data.url;
			break;
			case "twitter":
				url = "http://twitter.com/share?url="+data.url+"&text="+data.text;
			break;
			case "googleplus":
				url = "https://plus.google.com/share?url="+data.url;
			break;
		}

		// Open pop-up
		if (url){
			window.open(url, 'socialnetworkwindow', 'left='+position.left+', top='+position.top+', height='+position.height+', width='+position.width+', toolbar=0, resizable=0');
		}
	};

	// Add event listener for each link
	for (var i=0; i < socials.length; i++){
		socials[i].addEventListener('click', clickHandler);
	}
};

sociallinks();