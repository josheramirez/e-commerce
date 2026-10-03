import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;
  String? size;

  ProductModel(
    {
      required this.id,
      required this.title,
      required this.stock,
      required this.price,
      required this.thumbnail,
      required this.productType,
      this.sku,
      this.brand,
      this.date,
      this.images,
      this.salePrice = 0.0,
      this.isFeatured,
      this.productVariations,
      this.description,
      this.productAttributes,
      this.categoryId,
      this.size
    });

  static ProductModel empty() => ProductModel(id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');

  Map<String, dynamic> toJson() {
    return {
      'sku': sku,
      'title': title,
      'stock': stock,
      'price': price,
      'images': images ?? [],
      'thumbnail': thumbnail,
      'salePrice': salePrice,
      'isFeatured': isFeatured,
      'categoryId': categoryId,
      'brand': brand!.toJson(),
      'description': description,
      'productType': productType,
      'productAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'productVariations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
      'date' : date
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data()!.isEmpty && document.data() == null) return ProductModel.empty();

    final data = document.data()!;
    return ProductModel(
        id: document.id,
        title: data['Title'] ?? '',
        stock: data['Stock'] ?? 0,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        productType: data['ProductType'] ?? '',
        sku: data['Sku'] ?? '',
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        isFeatured: data['IsFeatured'] ?? false,
        brand: BrandModel.fromJson(data['Brand']),
        description: data['Description'] ?? '',
        categoryId: data['CategoryId'] ?? '',
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        // productAttributes:data['productAttributes']?(data['productAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList():null,
        // productVariations:data['productVariations']?(data['productVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList():null,
        date: data['date'] != null ? (data['date'] as Timestamp).toDate() : null
    );
  }

  // Map json-oriented document snapshot from firebase to model
  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data()! as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data['title'] ?? '',
      stock: data['stock'] ?? 0,
      price: double.parse((data['price'] ?? 0.0).toString()),
      thumbnail: data['thumbnail'] ?? '',
      productType: data['productType'] ?? '',
      sku: data['sku'] ?? '',
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
      isFeatured: data['isFeatured'] ?? false,
      brand: BrandModel.fromJson(data['brand']),
      description: data['description'] ?? '',
      categoryId: data['categoryId'] ?? '',
      images: data['images'] != null ? List<String>.from(data['images']) : [],
      productAttributes:
          (data['productAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations:
          (data['productVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
        date: data['date'] != null ? (data['date'] as Timestamp).toDate() : null
    );
  }
  
}