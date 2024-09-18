# Aplicacion-de-Recordatorios-en-SwiftUI
Esta es una aplicación de recordatorios desarrollada en SwiftUI. La aplicación permite a los usuarios crear y gestionar categorías y recordatorios, y se integra con una API creada en Flask para el manejo de datos y notificaciones por correo electrónico.


# Aplicación de Recordatorios en SwiftUI

Esta es una aplicación de recordatorios desarrollada en SwiftUI. La aplicación permite a los usuarios crear y gestionar categorías y recordatorios, y se integra con una API creada en Flask para el manejo de datos y notificaciones por correo electrónico.

## Características

- **Añadir categorías:** Los usuarios pueden crear nuevas categorías para organizar sus recordatorios.
- **Añadir recordatorios:** Los usuarios pueden añadir recordatorios a las categorías existentes.
- **Lista de recordatorios:** Muestra una lista de recordatorios organizados por categorías.
- **Servicio de correo electrónico:** Integración con un servicio de correo electrónico para enviar notificaciones.

## Requisitos

- macOS con Xcode instalado.
- Swift 5 y SwiftUI.

## Instalación

1. **Clona el repositorio:**

    ```bash
    git clone https://github.com/tu_usuario/nombre_del_repositorio.git
    cd nombre_del_repositorio
    ```

2. **Abre el proyecto en Xcode:**

    Navega hasta el directorio del proyecto y abre el archivo `.xcodeproj` o `.xcworkspace` en Xcode:

    ```bash
    open RecordatoriosApp.xcodeproj
    ```

3. **Instala las dependencias (si corresponde):**

    Si tu proyecto utiliza dependencias externas, asegúrate de instalarlas utilizando Swift Package Manager (SPM) o cualquier otro gestor de dependencias que hayas configurado.

## Configuración

1. **Configura las variables de entorno:**

    Asegúrate de que la URL de la API esté configurada correctamente en el proyecto. Esto se puede hacer editando los valores en tu código Swift o utilizando un archivo de configuración específico si se ha implementado.

    ```swift
    let apiURL = "https://tu-api-url.com"
    ```

## Ejecución

1. **Ejecuta la aplicación:**

    Selecciona un simulador o un dispositivo real en Xcode y haz clic en el botón de "Run" (`⌘R`) para compilar y ejecutar la aplicación.

## Uso

- **Añadir Categorías:** Navega a la vista de añadir categorías y proporciona un nombre para la nueva categoría.
- **Añadir Recordatorios:** Selecciona una categoría y añade un nuevo recordatorio con el título y la descripción deseados.
- **Ver Recordatorios:** Visualiza la lista de recordatorios organizados por categorías en la vista principal.

## Estructura del Proyecto

- **AddCategoryView.swift:** Vista para añadir nuevas categorías.
- **AddReminderView.swift:** Vista para añadir nuevos recordatorios.
- **ReminderListView.swift:** Vista que muestra la lista de recordatorios organizados por categorías.
- **EmailService.swift:** Servicio para manejar el envío de correos electrónicos.
- **PersistenceController.swift:** Controlador para manejar la persistencia de datos localmente.

## Contribuciones

Si deseas contribuir a este proyecto, por favor sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una rama para tu nueva funcionalidad (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza los cambios y haz commit de ellos (`git commit -am 'Añadir nueva funcionalidad'`).
4. Haz push a la rama (`git push origin feature/nueva-funcionalidad`).
5. Abre un Pull Request.
