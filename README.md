# Contacto
Si quieres contactar conmigo, puedes hacerlo agregandome a través de [Linkedin](https://www.linkedin.com/in/chrisgonre/) enviandome un mensaje privado


## Descripcion
El propósito de este proyecto es demostrar de una manera sencilla el uso y las posibilidades que tiene Docker dentro de un entorno académico o laboral.

## Requerimientos
[Docker](https://docs.docker.com/get-docker/)

En caso de instalar Docker en Windows, se recomienda instalarlo utilizando [Windows WSL2](https://docs.docker.com/desktop/windows/wsl/)
[Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Instrucciones
1. Nos descargamos este repositorio usando Git y vamos a la carpeta
    ```bash
    git clone https://github.com/christiangonre-org/ciudad-muchachos-2022.git
    cd ciudad-muchachos-2022
    ```
2. Con los siguientes comandos, vamos a proceder a levantar 3 contenedores diferentes (Nginx, Apache y otro web server que indica información de la petición web)
    ```bash
    docker-compose -f docker-compose-nginx.yaml -p nginx up -d
    docker-compose -f docker-compose-apache.yaml -p apache up -d 
    docker-compose -f docker-compose-echo.yaml -p echo up -d
    ```
    *NOTA*: Si estás utilizando Linux, puedes utilizar el script [init.sh](init.sh) que se encuentra en el repositorio.

3. Accede a las diferentes web para comprobar que todo funciona correctamente.

    http://localhost:8080 --> Nginx

    http://localhost:8081 --> Echo Web server

    http://localhost:8082 --> Apache

4. Para comprobar lo sencillo que es actualizar uno de los contenedores, vas a modificar el fichero [index.html](htdocs/index.html) y acceder a la web http://localhost:8082 para ver que se ha cambiado el contenido.

5. Apagáis todo con el siguiente comando:
    ```docker
    docker-compose -f docker-compose-nginx.yaml -p nginx  down
    docker-compose -f docker-compose-apache.yaml -p apache down
    docker-compose -f docker-compose-echo.yaml -p echo down
    ```
    *NOTA*: Podéis usar el script [stop.sh](stop.sh) para apagar todos los contenedores.


## Ejecutar un entorno real de pruebas

En esta parte, vamos a utilizar el repositorio de mi amigo [Manuel](https://mmorejon.io/) que simula un entorno real en el que podemos sacar provecho de la herramienta Docker
Para ello, nos descargamos su repositorio [microservices-docker-go-mongodb](https://github.com/mmorejon/microservices-docker-go-mongodb)
```bash
git clone https://github.com/mmorejon/microservices-docker-go-mongodb.git
cd microservices-docker-go-mongodb
```

Una vez estamos dentro de este repositorio, vamos a levantar su aplicación para poder hacer pruebas con ella.
```bash
docker-compose up -d
# Restauramos la base de datos de ejemplo
$ docker-compose exec db mongorestore --uri mongodb://db:27017 --gzip  /backup/cinema
```

Una vez hemos levantado la aplicación, ya podemos acceder sin ningún problema a través de esta URL http://localhost:8080

Si queremos a acceder al panel de Traefik, que es el proxy que se encarga de permitirnos acceder a esta web lo podemos hacer a través de esta URL: http://localhost:8080/dashboard/#/

Si queremos parar esta aplicación, basta con ejecutar el siguiente comando:
```bash
docker-compose down
```


## Extensiones de Docker
https://docs.docker.com/desktop/extensions/