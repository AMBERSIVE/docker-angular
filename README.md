# Angular Docker Container

This docker container should allow you to run an standalone angular v2+ application.

## Useage

Copy the docker-compose.yml file into your project.

Modify the volumne path.

## Build your own image

```dockerfile
FROM ambersive/angular:latest
COPY ./dist /var/www/html
EXPOSE 80 443
CMD ["/scripts/start.sh"]
```

## Security Vulnerabilities

If you discover a security vulnerability within this container, please send an e-mail to Manuel Pirker-Ihl via [manuel.pirker-ihl@ambersive.com](mailto:manuel.pirker-ihl@ambersive.com). All security vulnerabilities will be promptly addressed.

## License

This container is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).