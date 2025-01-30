class ProvicersListModel {
  List<Provicer>? data;
  ProvicersListModel({
    this.data,
  });

  ProvicersListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Provicer>[];
      json['data'].forEach((v) {
        data?.add( Provicer.fromJson(v));
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

class Provicer {
  int? id,sectionId,rateCount,userFav,userId,personCount;
  String? name,type,cover,desc,fromTime,toTime,time,
  delevryPrice,locationText,addresText,categoryName,shortDesc,
  amfrom,amto,pmfrom,pmto;
  double? lat,long,price,rateAvg;

  Provicer({this.id,this.sectionId, this.rateAvg, this.rateCount,this.personCount, this.userFav,
  this.name, this.type, this.cover,  this.desc, this.fromTime, this.toTime, this.time,
   this.delevryPrice,this.locationText,this.addresText,this.categoryName,this.shortDesc,
   this.amfrom,this.amto,this.pmfrom,this.pmto,
   this.lat,this.long,this.price});

  Provicer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    userId = json['user_id'];
    rateCount = json['rate_count'];
    userFav = json['user_fav'];
    personCount = json['person_count'];
    // string
    name = json['title'].toString();
    desc = json['desc'].toString();
    type = json['type'].toString();
    cover = json['image_url'].toString();
    fromTime = json['from_time_string'].toString();
    toTime = json['to_time_string'].toString();
    delevryPrice = json['delivery'].toString();
    locationText = json['location_text'].toString();
    addresText = json['addres_text'].toString();
    categoryName = json['category_name'].toString();
    shortDesc = json['short_desc'].toString();
    amfrom = json['am_from'].toString();
    amto = json['am_to'].toString();
    pmfrom = json['pm_from'].toString();
    pmto = json['pm_to'].toString();
    // doblue
    lat = double.parse(json['latitude'].toString());
    long = double.parse(json['longitude'].toString());
    price = double.parse(json['price'].toString());
    rateAvg = double.parse(json['rate_avg'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sectionId'] = sectionId;
    data['userId'] = userId;
    data['rateAvg'] = rateAvg;
    data['rateCount'] = rateCount;
    data['userFav'] = userFav;
    data['personCount'] = personCount;
    data['name'] = name;
    data['desc'] = desc;
    data['type'] = type;
    data['cover'] = cover;
    data['fromTime'] = fromTime;
    data['toTime'] = toTime;
    data['delevryPrice'] = delevryPrice;
    data['price'] = price;
    data['lat'] = lat;
    data['long'] = long;
    data['locationText'] = locationText;
    data['addresText'] = addresText;
    data['categoryName'] = categoryName;
    data['shortDesc'] = shortDesc;
    data['amfrom'] = amfrom;
    data['amto'] = amto;
    data['pmfrom'] = pmfrom;
    data['pmto'] = pmto;
    return data;
  }
}
