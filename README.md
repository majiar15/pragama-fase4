# Store Design System

Store Design System es una sistema de diseño para construir un ecomerce Flutter, creada para mantener la consistencia y la eficiencia en el desarrollo de aplicaciones móviles.

## Tabla de Contenidos

1. [Instalación](#instalación)
2. [Uso](#uso)
   - [Fundaciones](#fundaciones)

     - [Colores](#colores)
     - [Tamaños](#tamaños)
     - [Espaciado](#espaciado)
     - [Tipografía](#tipografía)

   - [Átomos](#atomos)

     - [Button](#boton)
     - [Image](#image)
     - [input](#input)
     - [nav item](#nav_item)
     - [sort button](#sort_button)
     - [filter button](#filter_button)
     - [star](#star)
     - [textArea](#text_area)

   - [Moléculas](#moléculas)
     - [AppBarMolecule](#appbar)
     - [BannerTrendingProductsMolecule](#banner_trending_products)
     - [FilterMenuMolecule](#filter_menu)
     - [list star](#list_start)
     - [menu inferior](#bottom_navigation_bar)
     - [sort menu](#sort_menu)

   - [Organismos](#organismos)
     - [item de carrito](#card_cart)
     - [card](#card)
     - [card pequeña](#card_small)
     - [lista ordenamiento](#filter_sort)

   - [Templates](#templates)
   - [pages](#paginas)

## Instalación

Para usar el Store Design System en tu proyecto Flutter, sigue estos pasos:

1. Agrega la dependencia en tu `pubspec.yaml`:
   ```yaml
   dependencies:
     store_design_system:
       git:
         url: https://github.com/majiar15/pragama-fase4.git
         ref: main
   ```

2. Ejecuta el comando `flutter pub get` para instalar las dependencias.

## Uso

### Fundations

#### Colores
esta es una clase estática que contiene la paleta de colores del sistema de diseño

1. ejemplo
```dart
import 'package:store_design_system/foundations/colors_foundation.dart';

Container(
  color: StoreColorsFoundation.primaryColor,
  child: Text('Texto con color primario'),
);
```

2. Propiedades
    - primaryColor
    - secondaryColor
    - darkSecondaryColor
    - onPrimaryColor
    - onSecondaryColor
    - backgroundColor
    - darkBackgroundColor
    - surfaceColor
    - onSurfaceColor
    - textColor
    - textPrimary
    - textEmphasize
    - textHint
    - textDisabled
    - lightTextColors
    - inputFillColor
    - errorColor
    - onErrorColor
    - successColor
    - successLight
    - successDark
    - warningColor
    - warningLight
    - warningDark
    - infoColor
    - infoLight
    - infoDark
    - goldColor


#### Tamaños

esta es una clase estática que contiene tamaños de padding, margin entre otros.

1. ejemplo
    ```dart
    import 'package:store_design_system/foundations/sizes_foundation.dart';

    Container(
    margin: EdgeInsets.all(StoreSizesFoundation.marginM),
    padding: EdgeInsets.all(StoreSizesFoundation.paddingM),
    child: Text('Texto con márgenes y padding medios'),
    );
    ```
2. Propiedades
    - paddingS
    - paddingM
    - paddingL
    - paddingXL
    - marginS
    - marginM
    - marginL
    - marginXL
    - heightXS
    - heightS
    - heightM
    - heightL
    - heightXL
    - widthXS
    - widthS
    - widthM
    - widthL
    - widthXL
    - borderRadiusS
    - borderRadiusM
    - borderRadiusL
    - borderRadiusSL
    - borderRadiusXL
    - elevationLow
    - elevationMedium
    - elevationHigh
    - elevationExtraHigh

#### Espaciado
esta es una clase estática que contiene tamaños definidos de espaciados.

1. ejemplo
    ```dart
    import 'package:store_design_system/foundations/spacing_foundation.dart';

    SizedBox(height: StoreSpacingFoundation.md);
    ```
2. propiedades
    - xxs
    - xs
    - s
    - sl
    - md
    - lg
    - xl
    - xxl
#### Tipografía
esta es una clase estática que contiene propiedades de los textos
1. ejemplo
```dart
import 'package:store_design_system/foundations/typography_foundation.dart';

Text(
  'Texto con tipografía personalizada',
  style: TextStyle(
    fontFamily: StoreTypographyFoundation.familyHeadings,
    fontSize: StoreTypographyFoundation.fontSizeH3,
    fontWeight: StoreTypographyFoundation.fontWeightBold,
  ),
);
```
2. propiedades
    - familyHeadings
    - familyBody
    - fontSizeH6
    - fontSizeH5
    - fontSizeH4
    - fontSizeH3
    - fontSizeH2
    - fontSizeH1
    - fontSizeBodyText
    - fontSizeLabel
    - fontSizeLink
    - fontSizeSmall
    - fontSizeXSmall
    - fontSizeUpSmall
    - fontWeightLight
    - fontWeightRegular
    - fontWeightMedium
    - fontWeightBold
    - lineHeightSmall
    - lineHeightMedium
    - lineHeightLarge

### atomos

#### boton

El widget `ButtonAtom` permite crear botones fácilmente.


1. ejemplo
    ```dart
    ButtonAtom(
        label: label,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        textColor: textColor,
        size: size,
        borderRadius: borderRadius,
    ),
    ```
2. propiedades
    - label -> String
    - onPressed -> VoidCallback
    -  backgroundColor -> Color?
    -  textColor -> Color?
    -  fontSize -> double?
    -  padding -> EdgeInsetsGeometry?
    -  borderRadius -> double?
    -  size -> Size?

#### Image

El widget `ImageAtom` muestra una Imagen alojada en un servidor

1. ejemplo

```dart
const SizedBox(
    width: 200,
    child: ImageAtom(
    src:"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    fit: BoxFit.cover,
    ),
),
```
2. propiedades
    - src  -> String
    - fit ->  BoxFit?

#### input

El widget `InputAtom` ayuda a construir input con un diseño estándar definido.

1. ejemplo

```dart
 InputAtom(
    label: 'Username',
    iconData: Icons.person,
    controller: _usernameController,
),
```

2. propiedades 
    - label -> String
    - iconData -> IconData?
    - controller -> TextEditingController
    - keyboardType -> TextInputType
    - isPassword -> bool
    - decoration -> InputDecoration
    - onChanged -> ValueChanged<String>

#### nav_item

El widget `NavigationItemAtom` representa un ícono de navegación con etiqueta para ser usado en una barra de navegación inferior.
1. ejemplo

```dart
const NavigationItemAtom(
  icon: Icons.home,
  label: 'Home',
),
```
2. propiedades 
    - icon -> IconData
    - label -> String

#### sort_button

El widget `SortButtonAtom` muestra un botón de ordenación con texto y un ícono.

1. ejemplo

```dart
SortButtonAtom(
  onTap: () { },
),

```
2. propiedades
    - onTap -> VoidCallback

#### filter_button

El widget `FilterButtonAtom` muestra un botón de filtro con texto y un ícono.

1. ejemplo

```dart
FilterButtonAtom(
  onTap: () { },
),

```
2. propiedades
    - onTap -> VoidCallback

#### star

El widget `StarAtom` muestra un ícono de estrella con opciones de personalización del color y tamaño.



1. ejemplo

```dart
StarAtom(
  backgroundColor: StoreColorsFoundation.goldColor,
  size: 24,
),


```
2. propiedades
    - backgroundColor -> Color?
    - size -> double?


#### text_area

El widget TextAreaAtom muestra un área de texto con un ícono y una etiqueta descriptiva.



1. ejemplo

```dart
TextAreaAtom(
  iconData: Icons.comment,
  label: 'Comentario',
  controller: TextEditingController(),
)
```
2. propiedades
    - iconData -> IconData
    - label -> String
    - controller -> TextEditingController
    - maxLines -> int


### moléculas

#### AppBar

El widget `AppBarMolecule` muestra una barra de aplicación personalizada con título y acciones.

1. Ejemplo

```dart
AppBarMolecule(
  title: const Text(
    "MY CLOTHING STORE",
    style: TextStyle(
      color: StoreColorsFoundation.textColor,
      fontSize: StoreTypographyFoundation.fontSizeH3,
    ),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {  },
    ),
  ],
),
```
2. propiedades
    - title -> Text
    - actions -> List<Widget>?


#### banner_trending_products


El widget `BannerTrendingProductsMolecule` muestra un banner con productos destacados y un botón para ver todos los productos.

1. Ejemplo

```dart
BannerTrendingProductsMolecule(
  date: "July 2024",
  onTapButon: () {  },
),

```
2. propiedades
    - date -> String
    - onTapButon -> void Function()


#### filter_menu

El widget `FilterMenuMolecule` muestra un menú emergente de filtros con categorías.
1. Ejemplo

```dart
FilterMenuMolecule(
  filterCategories: ["Category 1", "Category 2", "Category 3"],
  onFilterSelected: (selectedCategory) { },
)
```
2. propiedades
    - filterCategories -> List<String>
    - onFilterSelected -> void Function(String)



#### list_start
El widget `ListStarMolecule` muestra una fila de estrellas con un fondo personalizable y un número específico de estrellas activas.

1. Ejemplo

```dart
ListStarMolecule(
  backgroundActiveColor: Colors.yellow,
  backgroundDisableColor: Colors.grey[300]!,
  items: 5,
  rating: 3.5,
),
```
2. propiedades
    - backgroundActiveColor -> Color
    - backgroundDisableColor -> Color
    - size -> double?
    - items -> int
    - rating -> double

#### bottom_navigation_bar
El widget `BottomNavigationBarMolecule` muestra una barra de navegación inferior con íconos de navegación.
1. Ejemplo

```dart
BottomNavigationBarMolecule(
  items: [
    NavigationItemAtom(icon: Icons.home, label: 'Home'),
    NavigationItemAtom(icon: Icons.shopping_cart, label: 'Cart'),
    NavigationItemAtom(icon: Icons.person, label: 'Profile'),
  ],
  currentIndex: 0,
  onTap: (index) { },
),

```
2. propiedades
    - items -> List<NavigationItemAtom>
    - onTap -> ValueChanged<int>
    - currentIndex -> int


#### sort_menu
El widget SortMenuMolecule muestra un menú emergente de opciones de ordenamiento.
1. Ejemplo

```dart
SortMenuMolecule(
  properties: ["Title", "Price", "Reviews"],
  onSortSelected: (selectedOption) { },
),

```
2. propiedades
    - properties -> List<String>
    - onSortSelected -> void Function(String)



### organismos

#### card_cart

El widget `CardCartOrganism` muestra una tarjeta con información del producto en el carrito, permitiendo aumentar o disminuir la cantidad del producto.

1. Ejemplo

```dart
CardCartOrganism(
  product: ProductCartModel(
    title: "Camisa de ejemplo",
    price: 29.99,
    quantity: 2,
    image: "https://via.placeholder.com/100",
  ),
  onIncrease: () { },
  onDecrease: () { },
),
```

2. propiedades
    - product -> ProductCartModel
    - onIncrease -> VoidCallback
    - onDecrease -> VoidCallback


#### Card
El widget `CardOrganism` muestra una tarjeta con información detallada de un producto, incluyendo imagen, título, descripción, precio, descuento, calificación y número de reseñas.

1. Ejemplo

```dart
CardOrganism(
  imageUrl: "https://via.placeholder.com/250",
  title: "Producto de Ejemplo",
  description: "Descripción del producto",
  originalPrice: 59.99,
  discountPercentage: 20,
  rating: 4.5,
  reviews: 150,
  onTapCard: () { },
)
```

2. propiedades
    - imageUrl -> String
    - title -> String
    - description -> String
    - originalPrice -> double
    - discountPercentage -> int?
    - rating -> double
    - reviews -> int
    - onTapCard -> VoidCallback


#### card_small
El widget `CardSmallOrganism` muestra una tarjeta pequeña con información básica de un producto, incluyendo imagen, título, descripción, precio y descuento.


1. Ejemplo

```dart
CardSmallOrganism(
  imageUrl: "https://via.placeholder.com/200",
  title: "Producto Pequeño",
  description: "Descripción breve del producto",
  originalPrice: 39.99,
  discountPercentage: 10,
  onTapCard: () { },
),

```

2. propiedades
    - imageUrl -> String
    - title -> String
    - description -> String
    - originalPrice -> double
    - discountPercentage -> int?
    - onTapCard -> VoidCallback


#### filter_sort
El widget `FilterSortOrganism` muestra una fila con menús desplegables para filtrar y ordenar productos.

1. Ejemplo

```dart
FilterSortOrganism(
  filterCategories: ["Categoría 1", "Categoría 2", "Categoría 3"],
  onSortSelected: (selectedSort) {  },
  onFilterSelected: (selectedFilter) {  },
)
```

2. propiedades
    - filterCategories -> List<String>
    - onSortSelected -> void Function(String)
    - onFilterSelected -> void Function(String)


## Templates

![Templates](/assets/videoTemplate.gif)
## Paginas
Las paginas son instancias de las templates, es decir que las paginas serán creadas por el usuario final

