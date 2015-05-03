---
title:  Recent Posts
layout: default
---

<div class="pure-u-1">
	<div class="post">
		<h1 class="content-subhead">Recent Posts</h1>
		{% for post in site.posts limit: 5 %}
		<div class="post">
			<div class="post-header">
				<!--<img class="post-avatar" height="48" width="48" src="/avatar/{{ post.author }}.jpg" />-->
				<h2 class="post-title"><a href="{{ post.url }}">{{ post.title }}</a></h2>
				<p class="post-meta">
					<span class="fa fa-calendar" aria-hidden="true"></span>
					{{ post.date | date:"%Y-%m-%d" }}
					<br>
					<span class="fa fa-tag" aria-hidden="true"></span>
					{% for tag in post.tags %}
					<a href="/tag/{{ tag }}"><span class="label label-info">{{ tag }}</span></a>
					{% endfor %}
				</p>
			</div>
			<div class="post-description">
			{{ post.content | split:'<!--more-->'| first }}
			</div>
		</div>
		{% endfor %}
	</div>
</div>
