# Python Development Guidelines

## 1. Code Structure

PyPI is the Python Package Index; it has more than 200k projects at the time of writing.

We should use code from this instead of writing it this saves time and lets you focus on the more important things.

Install these using pip. You can also create and upload your own package here.

```bash
docs/conf.py
docs/index.rst
module/__init__.py
module/core.py
tests/core.py
README.md
requirements.txt
setup.py
```


* `requirements.txt`: This is not mandatory, but if you use this, you put it in the root directory.
* `setup.py`: This script in the root lets distutils build and distribute modules needed by the project.
* `Documentation`: Readable documentation is essential. This is placed in the docs directory.
* `Tests`: Most projects have tests- keep these in the tests directory.

## 2. Follow and Verify Style Guidelines

The PEP8 holds some great community-generated proposals. PEP stands for Python Enhancement Proposals- these are guidelines and standards for development. This is to make sure all Python code looks and feels the same.

One such guideline is to name classes with the CapWords convention.

- Use proper naming conventions for variables, functions, methods, and more.
- Variables, functions, methods, packages, modules: this_is_a_variable
- Classes and exceptions: CapWords
- Protected methods and internal functions: `_single_leading_underscore` Private methods: `__double_leading_underscore`
- Constants: CAPS_WITH_UNDERSCORES
- You should use line breaks and indent your code.
- Use naming conventions for identifiers this makes it easier to understand the code.
- Use comments, and whitespaces around operators and assignments.
- The maximum line length is 79 characters according to PEP8. However, is specific cases we can skip this rule, for example long queries we are not editting in the python file itself, but in SQL tool.

## 3. Verify code

- We will use flake8 to validate our coding style and structure

```bash
pip install flake8
```

```ini
[flake8]
ignore = E226,E302,W291,E225,W293,E203,W391,F541,E201,E202
max-line-length = 200
exclude = tests/*
max-complexity = 10
```

## 4. Write tests and check test coverage


## 5. Create Readable Documentation

For this, you can use Markdown, reStructuredText. Markdown and reStructuredText are markup languages with plain text formatting syntax to make it easier to mark up text and convert it to a format like HTML or PDF.
reStructuredText lets you creaet in-line documentation.


## 6. Use Virtual Environments

You should create a virtual environment for each project you create.

This will avoid any library clashes, since different projects may need different versions of a certain library.

## 7. Write Object-Oriented Code

Python is also a object-oriented language. We should try to use the object-oriented paradigm even for simple features. It is very common that small scripts turn into bigger projects.

This has the advantages of data hiding and modularity. It allows reusability and modularity.

## 8. Version control

An important file is `.gitignore`. Avoiding noise to projects is very good practice, it avoids confusion.
Recomended file is:

```
.env
```

## 9. Deploy and publish

For deploying a package we use twine:

```bash
twine upload --repository https://artifact.example.com/repository/ASAP-Python-2.7-Hosted/ boto3-1.9.76-py2.py3-none-any.whl
 https://nexus.mtvi.com/nexus/repository
twine upload --repository https://nexus.mtvi.com/nexus/repository/pypi/packages dba_notification_lib-0.0.1-py3-none-any.whl
```

## 10. The "Cryptic Log" Antipattern

- When writing logs we should provide the more clear information. If we are not sure about the cause of the error, we should print the whole trace.


```py
try:
    something()
except Exception:
	logger.error("something bad happened")
except Exception:
    logger.error("something bad happened", )
```

- Avoid this generic logging or skip logging.

```py
try:
    something()
except Exception:
    logger.error("something bad happened")
```

* 

```py
try:
    something()
except Exception:
    pass
```

### 11. Imports

Avoid importing everything from a package (`from mylib import *`), this pollutes the global namespace and can cause clashes.
