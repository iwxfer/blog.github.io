# SQLAlchemy



db.Column(db.BigInteger)
Boolean

Column(DateTime, default=datetime.datetime.utcnow)

### Links

* Full cheat sheet https://www.pythonsheets.com/notes/python-sqlalchemy.html
* Table relation https://hackersandslackers.com/sqlalchemy-data-models/
* CRUD https://medium.com/@allwindicaprio/crud-operations-using-flask-and-sqlalchemy-7291e340dcc8


```python
book = Book(name="The monk who", author="Robin Sharma", published="1997-03-04")
db.session.add(book)
db.session.commit()

db.session.delete(book)
db.session.commit()
```

### Queries

```python
book = Book.query.all()
book = Book.query.get(1)

sess.query(User).filter(User.age == 25)

```

