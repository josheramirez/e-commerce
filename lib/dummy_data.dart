import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce/features/personalization/models/address_model.dart';
import 'package:e_commerce/features/shop/controllers/cart_controller.dart';
import 'package:e_commerce/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/features/shop/models/brand_category_model.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/models/feedback_model.dart';
import 'package:e_commerce/features/shop/models/order_model.dart';
import 'package:e_commerce/features/shop/models/post_model.dart';
import 'package:e_commerce/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce/features/shop/models/product_category_model.dart';
import 'package:e_commerce/features/shop/models/product_market_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/models/product_variation_model.dart';
import 'package:e_commerce/features/shop/models/store_model.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class DummyData {
  
  // User
  static final UserModel user = UserModel(
    id: 'user_0',
    firstName: 'Jose',
    lastName: 'Ramirez',
    username: '1234',
    email: "joseinformatico2015@gmail.com",
    phoneNumber: '1234565767',
    profilePicture: '',
  );

  static final List<UserModel> users = [
    UserModel(
      id: 'users_0',
      firstName: 'Jose',
      lastName: 'Ramirez',
      username: 'ADMIN',
      email: "joseinformatico2015@gmail.com",
      phoneNumber: '12345657678',
      profilePicture:
          'https://firebasestorage.googleapis.com/v0/b/flutter-backend-808a3.firebasestorage.app/o/User%2FImages%2FProfile%2Fstormtropper.png?alt=media&token=bec0fbef-7cc7-4280-af53-08286c6506d1',
    ),
    UserModel(
      id: 'users_1',
      firstName: 'Kathy',
      lastName: 'Berrios',
      username: '1234',
      email: "gatitaSexy@gmail.com",
      phoneNumber: '1234565767',
      profilePicture: '',
    ),
    UserModel(
      id: 'users_2',
      firstName: 'CopiaRock',
      lastName: 'Service',
      username: '1234',
      email: "muni202234@gmail.com",
      phoneNumber: '1234565767',
      profilePicture: '',
    ),
  ];

  /// Categories
  static final List<CategoryModel> categories = [
    /// Parent Categories
    CategoryModel(
      id: '1',
      name: 'Warhammer',
      image: Images.warhammer,
      isFeatured: true,
      banner: Images.homeBanner1
    ),
    CategoryModel(
      id: '2',
      name: 'Pokemon',
      image: Images.pokemon,
      isFeatured: true,
      available: false,
      banner: Images.homeBanner4
    ),
    CategoryModel(
      id: '3',
      name: 'One Piece',
      image: Images.onePiece,
      isFeatured: true,
      available: false
    ),
    CategoryModel(
      id: '4', 
      name: 'Lego', 
      image: Images.lego, 
      isFeatured: true
    ),
    CategoryModel(
      id: '17',
      name: 'Cute Toy',
      image: Images.dubuDuduCategory,
      isFeatured: true,
      available: true
    ),
    CategoryModel(
      id: '5',
      name: 'Hotwheels',
      image: Images.hotwheels,
      isFeatured: true,
      available: false
    ),
    CategoryModel(
      id: '6',
      name: 'Dudu & Bubu',
      image: Images.duduBubuBrand,
      isFeatured: true,
      available: false
    ),
    CategoryModel(
      id: '7',
      name: 'Gamer',
      image: Images.gamming,
      isFeatured: true,
    ),
    CategoryModel(
      id: '9', 
      name: 'Toys', 
      image: Images.toys,
      isFeatured: true,
      available: false
      ),
    CategoryModel(
      id: '10',
      name: 'Tools',
      image: Images.modelTools,
      isFeatured: true,
      available: true
    ),
    CategoryModel(
      id: '11',
      name: 'Electronica',
      image: Images.gamming,
      isFeatured: true,
      available: false
    ),
    CategoryModel(
      id: '12', 
      name: 'Tcg', 
      image: Images.tcg, 
      isFeatured: true,
      available: false
    ),

    CategoryModel(
      id: '13',
      name: 'Keycaps',
      image: Images.keycapCategory,
      isFeatured: true,
      available: true
    ),
    CategoryModel(
      id: '14',
      name: 'Bubu & Dudu',
      image: Images.dubuDuduCategory,
      isFeatured: true,
      available: false
    ),

    /// Pokemon
    CategoryModel(
      id: '15',
      name: 'Pokemon',
      image: Images.pokemonCategory,
      isFeatured: true,
      available: false
    ),
    CategoryModel(
      id: '16',
      name: 'One Piece TCG',
      image: Images.onePieceTcgBrand,
      parentId: '12',
      isFeatured: false,
      available: true
    ),


  ];

  // BrandCategory
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(categoryId: '1', brandId: '1'),  // Warhammer - Warhammer

    BrandCategoryModel(categoryId: '4', brandId: '5'),  // Lego - one piece 
    BrandCategoryModel(categoryId: '4', brandId: '7'),  // Lego - star wars
    BrandCategoryModel(categoryId: '4', brandId: '14'), // Lego - naruto
    BrandCategoryModel(categoryId: '4', brandId: '20'), // Lego - slam dunk
    BrandCategoryModel(categoryId: '4', brandId: '15'), // Lego - saint seiya
    BrandCategoryModel(categoryId: '4', brandId: '16'), // Lego - jujutsu
    BrandCategoryModel(categoryId: '4', brandId: '17'), // Lego - warcraft

    BrandCategoryModel(categoryId: '7', brandId: '19'), // Gamer - Electronica

    BrandCategoryModel(categoryId: '10', brandId: '13'), // Tools - Model Tool

    BrandCategoryModel(categoryId: '13', brandId: '21'), // Keycaps - Pokemon

    BrandCategoryModel(categoryId: '17', brandId: '3'), // Cute Toy - Dudu Bubu
    BrandCategoryModel(categoryId: '17', brandId: '6'), // Cute Toy - Dudu Bubu

 // Pokemon - Pokemon

    // BrandCategoryModel(categoryId: '3', brandId: '5'), // One Piece - OnePieceToy

    // BrandCategoryModel(categoryId: '3', brandId: '11',), // One Piece - OnePieceToy


    // BrandCategoryModel(categoryId: '5', brandId: '4'), // Hotwheel - Hotwheel

    // BrandCategoryModel(categoryId: '12', brandId: '11'), // Tcg - One Piece Tcg
    // BrandCategoryModel(categoryId: '12', brandId: '12'), // Tcg - Pokemon Tcg
  ];

  // ProductCategory
  static final List<ProductCategoryModel> productCategory = [
    
    // Warhammer
    ProductCategoryModel(categoryId: '1', productId: '11'),
    ProductCategoryModel(categoryId: '1', productId: '3'),
    ProductCategoryModel(categoryId: '1', productId: '5'),
    ProductCategoryModel(categoryId: '1', productId: '6'),

    // Lego
    ProductCategoryModel(categoryId: '4', productId: '8'),
    ProductCategoryModel(categoryId: '4', productId: '37'),
    ProductCategoryModel(categoryId: '4', productId: '9'),
    ProductCategoryModel(categoryId: '4', productId: '62'),
    ProductCategoryModel(categoryId: '4', productId: '69'),
    ProductCategoryModel(categoryId: '4', productId: '70'),
    ProductCategoryModel(categoryId: '4', productId: '10'),

    // Gamer
    ProductCategoryModel(categoryId: '7', productId: '54'),
    ProductCategoryModel(categoryId: '7', productId: '55'),

    // Tool
    ProductCategoryModel(categoryId: '10', productId: '14'),
    ProductCategoryModel(categoryId: '10', productId: '72'),
    ProductCategoryModel(categoryId: '10', productId: '81'),
    ProductCategoryModel(categoryId: '10', productId: '82'),

    // Keycaps
    ProductCategoryModel(categoryId: '13', productId: '60'),
    ProductCategoryModel(categoryId: '13', productId: '64'),
    ProductCategoryModel(categoryId: '13', productId: '66'),
    ProductCategoryModel(categoryId: '13', productId: '61'),

    // Cute Toy
    ProductCategoryModel(categoryId: '17', productId: '83'),
    ProductCategoryModel(categoryId: '17', productId: '84'),
  ];

  /// List of all Banners
  static final List<BannerModel> banners = [
    // BannerModel(imageUrl: Images.homeBanner0, targetScreen: Routes.order, active: true),
    BannerModel(
      imageUrl: Images.homeBanner1,
      targetScreen: Routes.order,
      active: true,
    ),
    BannerModel(
      imageUrl: Images.homeBanner2,
      targetScreen: Routes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: Images.homeBanner3,
      targetScreen: Routes.wishlist,
      active: true,
    ),
    BannerModel(
      imageUrl: Images.homeBanner4,
      targetScreen: Routes.wishlist,
      active: true,
    ),
  ];

  /// List of all Brands
  static final List<BrandModel> brands = [
    // 0
    BrandModel(
      id: '1',
      image: Images.warhammerBrandLogo,
      name: 'Warhammer',
      productsCount: 20,
      isFeatured: true,
    ),
    // BrandModel(
    //   id: '2',
    //   image: Images.legoBrandLogo,
    //   name: 'Lego',
    //   productsCount: 100,
    //   isFeatured: true,
    // ),
    
    // 1 
    BrandModel(
      id: '3',
      image: Images.duduBubuBrand,
      name: 'Bubu & Dudu',
      productsCount: 2,
      isFeatured: true,
    ),
    // 2
    BrandModel(
      id: '4',
      image: Images.hotwheelsBrandLogo,
      name: 'Hotwheels',
      productsCount: 30,
      isFeatured: true,
    ),
    // 3
    BrandModel(
      id: '5',
      image: Images.onePieceBrandLogo,
      name: 'One Piece',
      productsCount: 10,
      isFeatured: true,
    ),
    // 4
    BrandModel(
      id: '6',
      image: Images.pokemonBrandLogo,
      name: 'Pokemon',
      productsCount: 30,
      isFeatured: true,
    ),
    // 5
    BrandModel(
      id: '7',
      image: Images.starWarsBrandLogo,
      name: 'Star Wars',
      productsCount: 100,
      isFeatured: true,
    ),
    // BrandModel(
    //   id: '8',
    //   image: Images.dungeonsAndDragonsBrand,
    //   name: 'Dungeons & Dragons',
    //   productsCount: 100,
    //   isFeatured: true,
    // ),
    // 6
    BrandModel(
      id: '9',
      image: Images.nvidiaBrandLogo,
      name: 'Nvidia',
      productsCount: 1,
      isFeatured: true,
    ),
    // 7
    BrandModel(
      id: '10',
      image: Images.radeonBrandLogo,
      name: 'Radeon',
      productsCount: 1,
      isFeatured: true,
    ),
    // BrandModel(
    //   id: '11',
    //   image: Images.onePieceTcgBrand,
    //   name: 'One Piece TCG',
    //   productsCount: 10,
    //   isFeatured: true,
    // ),
    // BrandModel(
    //   id: '12',
    //   image: Images.pokemonTcgBrand,
    //   name: 'Pokemon TCG',
    //   productsCount: 20,
    //   isFeatured: true,
    // ),

    // 8
    BrandModel(
      id: '13',
      image: Images.modelToolBrand,
      name: 'Model Tool',
      productsCount: 5,
      isFeatured: true,
    ),

    // 9
    BrandModel(
      id: '14',
      image: Images.narutoBrand,
      name: 'Naruto',
      productsCount: 10,
      isFeatured: true,
    ),
    // 10
    BrandModel(
      id: '20',
      image: Images.slamDunkBrand,
      name: 'Slam Dunk',
      productsCount: 10,
      isFeatured: true,
    ),
    // 11
    BrandModel(
      id: '15',
      image: Images.saintSeiyaBrand,
      name: 'Saint Seiya',
      productsCount: 10,
      isFeatured: true,
    ),
    // 12
     BrandModel(
      id: '16',
      image: Images.jujutsuKaisenBrand,
      name: 'Jujutsu Kaisen',
      productsCount: 10,
      isFeatured: true,
    ),
    // 13
     BrandModel(
      id: '17',
      image: Images.warcraft,
      name: 'Warcraft',
      productsCount: 2,
      isFeatured: true,
    ),
    // 14
     BrandModel(
      id: '18',
      image: Images.hunterxhunter,
      name: 'Hunter x Hunter',
      productsCount: 2,
      isFeatured: true,
    ),

     // 15
     BrandModel(
      id: '19',
      image: Images.gamming,
      name: 'Perifericos',
      productsCount: 2,
      isFeatured: true,
    ),

     // 16
     BrandModel(
      id: '21',
      image: Images.keycapCategory,
      name: 'The Keycap Company',
      productsCount: 2,
      isFeatured: true,
    ),
  ];

  /// List of all products
  static final List<ProductModel> products = [
    
    // [WARHAMMER]
    
    // 001
    ProductModel(
      id: '1',
      title: 'Imperial Champion Black Templar',
      stock: 10,
      price: 10000,
      thumbnail: Images.productImage1,
      images: [
        Images.productImage1b,
        Images.productImage1c,
        Images.productImage1d,
        Images.productImage1e,
      ],
      description:
          "Este glorioso guerrero está equipado con una espada y una armadura que son reliquias. Es un consumado maestro del combate que se abre paso entre las filas enemigas en busca de un adversario digno de él. Ten en cuenta que puedes montar esta miniatura con el escudo o con el estandarte. Miniatura de resina de alta calidad a escala Primaris con peana escénica de 32 mm.Las miniaturas requieren montaje y pintura (utiliza únicamente superpegamento de cianoacrilato).",
      brand: brands[0],
      salePrice: 0,
      sku: 'A915',
      categoryId: '1',
      productType: 'ProductType.single',
    ),

    // 002
    ProductModel(
      id: '2',
      title: 'Primaris Lieutenant with Storm Shield',
      stock: 15,
      price: 12000,
      isFeatured: true,
      thumbnail: Images.productImage2,
      description:
          'Teniente Primaris de los Marines Espaciales con escudo de tormenta, una miniatura de edición limitada lanzada como parte de la Serie Conmemorativa de Warhammer de Games Workshop.\nPresentada originalmente durante las celebraciones del Warhammer Day el 30 de octubre de 2021, esta pieza de coleccionista altamente codiciada presenta características de escultura distintivas que la diferencian de los kits multicomponente estándar. ',
      brand: brands[0],
      salePrice: 10000,
      sku: 'ZC-2243',
      categoryId: '1',
      productType: 'ProductType.single',
    ),

    // 003
    ProductModel(
      id: '3',
      title: 'Legion Praetor with Power Axe',
      stock: 15,
      price: 15000,
      isFeatured: false,
      thumbnail: Images.productImage3,
      description:
          'Los pretores son los guerreros y líderes de batalla más poderosos de las Legiones de Marines Espaciales, solo superados en habilidad marcial y capacidad de mando por los Primarcas, seres casi divinos. Entre sus filas se encuentran maestros de capítulo y señores comandantes, capitanes y kanes, herreros de guerra y jarls, según las tradiciones de sus Legiones. Cada uno es un guerrero y señor de la guerra de vasta experiencia que ha forjado su propia leyenda con sangre, y porta en batalla el mejor equipo y armamento conocido por la humanidad, liderando huestes que han conquistado innumerables mundos. Este kit de plástico multicomponente permite construir un Pretor de Legión.',
      brand: brands[0],
      salePrice: 10000,
      sku: 'A1319',
      categoryId: '1',
      productType: 'ProductType.single',
    ),

    // 004
    ProductModel(
      id: '4',
      title: 'SPACE MARINES PRIMARIS AGGRESSORS ',
      stock: 2,
      price: 15000,
      isFeatured: true,
      thumbnail: Images.productImage4,
      description:
          'Ataviados con pesadas armaduras Gravis, las escuadras de Aggressors avanzan hacia el enemigo como fortalezas de ceramita andantes. Son más móviles que algunos otros Space Marines y más capaces de atravesar terrenos problemáticos, lo que los hace versátiles; aunque suelen usarse en circunstancias o terrenos concretos, las escuadras de Aggressors también sirven como reservas para cerrar brechas en las líneas de combate o como punta de lanza en el avance. El alcance de su armamento no es muy largo, pero cuando se acercan lo suficiente como para abrir fuego, el resultado es un brutal barrido con balas de alto calibre capaz de hacer añicos una carga enemiga. Este kit de plástico multicomponente contiene las piezas necesarias para montar una escuadra de tres Primaris Aggressors.',
      brand: brands[0],
      sku: 'WAR01',
      categoryId: '1',
      productType: 'ProductType.single',
    ),

    // 005
    ProductModel(
      id: '5',
      title: 'Warpsmiths',
      stock: 1,
      price: 10000,
      isFeatured: false,
      thumbnail: Images.productImage5,
      description:
          'Armados con conocimientos prohibidos sobre los misterios más profundos de la máquina, los Herreros de la Disformidad (Warpsmiths) mantienen el arsenal de vehículos acorazados de su partida de guerra, potenciando los motores mediante cánticos de código corrompido. Fusionados con un nido retorcido de mecatentáculos semi-sintientes, no solo buscan emplear la tecnología para sus fines diabólicos, sino someterla por completo. Este kit de plástico multicomponente permite montar un Herrero de la Disformidad.',
      brand: brands[0],
      sku: 'ZC2210',
      categoryId: '1',
      productType: 'ProductType.single',
    ),

    // 006
    ProductModel(
      id: '6',
      title: 'Heresy Hunter Dominator Mechanic',
      stock: 0,
      price: 15000,
      thumbnail: Images.productImage6,
      description:
          'Un implacable ejecutor de la pureza que imparte justicia mediante la fusión con la maquinaria.La miniatura «Heresy Hunter Dominator Mechanic» de Wargame Exclusive es una pieza central de estética sombría y tecnogótica, diseñada para universos de ciencia ficción oscura. Con sus complejos implantes y detalles siniestros, este modelo es ideal para aficionados expertos, jugadores centrados en la narrativa o coleccionistas que busquen una imponente fusión de carne y maquinaria.',
      brand: brands[0],
      salePrice: 10000,
      sku: 'A926',
      categoryId: '1',
      productType: 'ProductType.single',
    ),

    // 007
    ProductModel(
      id: '7',
      title: 'Horus Ascended',
      stock: 2,
      price: 60000,
      isFeatured: true,
      thumbnail: Images.productImage7,
      //16/512
      description:
          "Este kit de resina minuciosamente detallado permite montar a Horus Ascendido, tal y como aparece al final de la Herejía de Horus. Puedes incluir a Horus en tus partidas de *Warhammer: The Horus Heresy* como Primarca de tu ejército de los Hijos de Horus Traidores. En el juego, su destreza marcial lo hace prácticamente invencible en duelo, obligando a tu oponente a modificar sus planes para hacer frente a la amenaza que representa. No hay nada a lo que no pueda enfrentarse, desde hordas de infantería pesada hasta las máquinas de guerra más colosales. También puede utilizarse como Horus Lupercal, ya que porta la misma armadura y el mismo equipo característicos, aunque sutilmente alterados por su poder. La miniatura se alza sobre una peana escénica totalmente esculpida —un montón de cadáveres, miembros cercenados de Marines Espaciales y un estandarte derribado— que evoca la destrucción inimaginable que ha desatado sobre la galaxia. La peana incluye también una base más pequeña y extraíble para su uso en el juego. Horus Ascendido consta de 41 componentes de resina e incluye una peana redonda de 50 mm para jugar, la cual encaja en una peana de exposición redonda de 80 mm. Esta miniatura se suministra sin pintar y requiere montaje; recomendamos utilizar pinturas Citadel Colour. Este kit de modelismo en resina no es un juguete; se trata de un artículo de coleccionismo y su montaje debe ser realizado únicamente por aficionados expertos a Warhammer mayores de 15 años.",
      brand: brands[0],
      salePrice: 30000,
      sku: 'A1323',
      categoryId: '1',
      productType: 'ProductType.single',
    ),

    // 016
    ProductModel(
      id: '16',
      title: 'CHAOS CORSAIR LORD',
      brand: brands[0],
      images: [
        Images.productImage16a,
        Images.productImage16b,
        Images.productImage16c,
      ],
      thumbnail: Images.productImage16a,
      description:
          "Los Corsarios Rojos son un Capítulo renegado y una partida de guerra de Astartes herejes que comandan una vasta flota pirata, compuesta por mortales y otros Marines Traidores, la cual amenaza el tráfico y los mundos imperiales cercanos a la grieta disforme del Maelström en el Segmentum Ultima; una región conocida por los astrocartógrafos imperiales como la Zona del Maelström.",
      price: 10000,
      stock: 1,
      categoryId: '1',
      sku: 'A970',
      productType: 'ProductType.single',
    ),

    // 017
    ProductModel(
      id: '17',
      title: 'Legion Praetor with Power Sword',
      brand: brands[0],
      thumbnail: Images.productImage17,
      description:
          "Los Pretores son los guerreros y comandantes más poderosos de las Legiones de Marines Espaciales; solo los Primarcas, seres semejantes a dioses, los superan en destreza marcial y capacidad de mando. Entre sus filas se cuentan Maestros de Capítulo y Señores Comandantes, capitanes y khans, Maestros de la Forja y jarls, según dictan las tradiciones de sus respectivas Legiones. Cada uno de ellos es un guerrero y caudillo de vasta experiencia que ha forjado su propia leyenda con sangre y que, al frente de huestes que han conquistado innumerables mundos, porta a la batalla el mejor equipo y armamento conocidos por la humanidad.",
      price: 10000,
      stock: 1,
      categoryId: '1',
      sku: 'A1328',
      productType: 'ProductType.single',
    ),

    // 018
    ProductModel(
      id: '18',
      title: 'Tech-Priests Dominus',
      brand: brands[0],
      images: [
        Images.productImage18a,
        Images.productImage18b,
        Images.productImage18c,
      ],
      thumbnail: Images.productImage18a,
      description:
          "Como maestros del Adeptus Mechanicus, los Tech-Priests Dominus poseen un talento prodigioso y una insaciable sed de guerra. Sus mentes se ven inundadas por un flujo constante de información — trayectorias de proyectiles, ángulos óptimos de artillería, capacidad de los paquetes de energía láser — y aprovechan estos datos para sembrar la destrucción entre las filas enemigas con cada orden emitida desde sus cuerpos mejorados cibernéticamente.",
      price: 10000,
      stock: 1,
      categoryId: '1',
      sku: '99070116005',
      productType: 'ProductType.single',
    ),

    // 019
    ProductModel(
      id: '19',
      title: 'Belisarius Cawl',
      brand: brands[0],
      images: [Images.productImage19a, Images.productImage19b],
      thumbnail: Images.productImage19a,
      description:
          "El Archimagos Dominus Belisarius Cawl ya era anciano en los albores del Imperio, hace más de diez mil años. A lo largo de los siglos, este Tecnosacerdote ha servido como Señor de la Fragua, Lexico Arcanus y renombrado Magos Biologis. En el campo de batalla, Cawl es una fuerza formidable: se desplaza sin miedo hasta el fragor del combate, evalúa las amenazas y transmite órdenes minuciosamente planificadas a sus tropas. La mayor parte del fuego enemigo es repelida por su campo de fuerza; sin embargo, incluso cuando partes de su cuerpo mecanizado resultan destrozadas, surgen cables que se agitan frenéticamente para efectuar reparaciones inmediatas o para atacar en enjambre a cualquiera que ose acercarse...",
      price: 10000,
      stock: 1,
      categoryId: '1',
      sku: '99120116032',
      productType: 'ProductType.single',
    ),

    // 020
    ProductModel(
      id: '20',
      title: 'Emperador de la Humanidad',
      brand: brands[0],
      thumbnail: Images.productImage20,
      description:
          "El Emperador es el gobernante supremo del Imperio de la Humanidad, adorado como el Dios Emperador por el Culto Imperial y como el Omnissiah por el Culto Mechanicus. Este ser inmortal nació en la Prehistoria de Terra, y lanzó las Guerras de Unificación y la Gran Cruzada para restablecer los lazos entre las colonias humanas aisladas por la Era de los Conflictos. Sin embargo, la mitad de los Primarcas que creó se rebelaron contra él bajo el mando de su favorito, el Señor de la Guerra Horus, y aunque la cruenta guerra civil conocida como la Herejía de Horus concluyó con la muerte del Architraidor, el Emperador quedó físicamente destrozado y hubo de permanecer conectado para siempre a los sistemas de soporte vital del Trono Dorado, sin poder comunicarse ni reaccionar como un ser vivo. Desde entonces han pasado diez mil años, pero su dominio sigue aplicándose a lo largo y ancho de la galaxia por sus sucesores, los Altos Señores de Terra. ",
      price: 10000,
      stock: 1,
      categoryId: '1',
      sku: '',
      productType: 'ProductType.single',
      size: "60mm",
    ),

    // 021
    ProductModel(
      id: '21',
      title: 'Warlord Blackskull',
      brand: brands[0],
      images: [
        Images.productImage21a,
        Images.productImage21b,
        Images.productImage21c,
        Images.productImage21d,
      ],
      thumbnail: Images.productImage21a,
      description:
          "Jefe de Guerra Blackskull, Un Jefe de Guerra es el Orko más grande, más verde y más feroz de una tribu o clan y, como tal, es el comandante supremo de todos los Pielesverdes bajo su mando. Estrategas relativamente astutos (para los estándares de los Orkos) y guerreros sumamente poderosos, estos brutos ascienden en la jerarquía orka ganando batallas y eliminando a cualquier aspirante que ose desafiar la autoridad del futuro Jefe de Guerra.",
      price: 10000,
      stock: 1,
      categoryId: '1',
      sku: '',
      productType: 'ProductType.single',
      size: "120mm",
    ),

    // 022
    ProductModel(
      id: '22',
      title: 'Overlord with Translocation Shroud',
      brand: brands[0],
      images: [Images.productImage22a, Images.productImage22b],
      thumbnail: Images.productImage22a,
      description:
          "Los Señores Supremos conducen a las dinastías necronas a la batalla. Sus mentes androides son tremendamente veloces y sus cuerpos poseen una resistencia implacable, pero es quizá su voluntad indomable lo más temible de todo. Equipado con un manto de traslación extraído de las cámaras dinásticas, un Señor Supremo puede desplazarse a través de dimensiones abisales, atravesando defensas rígidas e incluso la carne de los guardianes mortales para alcanzar cualquier presa o botín que desee.",
      price: 10000,
      stock: 1,
      categoryId: '1',
      sku: '',
      productType: 'ProductType.single',
      size: "120mm",
    ),
    
    // 011
    ProductModel(
      id: '11',
      title: 'SPACE MARINE DREADNOUGHT',
      stock: 3,
      price: 25000,
      isFeatured: true,
      thumbnail: Images.productImage11a,
      description:
          'Un Dreadnought en Warhammer 40,000 es una imponente y pesada máquina de guerra bípeda pilotada por un Marine Espacial que ha sufrido heridas mortales en combate',
      brand: brands[0],
      images: [
        Images.productImage11b,
        Images.productImage11c,
        Images.productImage11d,
      ],
      sku: 'WAR02',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
          name: 'Model',
          values: [
            'Brutalis Dreadnought',
            'Ballistus Dreadnought',
            'Primaris Redemptor Dreadnought',
          ],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 1,
          salePrice: 10000,
          price: 15000,
          image: Images.productImage11b,
          description:
              'El Brutalis Dreadnought es un rompelíneas y un arma de terror: un andador de combate bípedo, armado para el combate cuerpo a cuerpo y pilotado por un héroe caído de su Capítulo. Esta imponente máquina de guerra desata una lluvia de fuego de cobertura mientras avanza hacia las líneas enemigas, pero la mayor amenaza reside en sus enormes brazos. Equipados con puños aplastantes o garras recubiertas de ceramita, estos pueden aplastar a un guerrero acorazado como si fuera fruta podrida o atravesar la pared de un búnker como si fuera pergamino. Este kit de plástico multicomponente permite construir un Brutalis Dreadnought, una imponente máquina de guerra centrada en el combate cuerpo a cuerpo. ',
          attributeValues: {'Model': 'Brutalis Dreadnought'},
          sku: 'WAR02a',
        ),

        ProductVariationModel(
          id: '2',
          stock: 1,
          price: 25000,
          image: Images.productImage11c,
          description:
              'El Dreadnought Ballistus es una torreta andante. En el interior de un sarcófago blindado, en el corazón de este andador de combate, reposan los restos mortales de un héroe caído del Capítulo. Este guerrero eterno pilota su imponente máquina de guerra mediante una red de enlaces neuronales, apuntando a la armadura enemiga o a la infantería de élite con baterías de devastadoras armas pesadas. Este kit de plástico multicomponente permite construir un Dreadnought Ballistus, una aterradora máquina de guerra repleta de armamento de largo alcance. Este poderoso andador de combate cuenta con bólteres de asalto gemelos montados en su parte frontal y está equipado con un conjunto de cañones láser.',
          attributeValues: {'Model': 'Ballistus Dreadnought'},
          sku: 'WAR02b',
        ),

        ProductVariationModel(
          id: '3',
          stock: 1,
          price: 35000,
          image: Images.productImage11d,
          description:
              'Los Dreadnoughts Redemptor son máquinas de guerra gigantescas que trituran huesos y hacen añicos cráneos mientras se abren paso a golpes entre las filas enemigas. Más altos, anchos y de construcción más ingeniosa que los Dreadnoughts de diseño tradicional, estos colosos del combate funcionan gracias a reactores de hiperdensidad y sofisticados haces de fibra. Son capaces de pasar de una pisada pesada y retumbante a una zancada atronadora que hace temblar el suelo, avanzando a toda velocidad entre lluvias de fuego con un desafío glorioso. El diseño de los enlaces neuronales del Redemptor es tan prodigioso que su piloto, a pesar de estar encerrado en el sarcófago situado en el pecho del Dreadnought, puede controlarlo con una destreza y velocidad sorprendentes.\nEste kit de plástico multicomponente contiene las piezas necesarias para montar un Dreadnought Redemptor Primaris.',
          attributeValues: {'Model': 'Primaris Redemptor Dreadnought'},
          sku: 'WAR02c',
        ),
      ],
      productType: 'ProductType.variable',
    ),

    // [LEGO]
    
    // 008
    ProductModel(
      id: '8',
      title: 'Kisame',
      stock: 2,
      price: 3000,
      thumbnail: Images.productImage8,
      description:
          'En el manga Naruto el personaje Kisame Hoshigaki es un poderoso shinobi renegado de Kirigakure (Aldea Oculta de la Niebla) y miembro de la organización Akatsuki, conocido como el "Monstruo de la Niebla" y el "Bijū sin cola".',
      salePrice: 2500,
      brand: brands[9],
      sku: 'WM2096',
      categoryId: '4',
      productType: 'ProductType.single',
    ),

    // 009
    ProductModel(
      id: '9',
      title: 'Itachi',
      stock: 1,
      price: 3000,
      thumbnail: Images.productImage9,
      description:
          "Itachi Uchiha es un shinobi prodigio de Konoha, miembro del Clan Uchiha, y uno de los personajes más complejos de la serie Naruto.",
      brand: brands[9],
      sku: 'WM2092',
      categoryId: '4',
      productType: 'ProductType.single',
    ),

    // 010
    ProductModel(
      id: '10',
      title: 'Madara',
      brand: brands[9],
      thumbnail: Images.productImage10,
      description:
          "Madara Uchiha (うちはマダラ Uchiha Madara?) es un personaje antagónico de la serie de manga Naruto, escrita e ilustrada por Masashi Kishimoto. Antes del comienzo de la historia llegó a convertirse en la figura principal de su clan, y era una reencarnación de Indra Ōtsutsuki, así como uno de los ninjas más poderosos de todos los tiempos. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: 'WM2094',
      productType: 'ProductType.single',
    ),

    // 023
    ProductModel(
      id: '23',
      title: 'Zetsu',
      brand: brands[9],
      thumbnail: Images.productImage23,
      description:
          "Zetsu (ゼツ Zetsu) es un miembro de Akatsuki y uno de los subordinados más leales de Tobi, pero se conoce muy poco sobre sus habilidades, su origen y sus actuaciones en la organización. Lleva el anillo con el kanji 亥 (Genbu: Tortuga), en el dedo meñique derecho. La mitad negra es conocido como Zetsu Negro (黒ゼツ, Kuro-Zetsu) mientras que la mitad blanca se conoce como Zetsu Blanco (白ゼツ, Shiro-Zetsu). La parte blanca fue creada mediante el uso de las células de Hashirama Senju pero no se sabe de donde proviene la parte negra. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: 'WM2093',
      productType: 'ProductType.single',
    ),

    // 024
    ProductModel(
      id: '24',
      title: 'Deidara',
      brand: brands[9],
      thumbnail: Images.productImage24,
      description: "Deidara (デイダラ, Deidara) Era un miembro de la Organización Akatsuki. Llevaba el anillo 青龍 (せいりゅう, Seiryuu, Dragón azul/verde, Dios del Este y de la Primavera), en el dedo índice derecho. Su compañero era Tobi, aunque antiguamente fue Sasori.",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: 'WM2095',
      productType: 'ProductType.single',
    ),

    // 025
    ProductModel(
      id: '25',
      title: 'Sasori',
      brand: brands[9],
      thumbnail: Images.productImage25,
      description: "Sasori (サソリ), también conocido como Sasori de la Arena Roja (赤 砂 の サソリ, Akasuna no Sasori), era el nieto de Chiyo y miembro de Akatsuki, Tenia como compañero a Deidara y antes a Orochimaru. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: 'WM2085',
      productType: 'ProductType.single',
    ),
    
    // 026
    ProductModel(
      id: '26',
      title: 'Hidan',
      brand: brands[9],
      thumbnail: Images.productImage26,
      description: "Hidan (飛段, Hidan) era un miembro de la Organización Akatsuki. Su compañero era Kakuzu, a pesar de tener aversión mutua el uno al otro. Llevaba el anillo  'Tres' (三, San) en el dedo índice izquierdo. Era el miembro más nuevo de Akatsuki, Kisame se refería peyorativamente a Hidan y Kakuzu como el 'Combo Zombie' (ゾンビコンビ, Zonbi Konbi) debido al hecho de que en cierto sentido, no podían morir. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: 'WM2086',
      productType: 'ProductType.single',
    ),

    // 027
    ProductModel(
      id: '27',
      title: 'Kakuzu',
      brand: brands[9],
      thumbnail: Images.productImage27,
      description: "Kakuzu (角都, Kakuzu) fue un ninja renegado de Takigakure y miembro de Akatsuki. Su compañero fue Hidan. Llevaba el anillo 'Norte' (北, Hoku) en el dedo medio izquierdo. A pesar de la mutua antipatía entre ambos, su trabajo en equipo fue casi perfecto, porque se complementaban mutuamente. Kisame Hoshigaki se refería peyorativamente a Hidan y Kakuzu como el 'Combo Zombie' (ゾンビコンビ, Zonbi Konbi), ya que prácticamente no podían morir.",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: 'WM2087',
      productType: 'ProductType.single',
    ),

    // 028
    ProductModel(
      id: '28',
      title: 'konan',
      brand: brands[9],
      thumbnail: Images.productImage28,
      description: "Konan (小南, Konan) era una kunoichi de Amegakure y único miembro femenino de Akatsuki. Llevaba el anillo 'Blanco' (白, Bya) en el dedo corazón derecho. Después de la muerte de Nagato, ella desertó de la organización y se convirtió en la líder de Amegakure. Poseía un talento natural para el origami. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: 'WM2090',
      productType: 'ProductType.single',
    ),

    // 029
    ProductModel(
      id: '29',
      title: 'Nagato',
      brand: brands[9],
      thumbnail: Images.productImage29,
      description: "Nagato (長門, Nagato), mejor conocido como Pain (ペイン, Pein), era uno de los más poderosos shinobi, y el líder reconocido de Akatsuki y de Amegakure. Todos los miembros de Akatsuki se referían a él como “Líder”, excepto Konan quien lo llamaba por su nombre, Pain. Llevaba el anillo Cero (零, Rei) en el dedo pulgar derecho. También era usuario del dōjutsu legendario, el Rinnegan, que fue dado por Madara Uchiha antes de su muerte e implantado en Nagato cuando solo era un niño. En su estadía en la organización trabajaba con Konan y recibía órdenes de Obito desde las sombras. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: 'WM2091',
      productType: 'ProductType.single',
    ),

    // 030
    ProductModel(
      id: '30',
      title: 'Yahiko',
      brand: brands[9],
      thumbnail: Images.productImage30,
      description: "Yahiko (弥彦, Yahiko) fue el fundador de la organización Akatsuki y perteneció a los Huérfanos de la Lluvia, junto a Nagato y Konan, que fueron entrenados por Jiraiya poco después de la Segunda Guerra Mundial Shinobi. Luego de su muerte, Nagato utilizó el cuerpo de Yahiko para que fuera el Camino Deva de los Seis Caminos del Dolor. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: 'WM2089',
      productType: 'ProductType.single',
    ),
    
    // 031
    ProductModel(
      id: '31',
      title: 'Caballeros dorados, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage31,
      description: "Los Gold Saints (黄金聖闘士, Gōrudo Seinto), también llamados Caballeros Dorados o Caballeros de Oro en el doblaje hispanoamericano del anime y en algunas traducciones oficiales del manga de Saint Seiya, son los guerreros de élite del ejército de Athena, que ostentan con orgullo un rango superior al de los Silver y Bronze Saints. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

     // 032
    ProductModel(
      id: '32',
      title: 'Aiolia de Leo, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage32,
      description: "Aiolia (アイオリア, Aioria) es el Santo de Oro de Leo del siglo XX en el anime y manga Saint Seeya. Es el Santo de Oro que protege la Casa de Leo.",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 033
    ProductModel(
      id: '33',
      title: 'Aiolos de Sagitario, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage33,
      description: "Aiolos (アイオロス, Aiorosu) fue el Santo de Oro de Sagittarius del siglo XX en el anime y manga Saint Seiya. Es el Santo de Oro que protege la Casa de Sagitario.",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 034
    ProductModel(
      id: '34',
      title: 'Milo de Scorpion, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage34,
      description: "Milo (ミロ, Miro) fue el Santo de Oro de Scorpius del siglo XX en el anime y manga Saint Seiya. Es el Santo de Oro que protege la Casa de Escorpio.",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 035
    ProductModel(
      id: '35',
      title: 'Camus de Acuario, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage35,
      description: "Camus (カムス, Kamusu) fue el Santo de Oro de Acuario del siglo XX en el anime y manga Saint Seiya. Es el Santo de Oro que protege la Casa de Acuario.",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 036  
    ProductModel(
      id: '36',
      title: 'Mascara de Muerte Cancer, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage36,
      description: "Deathmask (デスマスク, Desumasuku), comúnmente llamado Máscara de Muerte, Máscara de la Muerte o Máscara Mortal en los doblajes para países de habla hispana, fue el Saint de Cáncer que protegía el Templo del Gran Cangrejo. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 037 
    ProductModel(
      id: '37',
      title: 'Shura de Capricornio, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage37,
      description: "Shura (シュラ, Shura) es el Gold Saint de Capricorn, quien causó las heridas mortales a Aiolos de Sagittarius. Tras su muerte, depositó su alma en Shiryū. En el anime, según el guionista Takao Koyama, él es considerado como el Saint más fiel a la Diosa Atenea, opinión realizada por la disposición que tuvo para matar a Aiolos de Sagittarius. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 038
    ProductModel(
      id: '38',
      title: 'Aldebaran de Tauro, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage38,
      description: "Aldebaran (アルデバラン, Arudebaran) fue el Gold Saint de Taurus hasta su muerte a manos de Niobe de Deep. Después fue revivido por el cosmos de Athena, y se sacrificó con los demás Gold Saints en el Muro de los Lamentos.  ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 039
    ProductModel(
      id: '39',
      title: 'Saga de Gemini, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage39,
      description: "Saga (サガ, Saga) fue el Gold Saint de Géminis y principal antagonista desde la Saga de los Santos Negros hasta la Batalla de los doce templos, justamente por ser el usurpador del Papa del Santuario, con el fin de dominar el mundo y acabar con Saori y sus Santos al manipular al Ejército de Athena. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 040
    ProductModel(
      id: '40',
      title: 'Dohko de Libra, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage40,
      description: "Dohko (童虎, Dōko), también conocido como el Viejo Maestro (老師, Rōshi) fue junto a Shion un Bronze Saint [16] de constelación desconocida durante el siglo XVIII que posteriormente seria promovido a Santo de Libra[16",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 041
    ProductModel(
      id: '41',
      title: 'Mū de Aries, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage41,
      description: "Mū (ムウ, Mū) fue el Santo de Aries durante el siglo XX en el manga y anime Saint Seiya. Es el heredero en el arte en la restauración de las Cloths",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 042
    ProductModel(
      id: '42',
      title: 'Shaka de Virgo, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage42,
      description: "Shaka (シャカ, Shaka) es el Santo de Oro de Virgo en la obra Saint Seiya y protege la Casa de la Virgen en el Santuario. Es considerado por sus aliados como la reencarnación de Buda, pero realmente Buda es su mentor. Posee un poder de observación que le permite conocer la verdad escondida entre las apariencias.",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),
    
    // 043
    ProductModel(
      id: '43',
      title: 'Afrodita de Piscis, Saint Seiya',
      brand: brands[11],
      thumbnail: Images.productImage43,
      description: "Aphrodite (アフロディーテ, Afurodīte) fue el Gold Saint de Pisces hasta su muerte a manos de Shun de Andromeda. Posteriormente fue revivido por Ker siendo muerto junto a Deathmask de Cancer a manos de Rhadamanthys. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    //044
    ProductModel(
      id: '44',
      title: 'Slam Dunk - Equipo Shohoku',
      brand: brands[10],
      thumbnail: Images.productImage44,
      description: "El Instituto Shohoku es el equipo de baloncesto protagonista del famoso manga y anime Slam Dunk, creado por Takehiko Inoue. Está ubicado ficticiamente en la prefectura de Kanagawa, ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),
   
    //046
    ProductModel(
      id: '46',
      title: 'Takenori Akagi - Slam Dunk',
      brand: brands[10],
      thumbnail: Images.productImage46,
      description: "Takenori Akagi (赤木 剛憲Akagi Takenori ) es el capitán del equipo y centro del equipo de baloncesto Shohoku . También es el hermano mayor de Haruko Akagi .",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    //047
    ProductModel(
      id: '47',
      title: 'Hanamichi Sakuragi - Slam Dunk',
      brand: brands[10],
      thumbnail: Images.productImage47,
      description: "Hanamichi Sakuragi (桜木 花道Sakuragi Hanamichi ) es el protagonista principal de la serie Slam Dunk . Juega como ala-pívot (y ocasionalmente como centro suplente) para el equipo de baloncesto de Shohoku High School .",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    //048
    ProductModel(
      id: '48',
      title: 'Kaede Rukawa - Slam Dunk',
      brand: brands[10],
      thumbnail: Images.productImage48,
      description: "Kaede Rukawa (流川 楓Rukawa Kaede ) es la delantera y la jugadora estrella del instituto Shohoku .",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    //049
    ProductModel(
      id: '49',
      title: 'Entrenador Anzai  - Slam Dunk',
      brand: brands[10],
      thumbnail: Images.productImage49,
      description: "Mitsuyoshi Anzai (安西 光義) es el entrenador del equipo de baloncesto de la escuela secundaria Shohoku y uno de los mejores entrenadores de Japón.",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    //050
    ProductModel(
      id: '50',
      title: 'Hisashi Mitsui - Slam Dunk',
      brand: brands[10],
      thumbnail: Images.productImage50,
      description: "Hisashi Mitsui (三井 寿Mitsui Hisashi ) es el escolta del equipo de baloncesto de Shohoku . Aunque estuvo de baja por una lesión de rodilla, aún conserva las habilidades necesarias para llevar al equipo a la victoria.",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    //051
    ProductModel(
      id: '51',
      title: 'Ryota Miyagi - Slam Dunk',
      brand: brands[10],
      thumbnail: Images.productImage51,
      description: "Ryota Miyagi (宮城 リョータ Miyagi Ryōta ) es el mejor amigo de Sakuragi en el equipo. Tras un malentendido inicial que provocó un conflicto entre ellos (él estaba peleando con Mitsui cuando Sakuragi y Ayako aparecieron, y él pensó que ella estaba saliendo con él), ambos encontraron camaradería en el hecho de que ambos habían tenido mala suerte en el amor, aunque Miyagi, al haber sido rechazado solo 10 veces, aún no alcanza el récord de Sakuragi, quien fue rechazado 50 veces.",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    //052
    ProductModel(
      id: '52',
      title: 'Mitsui Pandillero - Slam Dunk',
      brand: brands[10],
      thumbnail: Images.productImage52,
      description: "Mitsui Pasa dos años sin jugar, y un día vuelve al gimnasio para pelear con los del equipo de baloncesto para que con esto se suspenda el equipo, de esa manera iba a perjudicar a Ryota Miyagi. (uno de los integrantes del equipo con el cual estaba enemistado) Pelearon y hubo mucha sangre, luego el profesor Anzai entró al gimnasio y Mitsui al reencontrarse con el se ve conmovido y decide regresar al balocesto. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    //053
    ProductModel(
      id: '53',
      title: 'Haruko Akagi - Slam Dunk',
      brand: brands[10],
      thumbnail: Images.productImage53,
      description: "Haruko Akagi (晴子・赤木, Haruko Akagi) es uno de los personajes principales de la serie japonesa de manga y anime Slam Dunk. Dulce y con una personalidad arrolladora, ella está siempre por allí para animar a los jugadores, sobre todo a su hermano Takenori, que es muy protector con ella y le enseñó los fundamentos del baloncesto, y Sakuragi a quien considera su mejor amigo. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    //056
    ProductModel(
      id: '56',
      title: 'Rancor - Star Wars',
      brand: brands[5],
      thumbnail: Images.productImage56a,
      images: [
        Images.productImage56a,
        Images.productImage56b,
      ],
      description: "El rancor es una criatura reptiliana y carnívora del universo de Star Wars, famosa por su gran tamaño, fuerza descomunal y su aparición en el Episodio VI: El Retorno del Jedi.",
      price: 7000,
      stock: 2,
      categoryId: '4',
      sku: 'PG-634',
      productType: 'ProductType.single',
    ),

    //057
    ProductModel(
      id: '57',
      title: 'Jabba the Hutt - Star Wars',
      brand: brands[5],
      thumbnail: Images.productImage57a,
      images: [
        Images.productImage57a,
        Images.productImage57b,
      ],
      description: "Jabba el Hutt o Jabba, era un gángster Hutt y un señor del crimen, así como un miembro del Gran Consejo Hutt, que operaba y dirigía un imperio criminal desde su palacio en el mundo del Borde Exterior Tatooine. Jabba era un Hutt, una especie de criatura de gran tamaño y forma de babosa, y era conocido por su naturaleza cruel y despiadada, así como por su amor por la riqueza, el poder y la indulgencia.",
      price: 7000,
      stock: 2,
      categoryId: '4',
      sku: 'PG-629',
      productType: 'ProductType.single',
    ),

    //058
    ProductModel(
      id: '58',
      title: 'Dewback - Star Wars',
      brand: brands[5],
      thumbnail: Images.productImage58a,
      images: [
        Images.productImage58a,
        Images.productImage58b,
      ],
      description: "El dewback es un reptil de gran tamaño que habita en el planeta Tatooine, en el universo de Star Wars. Es conocido por su resistencia y fuerza, lo que lo convierte en un animal de carga y transporte ideal para los habitantes del desierto. Los soldados de asalto imperiales a menudo montan dewbacks para patrullar las dunas y mantener el orden en la región.",
      price: 7000,
      stock: 2,
      categoryId: '4',
      sku: 'PG-636',
      productType: 'ProductType.single',
    ),

    //059
    ProductModel(
      id: '59',
      title: 'Tauntaun - Star Wars',
      brand: brands[5],
      thumbnail: Images.productImage59,
      description: "El Tauntaun es una criatura nativa del planeta helado Hoth, en el universo de Star Wars. Es un animal de carga y transporte utilizado por los rebeldes para desplazarse por el terreno nevado y hostil del planeta. Los tauntauns son conocidos por su resistencia al frío extremo y su capacidad para moverse ágilmente por la nieve y el hielo.",
      price: 7000,
      stock: 2,
      categoryId: '4',
      sku: 'PG-670',
      productType: 'ProductType.single',
    ),

    // 062
    ProductModel(
      id: '62',
      title: 'Lich King',
      brand: brands[13],
      images: [Images.productImage62a, Images.productImage62b],
      thumbnail: Images.productImage62a,
      description:
          "El Rey Exánime (Lich King) es el amo y señor de La Plaga (The Scourge), el ejército de muertos vivientes en el universo de World of Warcraft, ",
      price: 25000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 063
    ProductModel(
      id: '63',
      title: 'Sasori - Hiruko',
      brand: brands[9],
      thumbnail: Images.productImage63,
      description:
          "Hiruko (ヒルコ, Hiruko) era una Marioneta Humana hueca utilizada por el miembro de Akatsuki Sasori, el cual, generalmente, vivía dentro de este títere, usándola como una especie de armadura metálica. ",
      price: 25000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 065
    ProductModel(
      id: '65',
      title: 'Darth Vader',
      brand: brands[5],
      thumbnail: Images.productImage65,
      description:
          "Anakin Skywalker fue un humano sensible a la Fuerza que sirvió a la República Galáctica como Caballero Jedi y más tarde al Imperio Galáctico como el Lord Sith, Darth Vader. ",
      price: 25000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 067
    ProductModel(
      id: '67',
      title: 'Dracule Mihawk',
      brand: brands[3],
      thumbnail: Images.productImage67,
      description:
          "Dracule Mihawk (ジュラキュール・ミホーク Jurakyūru Mihōku), también conocido como Ojos de Halcón (鷹の目 Taka no Me), y en el pasado, como El Cazador de Marines (海兵狩り Kaihei-gari), es un pirata y poseedor actual del título del Espadachín más Fuerte del Mundo (世界最強の剣士 Sekai Saikyō no Kenshi). También fue miembro de los Siete Señores de la Guerra del Mar, siendo el primero en aparecer, hasta que la organización se disolvió. En la actualidad, forma parte de Cross Guild, junto el antiguo Señor de la Guerra del Mar Crocodile y el Emperador del Mar Buggy.",
      price: 25000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 068
    ProductModel(
      id: '68',
      title: 'Buggy',
      brand: brands[3],
      thumbnail: Images.productImage68,
      description:
          "Buggy el payaso estrella (千両道化のバギー Senryō Dōke no Bagī) es el capitán de los Piratas de Buggy, inicialmente conocido como Buggy el payaso y uno de los Cuatro Emperadores que rigen los mares del Nuevo Mundo. Es también el colíder de la Alianza de Buggy y Alvida además de un antiguo aprendiz pirata de los Piratas de Roger. Poco después de la Guerra en la Cumbre de Marineford, se convirtió en miembro de los Siete Señores de la Guerra del Mar y en el presidente de la organización de envíos piratas Buggy's Delivery. Más tarde, perdió su título de Señor de la Guerra, cuando el sistema se disolvió, pero luego fue reconocido como uno de los Cuatro Emperadores, tras la caída de Kaidou y Big Mom y se convirtió en miembro fundador de Cross Guild, actuando como su líder. ",
      price: 25000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 069
    ProductModel(
      id: '69',
      title: 'Crocodile',
      brand: brands[3],
      thumbnail: Images.productImage69,
      description:
          "Sir Crocodile (サー・クロコダイル Sā Kurokodairu, España: «Sir Crocodile el pirata».), conocido como el Rey del desierto (砂漠の王 Sabaku no Ō) es un afamado pirata que formó parte de los Siete Señores de la Guerra del Mar y el fundador y expresidente, en la sombra, de la organización criminal Baroque Works, donde adoptó el nombre en clave de Mr. 0 (ミスター・ゼロ Misutā Zero?) Después de la absolución de los Siete Señores de la Guerra del Mar, Crocodile se desempeña como co-líder de la organización Cross Guild, junto con Dracule Mihawk, bajo la fachada del liderazgo de Buggy, quien fue nombrado como uno de los Cuatro Emperadores. ",
      price: 25000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 070
    ProductModel(
      id: '70',
      title: 'Almirantes de la Marina - One Piece',
      brand: brands[3],
      images: [
        Images.productImage70a, 
      ],
      thumbnail: Images.productImage70a,
      description:
          "Los almirantes de la Marina en One Piece son el segundo rango más alto de la institución (solo por debajo del Almirante de la Flota) y representan el «Mayor Poder Militar» del Gobierno Mundial.",
      price: 15000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(
          name: 'Modelo',
          values: [
            'Sakazuki',
            'Borsalino',
            'Kuzan',
            'Monkey D. Garp',
            'Sengoku',
            'Aramaki',
            'Issho',
          ],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'OnePiece006',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage70f,
          description:
              'Sakazuki (サカズキ Sakazuki), más conocido como Akainu (赤犬 Akainu, lit. «Perro Rojo»), es el almirante de la flota del cuartel general de la Marina.',
          attributeValues: {'Modelo': 'Sakazuki'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'OnePiece007',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage70e,
          description:
              'Borsalino (ボルサリーノ Borusarīno) más conocido como Kizaru (黄猿 Kizaru, lit. «Mono Amarillo») es uno de los tres almirantes del cuartel general de la Marina Después de que Kuzan renunciara a la Marina y Sakazuki fuera ascendido a Almirante de Flota, Kizaru es ahora el único Almirante restante del trío anterior. ',
          attributeValues: {'Modelo': 'Borsalino'},
          sku: '',
        ), ProductVariationModel(
          id: 'OnePiece008',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage70c,
          description:
              'Kuzan (クザン Kuzan?) más conocido como Aokiji (青雉 Aokiji, lit. «Faisán azul»), es uno de los diez capitanes titánicos de los Piratas de Barbanegra, ejerciendo como capitán del décimo barco Antes de unirse a la tripulación de Barbanegra, sirvió como Almirante de la Marina, habiendo sido entrenado por Monkey D. Garp. Fue nominado por Sengoku, para el puesto de Almirante de la flota; sin embargo, después de luchar contra Sakazuki por el puesto y perder, renunció a la Marina. ',
          attributeValues: {'Modelo': 'Kuzan'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'OnePiece004',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage70b,
          description:
              'Monkey D. Garp (モンキー・D・ガープ Monki Dī Gāpu), más conocido por sus epítetos Garp el Puño (ゲンコツのガープ Genkotsu no Gāpu) o el Héroe de la Marina (海軍の英雄 Kaigun no Eiyū), es un vicealmirante del cuartel general de la Marina, en calidad de instructor de nuevos reclutas, siendo extremadamente famoso y poderoso. Es el padre de Monkey D. Dragon el abuelo paterno de Monkey D. Luffy y el abuelo adoptivo de Portgas D. Ace. Fue responsable de supervisar el nacimiento de Ace y criar a Luffy, antes de confiarlos a ambos a la Familia Dadan. ',
          attributeValues: {'Modelo': 'Monkey D. Garp'},
          sku: '',
        ),
         ProductVariationModel(
          id: 'OnePiece004',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage70g,
          description:
              'Sengoku el Buda (仏のセンゴク Hotoke no Sengoku) es el inspector general del cuartel general de la Marina y anterior almirante de la flota Sengoku fue una de las figuras principales en la época dorada de Roger junto a personajes tan emblemáticos como Barbablanca, Shiki o su compañero Garp. Se consideraba el padre adoptivo de Donquixote Rosinante.',
          attributeValues: {'Modelo': 'Sengoku'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'OnePiece004',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage70d,
          description:
              'Aramaki (アラマキ Aramaki), más conocido por su nombre clave Ryokugyu (緑牛 Ryokugyū, lit. «Toro verde»), es uno de los tres almirantes del cuartel general de la Marina Anteriormente, ejerció como policía de su tierra natal, el Reino de Taya, pero fue reclutado por la Marina, para ocupar una de las las dos vacantes de almirante causadas por la renuncia de Kuzan y la promoción de Sakazuki.',
          attributeValues: {'Modelo': 'Aramaki'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'OnePiece004',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage70h,
          description:
              'Issho (一生 Isshō?), más conocido como Fujitora (藤虎 Fujitora, lit. «Tigre Wisteria»), es uno de los tres almirantes del cuartel general de la Marina y anterior jefe militar del antiguo Reino de Aoi. Fue reclutado, a través de un proyecto de reclutamiento Mundial, siendo designado para llenar una de las vacantes de almirante causadas por la renuncia de Kuzan y la promoción de Sakazuki, junto con su compañero Ryokugyu. Como un defensor de la "Justicia humana", Fujitora encabezó notablemente una campaña para la abolición del sistema de los "Siete Señores de la Guerra del Mar", que se llevó a cabo, durante la reunión más reciente del Levely.',
          attributeValues: {'Modelo': 'Issho'},
          sku: '',
        ),
      ]
    ),

    // 071
    ProductModel(
      id: '71',
      title: 'Eustass Kid ',
      brand: brands[3],
      thumbnail: Images.productImage71,
      description:
          "Eustass Kid (ユースタス・'キャプテン'キッド Yūsutasu 'Kyaputen' Kiddo) es un reconocido pirata del South Blue que ejerce como capitán de los Piratas de Kid. Al ser uno de los once Supernovas que desembarcaron en Sabaody, hace dos años, forma parte de «la peor generación» de piratas de la historia. Después de derrotar a la Emperatriz Big Mom, junto a Trafalgar D. Water Law, consiguió una recompensa de Belly3.000.000.000. ",
      price: 25000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 073
    ProductModel(
      id: '73',
      title: 'Shanks',
      brand: brands[3],
      thumbnail: Images.productImage73,
      description:
          "Shanks el Pelirrojo (赤髪のシャンクス Akagami no Shankusu) o simplemente conocido como el Pelirrojo, es el jefe de los Piratas del Pelirrojo y uno de los Cuatro Emperadores que gobiernan el Nuevo Mundo Fue además, un miembro de la legendaria tripulación de Gol D. Roger, siendo la única banda que logró conquistar, con éxito, todo Grand Line.",
      price: 25000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 074
    ProductModel(
      id: '74',
      title: 'Edward Newgate',
      brand: brands[3],
      thumbnail: Images.productImage74,
      description:
          "Edward Newgate (エドワード・二ューゲート Edowādo Nyūgēto), más conocido como Barbablanca (白ひげ Shirohige?), fue el capitán de los Piratas de Barbablanca y el histórico rival de Gol D. Roger. Tras la muerte de éste, fue conocido como el Hombre más cercano al One Piece (ワンピースに最も近い男 Wan Pīsu ni mottomo chikai otoko), además de ser reconocido como El hombre más fuerte del mundo (世界最強の男 Sekai saikyō no otoko). ",
      price: 25000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 076
    ProductModel(
      id: '76',
      title: 'Boba Fett',
      brand: brands[5],
      thumbnail: Images.productImage76,
      description:
          "Boba Fett fue un cazarrecompensas humano, y el clon del infame cazarrecompensas Jango Fett. Boba fue creado por los clonadores de Kamino y era físicamente idéntico a los soldados clon creados para el Gran Ejército de la República, aunque Boba fue inalterado y no creció aceleradamente como los demás clones. Criado como el hijo de Jango, Boba aprendió las habilidades de combate necesarias para algún día convertirse en cazarrecompensas por derecho propio.",
      price: 5000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 077
    ProductModel(
      id: '77',
      title: 'Stormtroopers',
      brand: brands[5],
      thumbnail: Images.productImage77,
      description:
          "Los Soldados Imperiales, también conocidos como Soldados de Asalto Clon, Tropas de Asalto o Stormtroopers, fueron un grupo de soldados de choque de élite del Imperio Galáctico. Al igual que los Destructores Estelares clase Imperial I y los Cazas TIE, los soldados de asalto servían como recordatorio del poder del Emperador, extensiones de su voluntad, y un método para mantener los cientos de sistemas estelares del Imperio bajo el yugo del miedo. ",
      price: 5000,
      stock: 2,
      categoryId: '4',
      sku: '',
      productType: 'ProductType.single',
    ),

    // // 012
    // ProductModel(
    //   id: '12',
    //   title: 'Manual Jugador, Dungeons & Dragons',
    //   brand: brands[7],
    //   thumbnail: Images.productImage12,
    //   description:
    //       "Esta versión revisada y ampliada del Player’s Handbook contiene reglas de creación y desarrollo de personajes, exploración, combate, equipo, conjuros y mucho más. Crea héroes de fantasía de D&D a partir de una gran selección de orígenes, clases y subclases para personajes. Explora ruinas antiguas y mazmorras letales, enfréntate a monstruos en tu búsqueda de tesoros legendarios y adquiere experiencia y poder mientras recorres territorios ignotos junto a tus compañeros.",
    //   price: 20000,
    //   stock: 2,
    //   categoryId: '11',
    //   sku: 'ROL001',
    //   productType: 'ProductType.single',
    // ),

    // // 013
    // ProductModel(
    //   id: '13',
    //   title: 'Ranger Black/Blue - Adventure Dice',
    //   brand: brands[7],
    //   thumbnail: Images.productImage13,
    //   description:
    //       "Sigue el rastro de tu presa con este set oficial para Ranger, donde precisión, instinto y dominio de la naturaleza se reflejan en cada tirada. Sus tonos negro y azul acompañan a quienes avanzan con sigilo hacia lo desconocido.\n🎨 Características: Set de 14 dados en tonos negro y azul, diseñado para personajes Ranger de Dungeons & Dragons.\n🧾 Especificaciones: 2 d4, 4 d6, 2 d8, 2 d10, 1 d%, 1 d12 y 2 d20; 14 dados en total.\n💡 Consejo PiedraBruja: Guarda el set en un estuche o bandeja para proteger sus colores y mantenerlo listo para cada aventura.\n🎯 Ideal para: Jugadores de Dungeons & Dragons, personajes Ranger y coleccionistas de accesorios oficiales.",
    //   price: 10000,
    //   stock: 1,
    //   categoryId: '11',
    //   sku: 'ROL002',
    //   productType: 'ProductType.single',
    // ),

    // [TOOLS]

    // 014
    ProductModel(
      id: '14',
      title: 'Shinto Escofina Japonesa',
      brand: brands[8],
      images: [Images.productImage14b, Images.productImage14c],
      thumbnail: Images.productImage14a,
      description:
          "Esta escofina para madera de doble cara de Shinto cuenta con dientes gruesos en un lado y dientes finos en el otro, lo que la hace perfecta para dar forma a sus proyectos de carpintería. La herramienta dispone de un mango duradero de elastómero unido a la escofina mediante una estructura cónica, lo que permite sujetarla cómodamente por ambos extremos para lograr una gran precisión y control durante su uso. Los dientes presentan un diseño de patrón de diamante y están unidos mediante remaches, lo que evita que el serrín obstruya la herramienta y facilita su limpieza cuando es necesario.\nEl lado de dientes gruesos permite eliminar grandes cantidades de madera de forma rápida y eficaz —ideal para el desbastado y el modelado—, mientras que el lado de dientes finos se utiliza para refinar y alisar la superficie antes del lijado.",
      price: 25000,
      stock: 2,
      categoryId: '10',
      sku: 'TOOL002',
      productType: 'ProductType.single',
    ),


    // [TOOLS MODEL]

    // 045
    ProductModel(
      id: '45',
      title: 'Exhibidor Acrílico 32 Figuras Lego',
      brand: brands[8],
      images: [Images.productImage45a, Images.productImage45b],
      thumbnail: Images.productImage45a,
      description:
          "Exhibidor Acrílico Transparente de 4 Niveles con Base Negra para 32 Figuras (Apto para Lego), 20x9x10",
      price: 25000,
      stock: 2,
      categoryId: '10',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 072
    ProductModel(
      id: '72',
      title: 'Paleta Húmeda para Pintura Acrílica',
      brand: brands[8],
      images: [Images.productImage72a, Images.productImage72b, Images.productImage72c, Images.productImage72d],
      thumbnail: Images.productImage72a,
      description:
          "Paletas Húmedas Portátiles para Pintura Acrílica, Modelismo y Coloración: Bandeja Húmeda para Pintura que Mantiene la Humedad, Ideal para Miniaturas y Herramientas de Modelado./Tamaño (caja): 21*7*2,5 cm (como se muestra en la imagen)/Nota:/1. El color real del artículo puede ser ligeramente diferente al de las imágenes mostradas en el sitio web debido a muchos factores como el brillo del monitor y el brillo de la luz./2. Por favor, permita una ligera desviación en la medición manual de los datos./Accesorios:/1*Bandeja húmeda +1*Esponja+1*Soporte para limpiar pinceles+2*Papel guía de agua+10*Papel absorbente o 10 unidades/bolsa de papel guía de agua o 50 unidades/bolsa de papel absorbente o 50 unidades/bolsa de papel difusor",
      price: 25000,
      stock: 2,
      categoryId: '10',
      sku: '',
      productType: 'ProductType.single',
    ),
    
    // 075
    ProductModel(
      id: '75',
      title: 'Lupas de aumento 10X',
      brand: brands[8],
      images: [Images.productImage75a, Images.productImage75b, Images.productImage75c, Images.productImage75d],
      thumbnail: Images.productImage75a,
      description:
          "Especificaciones:/1.Material de la lente: resina acrílica (procesada mediante un revestimiento rígido a prueba de grietas)/2.Materiales principales: resina ABS, resinas PP./3.Lupa de lente fija: 4X-89 x 29 mm (largo x ancho)/4.Lupa de lente abatible: 4X-89 x 29 mm (largo x ancho)/5.Lupa redonda de un solo ojo: 5X -29 mm (diámetro)/6.Alimentación por: 2 pilas AAA (no incluidas)/7.Color negro/8.Tamaño: 25 x 19,8 x 6,5 cm (largo x ancho x alto)/9.Perímetro ajustable de la diadema: 21,26-27,17 pulgadas/54-69 cm/El paquete incluye:/1 lupa con cabezal de auriculares con lupa iluminada 10X",
      price: 25000,
      stock: 2,
      categoryId: '10',
      sku: '',
      productType: 'ProductType.single',
    ),
    
    // 078
    ProductModel(
      id: '78',
      title: 'Pincel para detalle',
      brand: brands[8],
      images: [Images.productImage78a, Images.productImage78b],
      thumbnail: Images.productImage78a,
      description:
          "Pincel para detalle, paquete de 10 unidades",
      price: 5000,
      stock: 2,
      categoryId: '10',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 079
    ProductModel(
      id: '79',
      title: 'Limpia pincel',
      brand: brands[8],
      images: [Images.productImage79a, Images.productImage79b],
      thumbnail: Images.productImage79a,
      description:
          "Limpia pincel de plastico desarmable",
      price: 10000,
      stock: 2,
      categoryId: '10',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 080
    ProductModel(
      id: '80',
      title: 'Pincel Fino de Bambu',
      brand: brands[8],
      images: [Images.productImage80a, Images.productImage80b, Images.productImage80c, Images.productImage80d, Images.productImage80e],
      thumbnail: Images.productImage80a,
      description:
          "Pincel Fino de Bambu",
      price: 5000,
      stock: 2,
      categoryId: '10',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 081
    ProductModel(
      id: '81',
      title: 'Sierra de corte Mini',
      brand: brands[8],
      images: [Images.productImage81a, Images.productImage81b],
      thumbnail: Images.productImage81a,
      description:
          "Sierra de corte Mini",
      price: 5000,
      stock: 2,
      categoryId: '10',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 082
    ProductModel(
      id: '82',
      title: 'Taladro manual con brocas',
      brand: brands[8],
      images: [Images.productImage82a, Images.productImage82b, Images.productImage82c, Images.productImage82d],
      thumbnail: Images.productImage82a,
      description:
          "Taladro manual con brocas 0.8 - 1.0 - 1.5 - 2.0 - 2.5",
      price: 10000,
      stock: 2,
      categoryId: '10',
      sku: '',
      productType: 'ProductType.single',
    ),

    // [GAMING]

    // 054
    ProductModel(
      id: '54',
      title: 'Rapoo MT760',
      brand: brands[15],
      images: [Images.productImage54a, Images.productImage54b,Images.productImage54c,Images.productImage54d,Images.productImage54e],
      thumbnail: Images.productImage54a,
      description:
          "Rapoo MT760 Ratón inalámbrico Bluetooth multimodo recargable ergonómico 4000 DPI compatible con hasta 4 dispositivos",
      price: 25000,
      stock: 2,
      categoryId: '11',
      sku: '',
      productType: 'ProductType.single',
    ),
    
    // 055
    ProductModel(
      id: '55',
      title: 'Auriculares KZ EDX Pro X',
      brand: brands[15],
      images: [Images.productImage55a, Images.productImage55b,Images.productImage55c,Images.productImage55d,Images.productImage55e,Images.productImage55f,Images.productImage55g,Images.productImage55h,Images.productImage55i,Images.productImage55j,Images.productImage55k,Images.productImage55l],
      thumbnail: Images.productImage55a,
      description:
          "Auriculares deportivos KZ EDX Pro X HIFI con cable desmontable de 0.78mm y 2 pines, micrófono con reducción de ruido HD para juegos y viajes.",
      price: 30000,
      stock: 2,
      categoryId: '11',
      sku: '',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: [
            'Negro',
            'Cyan',
            'Gris',
          ],
        ),
        ProductAttributeModel(
          name: 'Model',
          values: [
            'Sin Microfono',
            'Con Microfono',
          ],
        )
      ],
      productVariations: [
        ProductVariationModel(
          id: 'KZ-EDX-Black',
          stock: 2,
          salePrice: 10000,
          price: 15000,
          image: Images.productImage55a,
          description:'KZ-EDX-Black',
          attributeValues: {
            'Color': 'Negro',
            'Model': 'Sin Microfono'
          },
          sku: 'KZ-EDX-Black',
        ),

        ProductVariationModel(
          id: 'KZ-EDX-Black-Mic',
          stock: 2,
          salePrice: 10000,
          price: 15000,
          image: Images.productImage55k,
          description:'KZ-EDX-Black-Mic',
          attributeValues: {
            'Color': 'Negro',
            'Model': 'Con Microfono'
          },
          sku: 'KZ-EDX-Black-Mic',
        ),

        ProductVariationModel(
          id: 'KZ-EDX-Cyan',
          stock: 2,
          salePrice: 10000,
          price: 15000,
          image: Images.productImage55j,
          description:'KZ-EDX-Cyan',
          attributeValues: {
            'Color': 'Cyan',
            'Model': 'Sin Microfono'
          },
          sku: 'KZ-EDX-Cyan',
        ),
        // ProductVariationModel(
        //   id: 'KZ-EDX-Cyan-Mic',
        //   stock: 0,
        //   salePrice: 10000,
        //   price: 15000,
        //   image: Images.productImage11b,
        //   description:'KZ-EDX-Cyan-Mic',
        //   attributeValues: {
        //     'Color': 'Cyan',
        //     'Model': 'Con Microfono'
        //   },
        //   sku: 'KZ-EDX-Cyan-Mic',
        // ),

        ProductVariationModel(
          id: 'KZ-EDX-GRIS',
          stock: 2,
          salePrice: 10000,
          price: 15000,
          image: Images.productImage55g,
          description:'KZ-EDX-GRIS',
          attributeValues: {
            'Color': 'Gris',
            'Model': 'Sin Microfono'
          },
          sku: 'KZ-EDX-GRIS',
        ),
        ProductVariationModel(
          id: 'KZ-EDX-GRIS-Mic',
          stock: 2,
          salePrice: 10000,
          price: 15000,
          image: Images.productImage55l,
          description:'KZ-EDX-GRIS-Mic',
          attributeValues: {
            'Color': 'Gris',
            'Model': 'Con Microfono'
          },
          sku: 'KZ-EDX-GRIS-Mic',
        ),
      ]
    ),
    
    // 060
    ProductModel(
      id: '60',
      title: 'Keycap Space Marine Warhammer 40k',
      brand: brands[16],
      thumbnail: Images.productImage60,
      description:
          "Keycap Space Marine Warhammer 40k Sin pintar",
      price: 25000,
      stock: 2,
      categoryId: '13',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 061
    ProductModel(
      id: '61',
      title: 'Keycap Hunter x Hunter',
      brand: brands[16],
      images: [
        Images.productImage61a, 
        Images.productImage61b, 
        Images.productImage61c,
        Images.productImage61d,
        Images.productImage61e, 
        Images.productImage61f,
        Images.productImage61g
      ],
      thumbnail: Images.productImage61a,
      description:
          "Keycap Hunter x Hunter Sin pintar Hecho en Resina",
      price: 15000,
      stock: 2,
      categoryId: '13',
      sku: '',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(
          name: 'Modelo',
          values: [
            'Gon Freecss',
            'Killua Zoldyck',
            'Hisoka Morow',
            'Pack Gon - Killua -Hisoka'
          ],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'Keycap001',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage61f,
          description:
              'Gon Freecss (ゴン＝フリークス, Gon Furīkusu) es el protagonista principal de la serie de manga y anime Hunter × Hunter. Está en búsqueda de su padre, el famoso cazador Ging Freecss. ',
          attributeValues: {'Modelo': 'Gon Freecss'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'Keycap002',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage61g,
          description:
              'Killua Zoldyck (キルア・ゾルディック, Kirua Zorudikku) es el coprotagonista y el mejor amigo de Gon Freecss. Es el tercero de los cinco hijos de la familia Zoldyck. ',
          attributeValues: {'Modelo': 'Killua Zoldyck'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'Keycap003',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage61e,
          description:
              'Hisoka Morow (ヒソカ＝モロウ, Morō Hisoka) es un Cazador y antiguo miembro de la Brigada Fantasma. Él siempre está en busca de oponentes fuertes, y perdonará a los que tienen un gran potencial, como Gon y Killua para que sean lo suficientemente fuertes como para realmente desafiarlo.',
          attributeValues: {'Modelo': 'Hisoka Morow'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'Keycap004',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage61a,
          description:
              'Pack 3 Keycaps Hunter x Hunter Gon - Killua - Hisoka',
          attributeValues: {'Modelo': 'Pack Gon - Killua -Hisoka'},
          sku: '',
        ),
      ]
    ),

    // 064
    ProductModel(
      id: '64',
      title: 'Keycap One Piece - Yonko',
      brand: brands[16],
      images: [
        Images.productImage64a, 
        Images.productImage64b, 
        Images.productImage64c,
        Images.productImage64d,
        Images.productImage64e, 
        Images.productImage64f,
        Images.productImage64g
      ],
      thumbnail: Images.productImage64a,
      description:
          "Keycap One Piece Yonkos Sin pintar Hecho en Resina",
      price: 15000,
      stock: 2,
      categoryId: '13',
      sku: '',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(
          name: 'Modelo',
          values: [
            'Edward Newgate',
            'Shanks',
            'Portgas D. Ace',
            'Trafalgar D. Law',
            'Pack Edward Newgate - Shanks - Ace - Law'
          ],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'Keycap006',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage64e,
          description:
              'Edward Newgate (エドワード・二ューゲート) más conocido como Shirohige, es un importante personaje de One Piece que lleva largo tiempo al mando de una de las flotas piratas más poderosas y numerosas de los mares, es así como logra ser considerado uno de los cuatro Emperadores y un claro candidato para alcanzar al rey de los piratas. ',
          attributeValues: {'Modelo': 'Edward Newgate'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'Keycap007',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage64f,
          description:
              'Shanks el Pelirrojo (赤髪のシャンクス Akagami no Shankusu?),o simplemente conocido como el Pelirrojo, es el jefe de los Piratas del Pelirrojo y uno de los Cuatro Emperadores que gobiernan el Nuevo Mundo. Fue, además, un miembro de la legendaria tripulación de Gol D. Roger, siendo la única banda que logró conquistar, con éxito, todo Grand Line.',
          attributeValues: {'Modelo': 'Shanks'},
          sku: '',
        ), ProductVariationModel(
          id: 'Keycap008',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage64g,
          description:
              'Portgas D. Ace (ポートガス・D・エース) conocido usualmente como Ace, es un personaje de One Piece, hermano del personaje principal Monkey D. Luffy. ',
          attributeValues: {'Modelo': 'Portgas D. Ace'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'Keycap003',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage64h,
          description:
              'Trafalgar D. Law (トラファルガー・D・ロー) es un personaje protagonista de One Piece, es el capitán de los piratas Hearts, subordinado de Donquixote Doflamingo al que está enfrentado; además, es uno de los piratas pertenecientes a la peor generación de supernovas, así como uno de los Shichibukai, más adelante se convierte en el principal aliado de los Mugiwaras. ',
          attributeValues: {'Modelo': 'Trafalgar D. Law'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'Keycap004',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage64b,
          description:
              'Pack 3 Keycaps One Piece Edward Newgate - Shanks - Ace - Law',
          attributeValues: {'Modelo': 'Pack Edward Newgate - Shanks - Ace - Law'},
          sku: '',
        ),
      ]
    ),

    // 066
    ProductModel(
      id: '66',
      title: 'Keycap One Piece - Piratas de Sombrero de Paja',
      brand: brands[16],
      images: [
        Images.productImage66a, 
        Images.productImage66b, 
        Images.productImage66c,
        Images.productImage66d,
        Images.productImage66e, 
      ],
      thumbnail: Images.productImage66a,
      description:
          "Keycap One Piece Piratas de Sombrero de Paja Sin pintar Hecho en Resina",
      price: 15000,
      stock: 2,
      categoryId: '13',
      sku: '',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(
          name: 'Modelo',
          values: [
            'Monkey D. Luffy',
            'Roronoa Zoro',
            'Sanji',
            'Pack Luffy - Zoro - Sanji'
          ],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'Keycap006',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage66c,
          description:
              'Monkey D. Luffy (モンキー・Ｄ・ルフィ), más conocido como Luffy «Sombrero de Paja» (麦わらのルフィ), es el protagonista principal de la serie de manga y anime One Piece. Es el capitán y fundador de los Piratas de Sombrero de Paja así como un de los Cuatro Emperadores que gobiernan los mares del Nuevo Mundo.',
          attributeValues: {'Modelo': 'Monkey D. Luffy'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'Keycap007',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage66d,
          description:
              'Roronoa Zoro (ロロノア・ ゾロ Roronoa Zoro?), conocido como El Cazador de Piratas (海賊狩り Kaizoku Gari?), es el primer pirata que se unió a Monkey D. Luffy, y el principal combatiente de los Piratas de Sombrero de Paja, uno de sus dos espadachines y uno de los oficiales principales de la Gran Flota de Sombrero de Paja, así como un antiguo cazarrecompensas.',
          attributeValues: {'Modelo': 'Roronoa Zoro'},
          sku: '',
        ), ProductVariationModel(
          id: 'Keycap008',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage66e,
          description:
              'Sanji (サンジ Sanji?), conocido como Pierna Negra (黒脚 Kuro Ashi?) y nacido como Vinsmoke Sanji (ヴィンスモーク・サンジ Vinsumōku Sanji?), es el cocinero de los Piratas de Sombrero de Paja, así como uno de los oficiales principales de la Gran Flota de Sombrero de Paja. ',
          attributeValues: {'Modelo': 'Sanji'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'Keycap004',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage66a,
          description:
              'Pack 3 Keycaps One Piece Luffy - Zoro - Sanji',
          attributeValues: {'Modelo': 'Pack Luffy - Zoro - Sanji'},
          sku: '',
        ),
      ]
    ),

     // 083
    ProductModel(
      id: '83',
      title: 'Dudu & Bubu, llaveros',
      brand: brands[1],
      images: [
        Images.productImage83a, 
        Images.productImage83b, 
        Images.productImage83c,
        Images.productImage83d
      ],
      thumbnail: Images.productImage83a,
      description:
          "Llavero de Dudu & Bubu hecho en plastico resistente",
      price: 5000,
      stock: 2,
      categoryId: '14',
      sku: '',
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(
          name: 'Modelo',
          values: [
            'Dudu',
            'Bubu',
            'Dudu & Bubu'
          ],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: 'Keycap010',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage83b,
          description:'Llavero de Dudu',
          attributeValues: {'Modelo': 'Dudu'},
          sku: '',
        ),
        ProductVariationModel(
          id: 'Keycap011',
          stock: 1,
          salePrice: 5000,
          price: 5000,
          image: Images.productImage83c,
          description:'Llavero de Bubu',
          attributeValues: {'Modelo': 'Bubu'},
          sku: '',
        ), ProductVariationModel(
          id: 'Keycap012',
          stock: 1,
          salePrice: 10000,
          price: 5000,
          image: Images.productImage83c,
          description:'Pack de llavero Dudu & Bubu',
          attributeValues: {'Modelo': 'Dudu & Bubu'},
          sku: '',
        )
      ]
    ),

    // 084
    ProductModel(
      id: '84',
      title: 'Pokemon Set Figuras',
      brand: brands[4],
      images: [
        Images.productImage84a, 
        Images.productImage84b, 
        Images.productImage84c,
        Images.productImage84d,
        Images.productImage84e,
        Images.productImage84f,
        Images.productImage84g
      ],
      thumbnail: Images.productImage84a,
      description:
          "Set de figuras Pokemon : Pikachu, Bulbasour, Charmander, Eve, Psyduck",
      price: 5000,
      stock: 2,
      categoryId: '15',
      sku: '',
      productType: 'ProductType.single',
    ),

    // 085
    ProductModel(
      id: '85',
      title: 'Posillo Metalico',
      brand: brands[8],
      thumbnail: Images.productImage85,
      description:
          "Posillo metalico para mesclar pintura",
      price: 25000,
      stock: 2,
      categoryId: '10',
      sku: '',
      productType: 'ProductType.single',
    ),
  ];

  // Address
  static final List<AddressModel> addresses = [
    AddressModel(
      id: UniqueKey().toString(),
      name: 'joshe china',
      phoneNumber: '123123',
      street: 'santa barbare',
      city: '12312',
      state: '1231',
      postalCode: '123123',
      country: '1231',
    ),

    AddressModel(
      id: UniqueKey().toString(),
      name: 'Joshe Casa',
      phoneNumber: '+569732344432',
      street: 'Avenida Siempreviva numero 2344',
      city: 'Santiago',
      state: 'Santiago',
      postalCode: '222',
      country: 'Chile',
      selectedAddress: true,
    ),

    AddressModel(
      id: '02',
      name: 'Joshe Copiapo',
      phoneNumber: '+569732344432',
      street: 'Copayapu 3234',
      city: 'Copiapo',
      state: 'Atacama',
      postalCode: '1221',
      country: 'Chile',
      selectedAddress: true,
    ),
    AddressModel(
      id: '03',
      name: 'Vietnam',
      phoneNumber: '+52912224222',
      street: 'Da nang 232',
      city: 'Da Nang',
      state: 'Deng Tong',
      postalCode: '2221',
      country: 'Vietnam',
    ),
  ];

  // ProductMaket

  static final List<ProductMarketModel> productsMarket = [
    // [ARROZ]
    ProductMarketModel(
      id: 'productMarket_0',
      image: Images.productMarket0,
      name: 'Arroz grd 2',
      quantity: '1 Kg',
      updateDate: DateTime.now(),
      post: posts[0],
    ),

    // [LECHE]
    ProductMarketModel(
      id: 'productMarket_1',
      image: Images.productMarket1,
      name: 'Leche',
      quantity: '1 Lt',
      price: 1100,
      store: stores[1],
      updateDate: DateTime.now(),
      post: posts[1],
    ),

    // [CONFORT]
    ProductMarketModel(
      id: 'productMarket_2',
      image: Images.productMarket2,
      name: 'Confort',
      quantity: '4x45 mts',
      price: 2000,
      store: stores[2],
      updateDate: DateTime.now(),
      post: posts[2],
    ),

    // [AZUCAR]
    ProductMarketModel(
      id: 'productMarket_3',
      image: Images.productMarket3,
      name: 'Azucar',
      quantity: '1 kg',
      price: 1000,
      store: stores[1],
      updateDate: DateTime.now(),
      post: posts[3],
    ),

    // [LAVALOZA]
    ProductMarketModel(
      id: 'productMarket_4',
      image: Images.productMarket4,
      name: 'LAVALOZA',
      quantity: '1 Lt',
      updateDate: DateTime.now(),
      post: posts[4],
    ),

    // [TOMATE]
    ProductMarketModel(
      id: 'productMarket_5',
      image: Images.productMarket5,
      name: 'TOMATE',
      quantity: '1 Kg',
      updateDate: DateTime.now(),
      post: posts[5],
    ),

    // [HUEVOS]
    ProductMarketModel(
      id: 'productMarket_6',
      image: Images.productMarket6,
      name: 'HUEVOS',
      quantity: '30 unidades',
      updateDate: DateTime.now(),
      post: posts[6],
    ),

    // [CHAPSUI]
    ProductMarketModel(
      id: 'productMarket_7',
      image: Images.productMarket7,
      name: 'CHAPSUI',
      quantity: '450 gr',
      updateDate: DateTime.now(),
      post: posts[7],
    ),

    // [CARNE MOLIDA]
    ProductMarketModel(
      id: 'productMarket_8',
      image: Images.productMarket8,
      name: 'CARNE MOLIDA',
      quantity: '250 gr',
      updateDate: DateTime.now(),
      post: posts[8],
    ),

    // [KETCHUP]
    ProductMarketModel(
      id: 'productMarket_9',
      image: Images.productMarket9,
      name: 'KETCHUP',
      quantity: '500 gr',
      updateDate: DateTime.now(),
      post: posts[9],
    ),
  ];

  //  StoreMarket

  static final List<StoreModel> stores = [
    StoreModel(
      id: 'store_0',
      name: 'El pedregal',
      address: 'Bernardo O\'Higgins 459, Copiapó, Atacama',
    ),
    StoreModel(
      id: 'store_1',
      name: 'Unimarc',
      address: 'Av. Henríquez 523, Copiapó, Atacama',
    ),
    StoreModel(
      id: 'store_2',
      name: 'Lider',
      address: 'Chacabuco con Copayapu, Copiapó, Atacama',
    ),
    StoreModel(
      id: 'store_3',
      name: 'AGRO',
      address: 'Avenida Los Loros #1472, Copiapo',
    ),
  ];

  static final List<OrderModel> orders = [
    OrderModel(
      id: UniqueKey().toString(),
      userId: user.id,
      status: OrderStatus.pending,
      totalAmount: 15.000,
      orderDate: DateTime.now(),
      paymentMethod:
          CheckoutController.instance.selectedPaymentMethod.value.name,
      address: AddressController.instance.selectedAddress.value,
      // Set Date as needed
      deliveryDate: DateTime.now(),
      items: CartController.instance.cartItems.toList(),
    ),

    OrderModel(
      id: UniqueKey().toString(),
      userId: user.id,
      status: OrderStatus.pending,
      totalAmount: 32.000,
      orderDate: DateTime.now(),
      paymentMethod:
          CheckoutController.instance.selectedPaymentMethod.value.name,
      address: AddressController.instance.selectedAddress.value,
      // Set Date as needed
      deliveryDate: DateTime.now(),
      items: CartController.instance.cartItems.toList(),
    ),
  ];

  // Post
  static final List<PostModel> posts = [
    // ARROZ
    PostModel(
      id: 'posts_0',
      user: users[0],
      productId: 'productMarket_0',
      price: 900,
      store: stores[0],
      comment: loremIpsum(words: 10),
      negativeFeedback: 32,
      positiveFeedback: 343,
    ),
    // LECHE
    PostModel(
      id: 'posts_1',
      user: users[0],
      productId: 'productMarket_1',
      price: 1100,
      store: stores[1],
      comment: loremIpsum(words: 10),
      negativeFeedback: 231,
      positiveFeedback: 22,
    ),
    // CONFORT
    PostModel(
      id: 'posts_2',
      user: users[0],
      productId: 'productMarket_2',
      price: 1100,
      store: stores[2],
      comment: loremIpsum(words: 10),
      negativeFeedback: 13,
      positiveFeedback: 2,
    ),
    // AZUCAR
    PostModel(
      id: 'posts_3',
      user: users[0],
      productId: 'productMarket_3',
      price: 1000,
      store: stores[1],
      comment: loremIpsum(words: 10),
      negativeFeedback: 231,
      positiveFeedback: 22,
    ),

    // LAVALOZA
    PostModel(
      id: 'posts_4',
      user: users[0],
      productId: 'productMarket_4',
      price: 1100,
      store: stores[2],
      comment: loremIpsum(words: 10),
      negativeFeedback: 14,
      positiveFeedback: 235,
    ),

    // TOMATE
    PostModel(
      id: 'posts_5',
      user: users[0],
      productId: 'productMarket_5',
      price: 1000,
      store: stores[3],
      comment: loremIpsum(words: 10),
      negativeFeedback: 2,
      positiveFeedback: 220,
    ),

    // HUEVOS
    PostModel(
      id: 'posts_6',
      user: users[0],
      productId: 'productMarket_6',
      price: 6000,
      store: stores[3],
      comment: loremIpsum(words: 10),
      negativeFeedback: 0,
      positiveFeedback: 22,
    ),

    // CHAPSUI
    PostModel(
      id: 'posts_7',
      user: users[0],
      productId: 'productMarket_7',
      price: 1250,
      store: stores[0],
      comment: loremIpsum(words: 10),
      negativeFeedback: 23,
      positiveFeedback: 503,
    ),

    // CARNE MOLIDA
    PostModel(
      id: 'posts_8',
      user: users[0],
      productId: 'productMarket_8',
      price: 1250,
      store: stores[0],
      comment: loremIpsum(words: 10),
      negativeFeedback: 21,
      positiveFeedback: 16,
    ),

    // KETCHUP
    PostModel(
      id: 'posts_9',
      user: users[0],
      productId: 'productMarket_9',
      price: 1000,
      store: stores[2],
      comment: loremIpsum(words: 10),
      negativeFeedback: 322,
      positiveFeedback: 0,
    ),

    // PostModel(id: 'posts_1', user: users[1],productId: '1', price: 2000,store: stores[0], comment: loremIpsum(words: 8), negativeFeedback: 200, positiveFeedback: 123),
    // PostModel(id: 'posts_2', user: users[2],productId: '1', price: 3900, store: stores[0], comment: loremIpsum(words: 8), negativeFeedback: 32, positiveFeedback: 343),
    // PostModel(id: 'posts_3', user: users[3], productId: '1', price: 1000, store: stores[0], comment: loremIpsum(words: 8), negativeFeedback: 12, positiveFeedback: 3),

    // PostModel(id: '04', userId: '4', price: 200, companyId: '1e', comment: loremIpsum(words: 15)),
    // PostModel(id: '05', userId: '5', price: 5200, companyId: '1f', comment: loremIpsum(words: 15)),
  ];

  static final List<FeedbackModel> feedbacks = [
    FeedbackModel(
      id: '1',
      userId: user.id,
      postId: posts[0].id,
      productId: products[0].id,
      feedback: 'positive',
    ),
  ];
}
