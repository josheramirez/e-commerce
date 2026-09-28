class StoreModel {
  String id;
  String name;
  String address;

  StoreModel({
    required this.id,
    required this.name,
    required this.address,
  });

  static StoreModel empty() => StoreModel(id: '', name: '', address: '');

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
      'address': address,
    };
  }

  @override
  String toString() {
    return '$id, $name, $address';
  }

  factory StoreModel.fromJson(Map<String, dynamic> document){
    final data = document;
    if(data.isEmpty) return StoreModel.empty();

    return StoreModel(
        id: data['Id'],
        name: data['name'],
        address: data['address'],
    );
  }
}