

## File Name Template

```
{{last_highlighted_date |date('Y-m-d')}} - {{title|replace(""", "")|replace(""","")|replace("'", "")|replace("'", "")|truncate(159)}} by {{author|replace("@","")|truncate(80)}}
```

## Metadata Template

```
{% if image_url -%}
![rw-book-cover]({{image_url}})

{% endif -%}
## Metadata
- Author: {% if author %}[[{{author|replace("@","")}}]]{% endif %}
- Full Title: {{full_title}}
- Category: #{{category}}
{% if document_tags -%}
- Document Tags: {% for tag in document_tags %}[[{{tag}}]] {% endfor %}
{% endif -%}
{% if url -%}
- URL: {{url}}
{% endif -%}
```

## Highlights Header Template

```
{% if is_new_page %}a
## Highlights
{% elif has_new_highlights -%}
## New highlights added {{date|date('F j, Y')}} at {{time}}
{% endif -%}
```

## Highlight Template

```
> {{ highlight_text }}
{% if highlight_note %}
- [note] {{ highlight_note }}
{% endif %}
{% if highlight_location and highlight_location_url %} * [{{highlight_location}}]({{highlight_location_url}}){% elif highlight_location %} ({{highlight_location}}){% endif %}
```

## YAML Header Template

```
Date Created: {{date|date('Y-m-d')}}
Date Modified: <% tp.file.last_modified_date("YYYY-MM-DD") %>
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: {{full_title|replace(":","-")}}
Image: {{image_url}}
SourceAuthor: {% if author %}{{author|replace("@","")|replace(" on Twitter","")}}{% endif %}
cssclass: readwise
Tags: [ "#Type/Readwise" ]
Aliases: ["<% tp.file.title %>"]
```
