# Outfit Check
Tu armario virtual. Visualiza tus prendas de ropa en una aplicación. Filtra por su nombre, consulta los detalles, todo lo que necesites saber de tu ropa.

## Implementación
La aplicación se ha implementado con Storyboard. La idea es que partimos de un item `Prenda` el cual dispondremos en forma de tabla o colección según la pestaña en la que estemos gracias a un Tap Bar Controller.

En la vista de **armario** veremos una tabla con todas nuestras prendas de ropa y podemos buscar por nombre de la prenda con la barra de búsqueda. Al pulsar una prenda nos llevará a la pantalla de detalle de ésta. Esta vista la controla `ArmarioController` y para la personalización de la celda de la tabla tenemos `ArmarioViewCell`.

En la vista de **galería** podemos ver todas las imágenes de todas las prendas que tenemos en la aplicación. Al pulsar en una imagen también nos lleva al detalle de la prenda. Esta vista la controla `GaleriaController` y para la personalización de la foto tenemos `GaleriaViewCell`.

El detalle de la prenda lo lleva `PrendaController`.

En `Assets` tenemos todas las imagenes de las prendas.
Tengo una classe `Throttler` pensada para que al buscar con la `Search Bar` lo haga según cuantos caracteres hemos introducidos, para que la aplicación no cambie la tabla a cada letra.

### Controladores
La aplicación cuenta con:
- un modelo de datos: `Prenda`
- un `Tap Bar Controller`
- un `Navigation Controller`
- un `TableView Controller`
-- con celdas personalizadas
- un `CollectionView Controller`
- `segues` que conectan a la pantalla detalle de la prenda de ropa y nos permiten navegar

## Otros
Si hay algún problema con el proyecto que se entrega por Moodle, s epuede consultar el repositorio que lo contiene: [OutfitCheck en GitHub](https://github.com/solsolet/OutfitCheck.git).