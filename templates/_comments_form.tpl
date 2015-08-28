{% with m.acl.user as user_id %}
	<div id="respond">
	{% if user_id or m.config.mod_comment.anonymous.value|default_if_undefined:1 %}

        {% if m.config.comments.moderate.value %}
            <div id='comments-moderation-notice' style='display: none'>
    	        <h2>Your comment</h2>
    	        <p>{_ Your comment has been saved and will be subject to review before it is displayed to other visitors of the website. Thank you for your comment! _}</p>
            </div>
            {% wire id="comments-form" type="submit" postback={newcomment id=id} delegate="mod_comment" action={fade_out target="comments-area"} action={slide_fade_in target="comments-moderation-notice"} %}
        {% else %}
            {% wire id="comments-form" type="submit" postback={newcomment id=id} delegate="mod_comment" %}
        {% endif %}

        <div id="comments-area">
            <h3 id="reply-title">{_ Leave a Reply _}</h3>
            {% if m.config.comments.moderate.value %}
                <p>({_ Note: Comments are moderated _})</p>
            {% endif %}
            <form id="comments-form" method="post" action="postback" class="{% block form_class %}{% endblock %}">

	                {% if not user_id %}
                        <p class="comment-form-author">
	                        <label class="control-label" for="name">{_ Name _} <span class="required">*</span></label>
	                        <input type="text" name="name" id="name" class="form-control" size="30" aria-required="true" />
	                        {% validate id="name" type={presence} %}
                        </p>

                        <p class="comment-form-email">
	                        <label class="control-label" for="mail">{_ E-mail _} <span class="required">*</span></label>
	                        <input type="text" name="mail" id="mail" class="form-control" size="30" aria-required="true" />
	                        {% validate id="mail" type={presence} type={email} %}
	                    </p>
	                {% endif %}

                    <p class="comment-form-comment">
	                    <label class="control-label" for="message">{_ Message _}</label>
	                    <textarea name="message" id="message" cols="60" rows="8" class="form-control"></textarea>
	                    {% validate id="message" type={presence} %}
                    </p>

                    <p class="form-submit">
	                    <button id="submit" class="btn btn-primary" type="submit">{_ Send _}</button>
	                    <input type="hidden" name="user_agent" value="{{ m.req.user_agent|escape }}" />
	                </p>

            </form>
        </div>

    {% else %}
        <p id="comments-logon"><a href="{% url logon back %}">{_ Log on or sign up to comment _}</a>.</p>
    {% endif %}
	</div>
{% endwith %}
