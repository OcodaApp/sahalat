class CategoriesListModel {
  List<Categories>? category;
  CategoriesListModel({
    this.category,
  });

  CategoriesListModel.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      category = <Categories>[];
      json['sections'].forEach((v) {
        category?.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (category != null) {
      data['sections'] = category?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id,providerSectionId;
  String? title,type,desc,price,image,providerSectionName,img;

  Categories({
    required this.id,
    required this.title,
    required this.type,
    this.desc,this.price,this.image,this.providerSectionId,this.providerSectionName,this.img
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerSectionId = json['provider_section_id'] != null? int.parse(json['provider_section_id'].toString()):0;
    title = json['title'].toString();
    type = json['type'].toString();
    desc = json['description'].toString();
    price = json['price'].toString();
    image = json['image_url'].toString();
    img = json['image'].toString();
    providerSectionName = json['provider_section_name'].toString();
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['desc'] = desc;
    data['price'] = price;
    data['image'] = image;
    data['providerSectionId'] = providerSectionId;
    data['providerSectionName'] = providerSectionName;
    data['img'] = img;
    return data;
  }
}
