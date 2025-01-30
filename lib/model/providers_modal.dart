// ignore_for_file: prefer_typing_uninitialized_variables

class ProviderListModel {
  List<Provider>? data;
  ProviderListModel({
    this.data,
  });

  ProviderListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Provider>[];
      json['data'].forEach((v) {
        data?.add( Provider.fromJson(v));
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

class Provider {
  int? id,sectionId,userId,delivery,rateCount,userFav;
  String? title,image,desc,type,addresText,locationText,price,
  fromTime,toTime,amFrom,amTo,pmFrom,pmTo,personCount,categoryName;
  double? latitude,longitude,rateAvg;
  var categories,packages,images,services,sectionsData;

    

  Provider({this.id,this.sectionId,this.userId,this.delivery,this.rateCount,this.userFav,this.
    title,this.image,this.desc,this.type,this.addresText,
    this.locationText,this.price,this.fromTime,this.toTime,
    this.amFrom,this.amTo,this.pmFrom,this.pmTo,this.personCount,this.
    latitude,this.longitude,this.rateAvg,this.categoryName,this.
    categories,this.packages,this.images,this.services,this.sectionsData
  });

  Provider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = int.parse(json['section_id'].toString());
    userId = int.parse(json['user_id'].toString());
    delivery = json['delivery']!= null? int.parse(json['delivery'].toString()):0;
    rateCount = int.parse(json['rate_count'].toString());
    userFav = int.parse(json['user_fav'].toString());
    // string
    title = json['title'].toString();
    desc = json['desc'].toString();
    image = json['image_url'].toString();
    type = json['type'].toString();
    addresText = json['addres_text'].toString();
    locationText = json['location_text'].toString();
    price = json['price_text'].toString();
    fromTime = json['from_time_string'].toString();
    toTime = json['to_time_string'].toString();
    amFrom = json['am_from'].toString();
    amTo = json['am_to'].toString();
    pmFrom = json['pm_from'].toString();
    pmTo = json['pm_to'].toString();
    personCount = json['person_count'].toString();
    categoryName = json['category_name'].toString();

    // doblue
    latitude = double.parse(json['latitude'].toString());
    longitude = double.parse(json['longitude'].toString());
    rateAvg = double.parse(json['rate_avg'].toString());
    // vars
    categories = json['categories'];
    packages = json['packages'];
    images = json['images'];
    services = json['services'];
    sectionsData = json['section'];
    

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    
    data['id'] =id;
    data['sectionId'] =sectionId;
    data['userId'] =userId;
    data['delivery'] =delivery;
    data['rateCount'] =rateCount;
    data['userFav'] =userFav;
    data['title'] =title;
    data['image'] =image;
    data['desc'] =desc;
    data['type'] =type;
    data['addresText'] =addresText;
    data['locationText'] =locationText;
    data['price'] =price;
    data['fromTime'] =fromTime;
    data['toTime'] =toTime;
    data['amFrom'] =amFrom;
    data['amTo'] =amTo;
    data['pmFrom'] =pmFrom;
    data['pmTo'] =pmTo;
    data['personCount'] =personCount;
    data['latitude'] =latitude;
    data['longitude'] =longitude;
    data['rateAvg'] =rateAvg;
    data['categories'] =categories;
    data['packages'] =packages;
    data['images'] =images;
    data['services'] =services;
    data['categoryName'] =categoryName;
    data['sectionsData'] =sectionsData;
    
    
    return data;
  }
}
