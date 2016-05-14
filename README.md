# danielmccoy/alpine-nginx-php-laravel
Nginx and PHP-FPM Docker container for Laravel built on Apline Linux

# Basic Usage

Start container with Nginx port and Laravel code directory defined.
```
docker run -p 80:80 -v <LaravelDirectory>:/var/www -t danielmccoy/alpine-nginx-php-laravel
```
Replace `<LaravelDirectory>` with the location to your Laravel project directory.
