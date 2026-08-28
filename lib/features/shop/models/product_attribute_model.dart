class ProductAttributeModel{
  String? name;
  final List<String>? values;

  ProductAttributeModel({
    this.name,
    this.values,
  });


  /// Json Format
  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'values': values
    };
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> document){
    final data = document;

    if(data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
        name: data.containsKey('name') ?  data['name'] : '',
        values:  List<String>.from(data['values'])
    );
  }

}