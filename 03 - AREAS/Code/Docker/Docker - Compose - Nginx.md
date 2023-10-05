```ini
# default.conf
gzip on;
gzip_min_length 1k;
gzip_buffers 4 16k;
gzip_comp_level 5;
gzip_types text/plain text/css text/xml application/javascript image/jpeg image/png image/gif image/bmp;

server {
    listen       80;
    server_name  localhost;
     location /test/ {
         proxy_pass http://192.168.11.150:9001/;
    }
}
```

```yaml
version: '3.1'

services:
  nginx:
    image: nginx:alpine
    environment:
      TZ: 'Asia/Shanghai'
    ports:
      - '80:80'
      - '443:443'
    container_name: nginx
    volumes:
      - '$PWD/certificate:/home/certificate'
      - '$PWD/html:/usr/share/nginx/html'
      - '$PWD/config:/etc/nginx/conf.d'
```