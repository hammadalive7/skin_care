
class AdminProduct {
  final String pName;
  final String pImage;
  final double pPrice;
  final String pDescription;
  final String pCategory;
  final String pUse;
  final String pTag;

  AdminProduct({
    required this.pName,
    required this.pImage,
    required this.pPrice,
    required this.pDescription,
    required this.pCategory,
    required this.pUse,
    required this.pTag,
  });

  Map<String, dynamic> toMap(){
    return {
      'name': pName,
      'image': pImage,
      'price': pPrice,
      'description': pDescription,
      'category': pCategory,
      'use': pUse,
      'tags': pTag,
    };
  }

  factory AdminProduct.fromMap(Map<String, dynamic> map){
    return AdminProduct(
      pName: map['name'],
      pImage: map['image'],
      pPrice: map['price'],
      pDescription: map['description'],
      pCategory: map['category'],
      pUse: map['use'],
      pTag: map['tags'],
    );
  }


}
