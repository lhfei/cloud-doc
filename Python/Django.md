
- Install Python


- install or upgrade

```sh
pip install [--upgrade] Django

# check Django version
python -m django --version
```

```
```

# **Write first Django app**

> Part 1

- Creating a project

```sh
django-admin startproject notebook_explorer


# show what created:
tree ./notebook_explorer

    D:\WORKSPACE\PYCHARMPROJECTS\NOTEBOOK_EXPLORER
    │  manage.py
    │
    ├─.idea
    │      misc.xml
    │      modules.xml
    │      notebook_explorer.iml
    │      workspace.xml
    │
    ├─notebook_explorer
    │      settings.py
    │      urls.py
    │      wsgi.py
    │      __init__.py
    │
    └─templates
    
# start server, the default port is 8000
python manage.py runserver [port]
```

> Part 2


- Database setup

```sh
python manage.py migrate
```

- Creating models

```sh
# crate a model
python manage.py startapp polls
```

*polls/models.py*

```python
from django.db import models

# Create your models here.

class Question(models.Model):
    question_text = models.CharField(max_length=255)
    pub_date = models.DateTimeField('date published')

class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=255)
    votes = models.IntegerField(default=0)


```

```sh
# the console output as below:
python manage.py makemigrations polls


    Migrations for 'polls':
      polls\migrations\0001_initial.py:
        - Create model Choice
        - Create model Question
        - Add field question to choice
```

```sh
python manage.py sqlmigrate polls 0001
```
and the console output as:

```sql
BEGIN;
--
-- Create model Choice
--
CREATE TABLE "polls_choice" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "choice_text" varchar(255) NOT NULL, "votes" integer NOT NULL);
--
-- Create model Question
--
CREATE TABLE "polls_question" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "question_text" varchar(255) NOT NULL, "pub_date" datetime NOT NULL);
--
-- Add field question to choice
--
ALTER TABLE "polls_choice" RENAME TO "polls_choice__old";
CREATE TABLE "polls_choice" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "choice_text" varchar(255) NOT NULL, "votes" integer NOT NULL, "question_id" integer NOT NULL REFERENCES "polls_question" ("id"));
INSERT INTO "polls_choice" ("votes", "choice_text", "question_id", "id") SELECT "votes", "choice_text", NULL, "id" FROM "polls_choice__old";
DROP TABLE "polls_choice__old";
CREATE INDEX "polls_choice_7aa0f6ee" ON "polls_choice" ("question_id");
COMMIT;
```

```sh
python manage.py migrate
```


- Creating an admin user

```sh
python manage.py createsuperuser
```
```ini
Username: [admin] Email: [lhfei@126.com] Passowrd: [Lhfei]
```

- Enter the admin site

> Part 3

*polls/views.py*

```python

````


*polls/urls.py*

```python
````

> Part 4

```html
<h1>{{ question.question_text }}</h1>

{% if error_message %}<p><strong>{{ error_message }}</strong></p>{% endif %}

<form action="{% url 'polls:vote' question.id %}" method="post">
{% csrf_token %}
{% for choice in question.choice_set.all %}
    <input type="radio" name="choice" id="choice{{ forloop.counter }}" value="{{ choice.id }}" />
    <label for="choice{{ forloop.counter }}">{{ choice.choice_text }}</label><br />
{% endfor %}
<input type="submit" value="Vote" />
</form>
```

```
```

> #**Class-based views**


```
```


> # **Form Basics**

```markdown
@link http://www.effectivedjango.com/tutorial/forms.html
```

- Adding Fields to the Form
    - ListView
    - CreateView
    - UpdateView
    - DeleteView

```python
class CreateContactView(CreateView):

    model = Contact
    template_name = 'edit_contact.html'
    form_class = forms.ContactForm
```

    
```python
class UpdateContactView(UpdateView):

    model = Contact
    template_name = 'edit_contact.html'
    form_class = forms.ContactForm
```

- Controlling Form Rendering

```html
<form action="{{ action }}" method="POST">
  {% csrf_token %}
  <ul>
    {{ form.as_ul }}
  </ul>
  <input type="submit" value="Save" />
</form>
```

```markdown
# Forms have three pre-baked output formats
- form.as_ul:        outputs the form elements as the items in an unordered list
- form.as_p:                            
- form.as_table:    
```

- Overriding the Default Form




```
```

# [**Wagtail**](https://github.com/wagtail/wagtail 'Django CMS')









