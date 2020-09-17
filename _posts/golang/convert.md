# strconv

```golang
import "strconv"

i, err := strconv.Atoi("-42")
s := strconv.Itoa(-42)
```


```golang
b, err := strconv.ParseBool("true")
f, err := strconv.ParseFloat("3.1415", 64)
i, err := strconv.ParseInt("-42", 10, 64)
u, err := strconv.ParseUint("42", 10, 64)
```

```golang
s := strconv.FormatBool(true)
s := strconv.FormatFloat(3.1415, 'E', -1, 64)
s := strconv.FormatInt(-42, 16)
s := strconv.FormatUint(42, 16)
```


```golang
q := strconv.Quote("Hello, 世界")
q := strconv.QuoteToASCII("Hello, 世界")
```