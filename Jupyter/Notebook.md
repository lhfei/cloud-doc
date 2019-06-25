

### Source code

```
/opt/rh/rh-python36/root/usr/lib/python3.6/site-packages/notebook
```



> pages.html

```html
<div id="ipython_notebook" class="nav navbar-brand" style="display: none"><a href="{{default_url}}
    {%- if logged_in and token -%}?token={{token}}{%- endif -%}" title='{% trans %}dashboard{% endtrans %}'>
      {% block logo %}<img src='{{static_url("base/images/logo.png") }}' alt='Jupyter Notebook'/>{% endblock %}
  </a></div>
```



> notebook.html 

```html
<span id="kernel_logo_widget" style="display: none">
  {% block kernel_logo_widget %}
  <img class="current_kernel_logo" alt="Current Kernel Logo" src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"/>
  {% endblock %}
</span>
```

