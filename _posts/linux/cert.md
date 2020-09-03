## CSR Generation

* Generate CSR

```bash
openssl req -new -newkey rsa:2048 -nodes -keyout server.key -out server.csr
```

Common Name:

* In case of specific subdomain: `sub1.ssl-certificate-host.com`
* In case of wildcard: `*.ssl-certificate-host.com`