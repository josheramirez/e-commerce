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

  /// List of all Categories
  static final List<CategoryModel> categories = [
    /// Parent Categories
    CategoryModel(
      id: '1',
      name: 'Rol Game',
      image: Images.rolGame,
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      name: 'Pokemon',
      image: Images.pokemon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      name: 'One Piece',
      image: Images.onePiece,
      isFeatured: true,
    ),
    CategoryModel(id: '4', name: 'Lego', image: Images.lego, isFeatured: true),
    CategoryModel(
      id: '5',
      name: 'Hotwheels',
      image: Images.hotwheels,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Dudu & Bubu',
      image: Images.dubuBubu,
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      name: 'Gamer',
      image: Images.gamming,
      isFeatured: true,
    ),
    CategoryModel(id: '9', name: 'Toys', image: Images.toys, isFeatured: true),
    CategoryModel(
      id: '10',
      name: 'Model Tool',
      image: Images.modelTools,
      isFeatured: true,
    ),
    CategoryModel(
      id: '11',
      name: 'Books',
      image: Images.books,
      isFeatured: true,
    ),
    CategoryModel(id: '12', name: 'Tcg', image: Images.tcg, isFeatured: true),

    /// Gamer
    CategoryModel(
      id: '13',
      name: 'Video Card',
      image: Images.videoCard,
      parentId: '7',
      isFeatured: false,
    ),
    CategoryModel(
      id: '14',
      name: 'Ram',
      image: Images.memoryRam,
      parentId: '7',
      isFeatured: false,
    ),

    /// Pokemon
    CategoryModel(
      id: '15',
      name: 'Pokemon TCG',
      image: Images.pokemonTcgBrand,
      parentId: '12',
      isFeatured: false,
    ),
    CategoryModel(
      id: '16',
      name: 'One Piece TCG',
      image: Images.onePieceTcgBrand,
      parentId: '12',
      isFeatured: false,
    ),
  ];

  // BrandCategory
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(categoryId: '1', brandId: '1'), // Rol - Warhammer
    BrandCategoryModel(categoryId: '1', brandId: '8'), // Rol - D&D

    BrandCategoryModel(categoryId: '2', brandId: '6'), // Pokemon - Pokemon TCG

    BrandCategoryModel(
      categoryId: '3',
      brandId: '5',
    ), // One Piece - OnePieceToy
    BrandCategoryModel(
      categoryId: '3',
      brandId: '11',
    ), // One Piece - OnePieceToy

    BrandCategoryModel(categoryId: '4', brandId: '2'), // Lego - Lego

    BrandCategoryModel(categoryId: '5', brandId: '4'), // Hotwheel - Hotwheel

    BrandCategoryModel(categoryId: '12', brandId: '11'), // Tcg - One Piece Tcg
    BrandCategoryModel(categoryId: '12', brandId: '12'), // Tcg - Pokemon Tcg
  ];

  // ProductCategory
  static final List<ProductCategoryModel> productCategory = [
    // Category 1
    ProductCategoryModel(categoryId: '1', productId: '11'),
    ProductCategoryModel(categoryId: '1', productId: '3'),
    ProductCategoryModel(categoryId: '1', productId: '5'),
    ProductCategoryModel(categoryId: '1', productId: '6'),

    // Category 4
    ProductCategoryModel(categoryId: '4', productId: '8'),
    ProductCategoryModel(categoryId: '4', productId: '9'),
    ProductCategoryModel(categoryId: '4', productId: '10'),

    // Category 10
    ProductCategoryModel(categoryId: '10', productId: '14'),
    ProductCategoryModel(categoryId: '10', productId: '15'),
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
    BrandModel(
      id: '1',
      image: Images.warhammerBrandLogo,
      name: 'Warhammer',
      productsCount: 20,
      isFeatured: true,
    ),
    BrandModel(
      id: '2',
      image: Images.legoBrandLogo,
      name: 'Lego',
      productsCount: 100,
      isFeatured: true,
    ),
    BrandModel(
      id: '3',
      image: Images.duduBubuBrand,
      name: 'Dudu & Bubu',
      productsCount: 2,
      isFeatured: true,
    ),
    BrandModel(
      id: '4',
      image: Images.hotwheelsBrandLogo,
      name: 'Hotwheels',
      productsCount: 30,
      isFeatured: true,
    ),
    BrandModel(
      id: '5',
      image: Images.onePieceBrandLogo,
      name: 'One Piece',
      productsCount: 10,
      isFeatured: true,
    ),
    BrandModel(
      id: '6',
      image: Images.pokemonBrandLogo,
      name: 'Pokemon',
      productsCount: 30,
      isFeatured: true,
    ),
    BrandModel(
      id: '7',
      image: Images.starWarsBrandLogo,
      name: 'Star Wars',
      productsCount: 100,
      isFeatured: true,
    ),
    BrandModel(
      id: '8',
      image: Images.dungeonsAndDragonsBrand,
      name: 'Dungeons & Dragons',
      productsCount: 100,
      isFeatured: true,
    ),
    BrandModel(
      id: '9',
      image: Images.nvidiaBrandLogo,
      name: 'Nvidia',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '10',
      image: Images.radeonBrandLogo,
      name: 'Radeon',
      productsCount: 1,
      isFeatured: true,
    ),
    BrandModel(
      id: '11',
      image: Images.onePieceTcgBrand,
      name: 'One Piece TCG',
      productsCount: 10,
      isFeatured: true,
    ),
    BrandModel(
      id: '12',
      image: Images.pokemonTcgBrand,
      name: 'Pokemon TCG',
      productsCount: 20,
      isFeatured: true,
    ),
  ];

  /// List of all products - 10 Products
  static final List<ProductModel> products = [
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
      brand: brands[1],
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
      brand: brands[1],
      sku: 'WM2092',
      categoryId: '4',
      productType: 'ProductType.single',
    ),

    // 010
    ProductModel(
      id: '10',
      title: 'Madara',
      brand: brands[1],
      thumbnail: Images.productImage10,
      description:
          "Madara Uchiha (うちはマダラ Uchiha Madara?) es un personaje antagónico de la serie de manga Naruto, escrita e ilustrada por Masashi Kishimoto. Antes del comienzo de la historia llegó a convertirse en la figura principal de su clan, y era una reencarnación de Indra Ōtsutsuki, así como uno de los ninjas más poderosos de todos los tiempos. ",
      price: 3000,
      stock: 2,
      categoryId: '4',
      sku: 'WM2094',
      productType: 'ProductType.single',
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

    // 012
    ProductModel(
      id: '12',
      title: 'Manual Jugador, Dungeons & Dragons',
      brand: brands[7],
      thumbnail: Images.productImage12,
      description:
          "Esta versión revisada y ampliada del Player’s Handbook contiene reglas de creación y desarrollo de personajes, exploración, combate, equipo, conjuros y mucho más. Crea héroes de fantasía de D&D a partir de una gran selección de orígenes, clases y subclases para personajes. Explora ruinas antiguas y mazmorras letales, enfréntate a monstruos en tu búsqueda de tesoros legendarios y adquiere experiencia y poder mientras recorres territorios ignotos junto a tus compañeros.",
      price: 20000,
      stock: 2,
      categoryId: '11',
      sku: 'ROL001',
      productType: 'ProductType.single',
    ),

    // 013
    ProductModel(
      id: '13',
      title: 'Ranger Black/Blue - Adventure Dice',
      brand: brands[7],
      thumbnail: Images.productImage13,
      description:
          "Sigue el rastro de tu presa con este set oficial para Ranger, donde precisión, instinto y dominio de la naturaleza se reflejan en cada tirada. Sus tonos negro y azul acompañan a quienes avanzan con sigilo hacia lo desconocido.\n🎨 Características: Set de 14 dados en tonos negro y azul, diseñado para personajes Ranger de Dungeons & Dragons.\n🧾 Especificaciones: 2 d4, 4 d6, 2 d8, 2 d10, 1 d%, 1 d12 y 2 d20; 14 dados en total.\n💡 Consejo PiedraBruja: Guarda el set en un estuche o bandeja para proteger sus colores y mantenerlo listo para cada aventura.\n🎯 Ideal para: Jugadores de Dungeons & Dragons, personajes Ranger y coleccionistas de accesorios oficiales.",
      price: 10000,
      stock: 1,
      categoryId: '11',
      sku: 'ROL002',
      productType: 'ProductType.single',
    ),

    // 014
    ProductModel(
      id: '14',
      title: 'Shinto Saw Rasp, Esccofina Japonesa',
      brand: brands[7],
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

    // 015
    ProductModel(
      id: '15',
      title: 'Ranger Black/Blue - Adventure Dice',
      brand: brands[7],
      thumbnail: Images.productImage15a,
      description:
          "Utensilios de cocina Cascanueces, marco de metal resistente, base de madera diseñada y mango resistente, resistente y duradero.\nEl clip mecánico de nogal puede ajustar el tamaño del espacio (diámetro máximo de 4,5 CM), utilizando el principio de palanca, fácil de operar. Después de que se agrieta la piel de la nuez, la nuez puede parecer intacta, evitando desperdicios innecesarios.\nFácil de instalar y ampliamente utilizado: Instalado en una hermosa base de madera, fácil de colocar en el escritorio para garantizar un funcionamiento estable. Ideal para partir nueces duras y blandas como nueces, avellanas, nueces de Brasil, etc.\nAlta calidad La galleta está hecha de metal resistente con una atractiva base de madera y empuñadura, sólida y duradera, que brinda un rendimiento confiable y una larga vida útil.\nBase de madera El montaje en una hermosa base de madera dura es fácil de colocar en el escritorio y garantiza un funcionamiento estable",
      price: 30000,
      stock: 2,
      categoryId: '10',
      sku: 'TOOL001',
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
      title: 'Emperor of Mankind',
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
