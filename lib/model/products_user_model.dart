// ignore_for_file: prefer_typing_uninitialized_variables

class ProductsUserListModel {
  List<Product>? data;
  ProductsUserListModel({
    this.data,
  });

  ProductsUserListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data?.add( Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};

    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id,sectionId,providerId,subSectionId;
  String? name,image,img,desc,sectionName;
  double? price;
  var sizes,additions,images;

  Product({this.id,this.sectionId, this.name,  this.image, this.sizes, this.additions,this.subSectionId,this.images,this.sectionName,this.img});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = int.parse(json['section_id'].toString());
    providerId = int.parse(json['provider_id'].toString());
    subSectionId = json['sub_section_id'] ?? 0;
    // string
    name = json['title'].toString();
    desc = json['description'].toString();
    image = json['image_url'].toString();
    img = json['image'].toString();
    sectionName = json['section_name'].toString();
    // doblue
    price = double.parse(json['price'].toString());

    // vars
    sizes = json['sizes'];
    additions = json['additions'];
    images = json['images'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sectionId'] = sectionId;
    data['providerId'] = providerId;
    data['name'] = name;
    data['desc'] = desc;
    data['image'] = image;
    data['price'] = price;
    data['subSectionId'] = subSectionId;
    data['images'] = images;
    data['sizes'] = sizes;
    data['additions'] = additions;
    data['sectionName'] = sectionName;
    data['img'] = img;
    return data;
  }
}
