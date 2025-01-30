class ServicesListModel {
  List<Services>? service;
  ServicesListModel({
    this.service,
  });

  ServicesListModel.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      service = <Services>[];
      json['services'].forEach((v) {
        service?.add(Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (service != null) {
      data['services'] = service?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id,providerSectionId;
  String? title,inOrOut,price,providerSectionName;

  Services({
    required this.id,
    required this.title,this.inOrOut,
    this.price,this.providerSectionId,this.providerSectionName
  });

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerSectionId = int.parse(json['section_id'].toString());
    title = json['title'].toString();
    inOrOut = json['in_or_out'].toString();
    price = json['price'].toString();
    providerSectionName = json['provider_section_name'].toString();
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['inOrOut'] = inOrOut;
    data['price'] = price;
    data['providerSectionId'] = providerSectionId;
    data['providerSectionName'] = providerSectionName;
    return data;
  }
}
