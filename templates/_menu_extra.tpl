{% include "_language_switch.tpl" %}
<li>
	<form role="search" method="get" id="search-form" action="{% url search %}">
		<label class="screen-reader-text" for="search">{_ Search _}</label>
		<input type="text" value="" name="qs" id="search" title="Enter keyword">
		<input type="submit" id="search-submit" title="Search it" value="→">
	</form>
</li>
