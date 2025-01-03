# edu-databases
Este repositorio contiene una colección de bases de datos diseñadas con fines académicos.

---

## **Cómo descargar e instalar MySQL**
1. Ve a la página oficial de MySQL:  
   👉 [https://dev.mysql.com/downloads/](https://dev.mysql.com/downloads/)
   
2. Descarga el instalador de MySQL Community Edition para tu sistema operativo.

3. Durante la instalación, selecciona los siguientes componentes:
   - **MySQL Server**
   - **MySQL Workbench** (opcional, pero recomendado)
   - **MySQL Shell**

4. Configura la contraseña para el usuario `root` y guarda la información de acceso.

---

## **Cómo conectar al servidor MySQL**
1. Abre una terminal o el CMD con permisos de administrador.
2. Escribe el siguiente comando para conectarte al servidor MySQL:

   ```bash
   mysql -u root -p

3. Ingresa la contraseña configurada para el usuario `root`.

---

## **Cómo cargar un archivo .sql en MySQL**
1. Asegúrate de estar conectado al servidor MySQL.
2. Una vez conectado al servidor, usa el comando `SOURCE` para cargar el archivo `.sql`. Este comando ejecutará todo el contenido del archivo en el servidor MySQL.

   ```bash
   SOURCE C:\Users\nombreUsuario\Downloads\archivo.sql;

---

## **Cómo verificar y utilizar la base de datos**
1. Lista las bases de datos:

   ```bash
   SHOW DATABASES;

2. Cambia a la base de datos recién creada:

   ```bash
   USE nombre_de_la_base_de_datos;

3. Lista las tablas para verificar que se hayan creado correctamente:

   ```bash
   SHOW TABLES;

---

## **Cómo conectar a MySQL Workbench**
1. Inicia MySQL Workbench.
2. Haz clic en el icono "+" que aparece junto a **MySQL Connections**.
3. Configura la conexión:
Connection Name: Dale un nombre a la conexión.
Hostname: Si MySQL está en tu computadora, escribe: `localhost`. Si es un servidor remoto, escribe la dirección IP o el nombre de dominio.
Port: Por defecto es `3306`. Si usas otro puerto lo tienes que indicar aquí.
Username: Por defecto `root`.
Password: Haz clic en el botón **Store in Vault ...** y escribe la contraseña del usuario.

![Configurar nueva conexión](https://github.com/victordomgs/edu-databases/blob/main/images/setup-new-connection.png)
