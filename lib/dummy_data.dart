import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/models/product_variation_model.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/constants/images.dart';

class DummyData {


  /// List of all Categories
  static final List<CategoryModel> categories = [
    /// Parent Categories
    CategoryModel(id: '1', name: 'Warhammer', image: Images.warhammer, isFeatured: true),
    CategoryModel(id: '2', name: 'Pokemon', image: Images.pokemon, isFeatured: true),
    CategoryModel(id: '3', name: 'One Piece', image: Images.onePiececTcg, isFeatured: true),
    CategoryModel(id: '4', name: 'Lego', image: Images.lego, isFeatured: true),
    CategoryModel(id: '5', name: 'Hotwheels', image: Images.hotwheels, isFeatured: true),
    CategoryModel(id: '6', name: 'Dudu Bubu', image: Images.dubuBubu, isFeatured: true),
    CategoryModel(id: '7', name: 'Gamer', image: Images.gamming, isFeatured: true),
    
    /// Gamer
    CategoryModel(id: '8', name: 'Video Card', image: Images.videoCard, parentId: '7', isFeatured: false),
    CategoryModel(id: '9', name: 'Ram', image: Images.memoryRam, parentId: '7', isFeatured: false),

    /// Pokemon
    CategoryModel(id: '10', name: 'Pokemon TCG', image: Images.pokemonTcg, parentId: '2', isFeatured: false),
  ];


  /// List of all Banners
  static final List<BannerModel> banners = [

    // BannerModel(imageUrl: Images.homeBanner0, targetScreen: Routes.order, active: true),
    BannerModel(imageUrl: Images.homeBanner1, targetScreen: Routes.order, active: true),
    BannerModel(imageUrl: Images.homeBanner2, targetScreen: Routes.cart, active: true),
    BannerModel(imageUrl: Images.homeBanner3, targetScreen: Routes.wishlist, active: true),
    BannerModel(imageUrl: Images.homeBanner4, targetScreen: Routes.wishlist, active: true),


  ];


  /// List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: Images.warhammerBrandLogo,
        name: 'Warhammer',
        productsCount: 20,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: Images.legoBrandLogo,
        name: 'Lego',
        productsCount: 100,
        isFeatured: true),
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
        images: [Images.productImage1b, Images.productImage1c, Images.productImage1d,Images.productImage1e],
        description:
            "Este glorioso guerrero está equipado con una espada y una armadura que son reliquias. Es un consumado maestro del combate que se abre paso entre las filas enemigas en busca de un adversario digno de él. Ten en cuenta que puedes montar esta miniatura con el escudo o con el estandarte. Miniatura de resina de alta calidad a escala Primaris con peana escénica de 32 mm.Las miniaturas requieren montaje y pintura (utiliza únicamente superpegamento de cianoacrilato).",
        brand: brands[0],
        salePrice: 0,
        sku: 'A915',
        categoryId: '1',
        productType: 'ProductType.single'),

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
        sku: 'ZC2210',
        categoryId: '1',
        productType: 'ProductType.single'),

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
        productType: 'ProductType.single'),

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
        productType: 'ProductType.single'),

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
        productType: 'ProductType.single'),

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
        productType: 'ProductType.single'),

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
      productType: 'ProductType.single'),

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
      productType: 'ProductType.single'),

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
      productType: 'ProductType.single'),

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
        productType: 'ProductType.single'),

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
        images: [Images.productImage11b, Images.productImage11c, Images.productImage11d],
        sku: 'WAR02',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(name: 'Model',values: ['Brutalis Dreadnought', 'Ballistus Dreadnought', 'Primaris Redemptor Dreadnought']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 1,
              price: 15000,
              image: Images.productImage11b,
              description: 'El Brutalis Dreadnought es un rompelíneas y un arma de terror: un andador de combate bípedo, armado para el combate cuerpo a cuerpo y pilotado por un héroe caído de su Capítulo. Esta imponente máquina de guerra desata una lluvia de fuego de cobertura mientras avanza hacia las líneas enemigas, pero la mayor amenaza reside en sus enormes brazos. Equipados con puños aplastantes o garras recubiertas de ceramita, estos pueden aplastar a un guerrero acorazado como si fuera fruta podrida o atravesar la pared de un búnker como si fuera pergamino. Este kit de plástico multicomponente permite construir un Brutalis Dreadnought, una imponente máquina de guerra centrada en el combate cuerpo a cuerpo. ',
              attributeValues: {'Model': 'Brutalis Dreadnought'},
              sku: 'WAR02a'),
              
          ProductVariationModel(
              id: '2',
              stock: 1,
              price: 25000,
              image: Images.productImage11c,
              description: 'El Dreadnought Ballistus es una torreta andante. En el interior de un sarcófago blindado, en el corazón de este andador de combate, reposan los restos mortales de un héroe caído del Capítulo. Este guerrero eterno pilota su imponente máquina de guerra mediante una red de enlaces neuronales, apuntando a la armadura enemiga o a la infantería de élite con baterías de devastadoras armas pesadas. Este kit de plástico multicomponente permite construir un Dreadnought Ballistus, una aterradora máquina de guerra repleta de armamento de largo alcance. Este poderoso andador de combate cuenta con bólteres de asalto gemelos montados en su parte frontal y está equipado con un conjunto de cañones láser.',
              attributeValues: {'Model': 'Ballistus Dreadnought'},
              sku: 'WAR02b'),

          ProductVariationModel(
              id: '3',
              stock: 1,
              price: 35000,
              image: Images.productImage11d,
              description: 'Los Dreadnoughts Redemptor son máquinas de guerra gigantescas que trituran huesos y hacen añicos cráneos mientras se abren paso a golpes entre las filas enemigas. Más altos, anchos y de construcción más ingeniosa que los Dreadnoughts de diseño tradicional, estos colosos del combate funcionan gracias a reactores de hiperdensidad y sofisticados haces de fibra. Son capaces de pasar de una pisada pesada y retumbante a una zancada atronadora que hace temblar el suelo, avanzando a toda velocidad entre lluvias de fuego con un desafío glorioso. El diseño de los enlaces neuronales del Redemptor es tan prodigioso que su piloto, a pesar de estar encerrado en el sarcófago situado en el pecho del Dreadnought, puede controlarlo con una destreza y velocidad sorprendentes.\nEste kit de plástico multicomponente contiene las piezas necesarias para montar un Dreadnought Redemptor Primaris.',
              attributeValues: {'Model': 'Primaris Redemptor Dreadnought'},
              sku: 'WAR02c'),
        ],
        productType: 'ProductType.variable'),
  ];

}