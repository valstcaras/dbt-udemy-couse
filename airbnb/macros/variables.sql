{% macro learn_variables() %}

{%set your_name = "Valeria Caras" %}
{{log("Hello" ~ your_name, info=True)}}

{{log("Hello dbt user " ~ var("user_name", "NO USER NAME IS SET!!") ~ "!", info=True)}}

{% endmacro %}