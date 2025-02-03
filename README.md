# catbreeds App

Catbreeds es una aplicación que permite buscar y listar gatos, mostrando información detallada de cada uno. La aplicación está desarrollada en Flutter y utiliza Riverpod para la gestión del estado.

## Características

- **Pantalla de carga (SplashScreen)**: Muestra una animación de opacidad mientras se cargan los recursos necesarios y luego navega a la página de lista de gatos.
- **Lista de gatos (CatListPage)**: Muestra una lista de gatos, permitiendo buscar gatos específicos mediante un campo de búsqueda.
- **Tarjeta de gato (CatCard)**: Muestra una tarjeta con información de un gato, incluyendo su nombre, imagen, origen e inteligencia.
- **Barra de búsqueda personalizada (CustomSearchBar)**: Permite al usuario ingresar texto para realizar búsquedas.

## Estructura del Proyecto

### Widgets

#### SplashScreen

```dart
/// \[SplashScreen\] Página de pantalla de carga.
///
/// Esta página muestra una animación de opacidad mientras se cargan los recursos
/// necesarios y luego navega a la página de lista de gatos.
///
/// \[_opacity\]: Nivel de opacidad de la animación.
/// \[_loadResourcesAndNavigate\]: Método que carga los recursos y navega a la siguiente página.
```

### CatListPage
```dart 
/// \[CatListPage\] Página de lista de gatos.
///
/// Esta página muestra una lista de gatos, permitiendo buscar gatos
/// específicos mediante un campo de búsqueda.
///
/// \[searchQuery\]: Cadena de búsqueda para filtrar los gatos.
/// \[_focusNode\]: Nodo de enfoque para el campo de búsqueda.
```

### CatCard
```dart
/// \[CatCard\] Widget que muestra una tarjeta con información de un gato.
///
/// Este widget presenta una tarjeta que incluye el nombre del gato,
/// su imagen, origen e inteligencia. Al hacer clic en el nombre del gato,
/// se navega a la página de detalles del gato.
///
/// \[cat\]: Instancia de la clase \[Cat\] que contiene los datos del gato.
```

### CustomSearchBar
```dart
/// \[CustomSearchBar\] Widget que muestra una barra de búsqueda personalizada.
///
/// Este widget presenta una barra de búsqueda que permite al usuario
/// ingresar texto para realizar búsquedas. Incluye un botón de búsqueda
/// que ejecuta la función de búsqueda proporcionada.
///
/// \[onSearch\]: Función que se ejecuta cuando se realiza una búsqueda.
/// \[focusNode\]: Nodo de enfoque para el campo de búsqueda.
```
## Casos de Uso
### GetCats
```dart
/// Esta clase implementa el caso de uso para obtener una lista de gatos
/// desde el repositorio de datos.
///
/// \[repository\]: Instancia del repositorio de gatos.
///
/// Métodos:
/// - \[call\]: Ejecuta el caso de uso para obtener la lista de gatos.
```

### GetCatsFilter
```dart
/// Esta clase implementa el caso de uso para obtener una lista filtrada de gatos
/// desde el repositorio de datos.
///
/// \[repository\]: Instancia del repositorio de gatos.
///
/// Métodos:
/// - \[call\]: Ejecuta el caso de uso para obtener la lista filtrada de gatos.
```
## Instalación
Clona el repositorio:
git clone https://github.com/renteriajhony/catbreeds.git
* Navega al directorio del proyecto: ```bash cd catbreeds```
* Instala las dependencias: ```dart flutter pub get```
* Configura las variables de entorno en `assets/.env.`
## Ejecución
Para ejecutar la aplicación en un dispositivo o emulador, usa el siguiente comando:
```dart flutter run```