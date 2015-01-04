docker-piwik
============

Stackable piwik for Docker

Hint
----
Piwik is not able for pre-configured deployment.
Thus piwik configuration must be done by hand or via mounting a config file volume.

Usage
-----
```
$ docker run -d --name piwik --link mysql:mysql -p 8080:80 piwik
```
Or
```
$docker run -d --name piwik --link mysql:mysql -v /my/config.ini.php:/srv/piwik/config/config.ini.php -p 8080:80 piwik
```
