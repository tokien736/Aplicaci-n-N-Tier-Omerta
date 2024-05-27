# Sistema de Gestión Académica

Este proyecto es un sistema de gestión académica desarrollado en ASP.NET Web Forms con C#. La aplicación permite gestionar alumnos, asignaturas, docentes y usuarios, proporcionando funcionalidades CRUD (Crear, Leer, Actualizar, Eliminar) y autenticación de usuarios.

## Estructura del Proyecto

El proyecto está organizado en varias capas:

- **CapaEntidad**: Contiene las entidades que representan las tablas de la base de datos.
- **CapaNegocio**: Contiene la lógica de negocio y las interfaces para interactuar con la capa de datos.
- **CapaDato**: Maneja la conexión y las operaciones con la base de datos.
- **CapaPresentacion**: Contiene las páginas ASP.NET Web Forms y su lógica de presentación.

## Configuración Inicial

### Base de Datos

Para configurar la base de datos, sigue estos pasos:

1. Utiliza el script SQL proporcionado en el archivo `BDAcademico.sql` para crear y poblar la base de datos.

### Capa de Datos

Para configurar la conexión a la base de datos:

1. Abre el archivo `web.config`.
2. Configura la cadena de conexión en la sección `<connectionStrings>`.

### Capa de Negocio

Las clases de la capa de negocio implementan las interfaces definidas para gestionar las entidades y se encargan de interactuar con la capa de datos.

### Capa de Presentación

Esta capa contiene las páginas ASP.NET Web Forms para interactuar con los usuarios finales. Estas páginas están divididas en diferentes módulos para gestionar alumnos, asignaturas, docentes y usuarios.

## Funcionalidades

El sistema ofrece diversas funcionalidades, incluyendo la gestión de alumnos, asignaturas, docentes y usuarios, así como la autenticación y acceso diferenciado según el tipo de usuario.

## Uso

1. Inicia sesión utilizando la página de inicio de sesión con tus credenciales.
2. Dependiendo del tipo de usuario, serás redirigido a la página correspondiente del sistema.
3. Utiliza las diferentes funcionalidades disponibles para gestionar alumnos, asignaturas y docentes según tus necesidades.

## Requisitos

- Visual Studio 2019 o superior.
- SQL Server 2016 o superior.
- .NET Framework 4.7.2 o superior.

## Contacto

Para cualquier duda o consulta sobre el proyecto, por favor contacta a [tu correo electrónico].
