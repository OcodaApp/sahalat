class SectionsListModel {
  List<Data>? data;
  SectionsListModel({
    this.data,
  });

  SectionsListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add( Data.fromJson(v));
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

class Data {
  int? id;
  String? title,titleP,type,icon;
  bool? isdesc, isimages, isproducts, iscategories,ispackages,
  isservices,isaddress, isopenclose,ispersoncount,isprice, isampm,
   ispackagecategory, ispackageimage;
  String? headertitle,dataname,descname,imagesname,categoriesdesc,
  categoriesname,categoryname,packagesname,packagename,servicesname,servicename;
  Data({this.id, this.title, this.icon, this.type,this.titleP,
    this.isdesc,this.isimages,this.isproducts,this.iscategories,this.ispackages,this.isservices,
    this.isaddress,this.isopenclose,this.ispersoncount,this.isprice,this.isampm,this.
    ispackagecategory,this.ispackageimage,
    this.headertitle,this.dataname,this.descname,this.imagesname,this.categoriesdesc,this.
    categoriesname,this.categoryname,this.packagesname,this.packagename,this.servicesname,this.servicename
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleP = json['title_p'];
    type = json['type'];
    icon = json['icon_url'];

    isdesc= json['is_desc'] == 'yes' ? true:false;
    isimages= json['is_images']== 'yes' ? true:false;
    isproducts= json['is_products']== 'yes' ? true:false;
    iscategories= json['is_categories']== 'yes' ? true:false;
    ispackages= json['is_packages']== 'yes' ? true:false;
    isservices= json['is_services']== 'yes' ? true:false;
    isaddress= json['is_address']== 'yes' ? true:false;
    isopenclose= json['is_open_close']== 'yes' ? true:false;
    ispersoncount= json['is_person_count']== 'yes' ? true:false;
    isprice= json['is_price']== 'yes' ? true:false;
    isampm= json['is_am_pm']== 'yes' ? true:false;
    ispackagecategory= json['is_package_category']== 'yes' ? true:false;
    ispackageimage= json['is_package_image']== 'yes' ? true:false;
    headertitle= json['header_title'];
    dataname= json['data_name'];
    descname= json['desc_name'];
    imagesname= json['images_name'];
    categoriesdesc= json['categories_desc'];
    categoriesname= json['categories_name'];
    categoryname= json['category_name'];
    packagesname= json['packages_name'];
    packagename= json['package_name'];
    servicesname= json['services_name'];
    servicename= json['service_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['titleP'] = titleP;
    data['type'] = type;
    data['icon'] = icon;

    data['isdesc'] =isdesc;
    data['isimages'] = isimages;
    data['isproducts'] = isproducts;
    data['iscategories'] = iscategories;
    data['ispackages'] =ispackages;
    data['isservices'] =isservices;
    data['isaddress'] =isaddress;
    data['isopenclose'] = isopenclose;
    data['ispersoncount'] =ispersoncount;
    data['isprice'] =isprice;
    data['isampm'] = isampm;
    data['ispackagecategory'] =ispackagecategory;
    data['ispackageimage'] = ispackageimage;
    data['headertitle'] =headertitle;
    data['dataname'] =dataname;
    data['descname'] =descname;
    data['imagesname'] =imagesname;
    data['categoriesdesc'] =categoriesdesc;
    data['categoriesname'] =categoriesname;
    data['categoryname'] =categoryname;
    data['packagesname'] =packagesname;
    data['packagename'] =packagename;
    data['servicesname'] =servicesname;
    data['servicename'] =servicename;

    
    return data;
  }
}
