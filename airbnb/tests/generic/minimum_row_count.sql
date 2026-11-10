{% test minimum_row_count(model, min_row_count) %}
{# Test to check if a model has at least a minimum number of rows #}
{{config(
    severity='warn')}}
    select count(*) as row_count
    from {{ model }}
    having count(*) < {{ min_row_count }}
{% endtest %}