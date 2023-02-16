## install & run procedure

1) checkout repository<br>
``` gh repo clone czarte/retailysXMLparser ```

2) checkout submodules<br>
``` git submodule init ```<br>
``` git submodule update ```<br> 

3) composer install<br>
``` cd retailysXMLparser-symfony ```<br> 
``` composer install ```<br> 
``` touch .env ```<br> 
``` cd .. ```

4) create ssh keys into certs directory <br>
``` mkdir certs && cd certs ```<br> 
``` openssl req -x509 -new -out projectcert.crt -keyout projectcert.key -days 365 -newkey rsa:4096 -sha256 -nodes ```<br> 
``` cd .. ```

5) docker-compose <br>
``` docker-compose -p xmlparser_vojtechparkan up -d ```

6) run php unit tests<br>
``` ./vendor/bin/phpunit ```

7) testing XML on localhost<br>
``` http://localhost:8006/test/export_one.xml.zip ```
