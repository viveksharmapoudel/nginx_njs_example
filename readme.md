Steps:

1. Install nginx and nginx-module-njs

```
apt install curl gnupg2 ca-certificates lsb-release debian-archive-keyring
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list
apt update
apt install nginx nginx-module-njs

```

2. set environment variable as provided in .env.example

3. start node server in port 5000

4. start nginx and check status using following command

```
    systemctl start nginx && systemctl status nginx
```

Alternative via docker (Recommended):

1. Build image

```
docker-compose build
```

2. Run Image

```
docker-compose up
```

Testing:

1. Go to your terminal and check (if you have set any other SERVER_PORT in .env file use that instead of 8080)

```
curl localhost:8080
```

2. For checking verification

```
curl localhost:8080 -d "aaaa" -H token:this_is_secret
```
