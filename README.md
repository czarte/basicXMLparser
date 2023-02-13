## install & run procedure

1) checkout repository
``` gh repo clone czarte/retailysXMLparser ```

2) checkout submodules
``` git submodule init ```<br>
``` git submodule update ```<br> 

3) composer install
``` cd retailysXMLparser-symfony ```<br> 
``` composer install ```<br> 
``` touch .env ```<br> 
``` cd .. ```

4) create ssh keys into certs directory 
``` mkdir certs && cd certs ```<br> 
``` openssl req -x509 -new -out projectcert.crt -keyout projectcert.key -days 365 -newkey rsa:4096 -sha256 -nodes ```<br> 
``` cd .. ```

5) docker-compose 
``` docker-compose -p xmlparser_vojtechparkan up -d ```

6) run php unit tests
``` ./vendor/bin/phpunit ```

7) testing XML on localhost
``` http://localhost:8006/test/export_one.xml.zip ```
