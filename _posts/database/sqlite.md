# types

- NULL. 
- INTEGER. Signed integer (1, 2, 3, 4, 6, or 8 bytes)
- REAL. Floating point value, stored as an 8-byte IEEE floating point number.
- TEXT. The value is a text string (UTF-8, UTF-16BE or UTF-16LE).
- BLOB.

## date and time

- TEXT. As ISO8601 strings ("YYYY-MM-DD HH:MM:SS.SSS").
- REAL. The number of days since noon in Greenwich on November 24, 4714 B.C.
- INTEGER. As Unix Time, the number of seconds since 1970-01-01 00:00:00 UTC.