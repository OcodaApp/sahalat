// ignore_for_file: prefer_typing_uninitialized_variables

class BasketsListModel {
  List<Basket>? basket;
  BasketsListModel({
    this.basket,
  });

  BasketsListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      basket = <Basket>[];
      json['data'].forEach((v) {
        basket?.add( Basket.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};

    if (basket != null) {
      data['data'] = basket?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Basket {

  int ? id,providerId,userid,productid,providersectionid,productsizeid,productadditionid,quantity,sale,providerserviceid;
  String? date,time,amorpm,addrestext,note,type,productimageurl,providername,datestring,productdesc,inorout,
  providersectionname,providerservicename,providersectiontype,productname,sizename,addname,username,amorpmtime,timestring,providerimage;
  double? choosesizetotal,chooseadditiontotal,choosesizeprice,chooseadditionprice,
  latitude,longitude,price,deliveryprice,total,alltotal,sizeprice,addprice;
  bool? isservices;
  var user,product,provider,section,services;

  Basket({
    this.id,this.providerId,this.userid,this.productid,this.providersectionid,this.productsizeid,this.productadditionid,this.quantity,this.sale,
    this.date,this.time,this.amorpm,this.addrestext,this.note,this.type,this.productimageurl,this.providername,this.providersectionname,
    this.providerservicename,this.providersectiontype,this.productname,this.sizename,this.addname,this.username,this.amorpmtime,this.timestring,
    this.choosesizetotal,this.chooseadditiontotal,this.choosesizeprice,this.chooseadditionprice,this.latitude,
    this.longitude,this.price,this.deliveryprice,this.total,this.alltotal,this.sizeprice,this.addprice,this.isservices,this.inorout,
    this.user,this.product,this.provider,this.section,this.services,this.providerimage,this.providerserviceid,this.datestring,this.productdesc
  });
  

  
  Basket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerId= json['provider_id'] != null? int.parse(json['provider_id'].toString()):0;
    providerserviceid= json['provider_service_id'] != null? int.parse(json['provider_service_id'].toString()):0;
    userid= json['user_id'] != null? int.parse(json['user_id'].toString()):0;
    productid= json['product_id'] != null? int.parse(json['product_id'].toString()):0;
    providersectionid= json['provider_section_id'] != null? int.parse(json['provider_section_id'].toString()):0;
    productsizeid= json['product_size_id'] != null? int.parse(json['product_size_id'].toString()):0;
    productadditionid= json['product_addition_id'] != null? int.parse(json['product_addition_id'].toString()):0;
    quantity= json['quantity'] != null? int.parse(json['quantity'].toString()):0;
    sale= json['sale'] != null? int.parse(json['sale'].toString()):0;
    // string
    date= json['date'].toString();
    datestring= json['date_string'].toString();
    
    time= json['time'].toString();
    amorpm= json['am_or_pm'].toString();
    addrestext= json['addres_text'].toString();
    note= json['note'].toString();
    type= json['type'].toString();
    productimageurl= json['product_image_url'].toString();
    providername= json['provider_name'].toString();
    providersectionname= json['provider_section_name'].toString();
    providerservicename= json['provider_service_name'].toString();
    providersectiontype= json['provider_section_type'].toString();
    productname= json['product_name'].toString();
    productdesc= json['product_desc'].toString();
    sizename= json['size_name'].toString();
    addname= json['add_name'].toString();
    username= json['user_name'].toString();
    amorpmtime= json['am_or_pm_time'].toString();
    timestring= json['time_string'].toString();
    providerimage= json['provider_image'].toString();
    inorout= json['in_or_out'].toString();

    
    
    // doblue
    choosesizetotal= json['choose_size_total'] != null? double.parse(json['choose_size_total'].toString()):0.0;
    chooseadditiontotal= json['choose_addition_total'] != null? double.parse(json['choose_addition_total'].toString()):0.0;
    choosesizeprice= json['choose_size_price'] != null? double.parse(json['choose_size_price'].toString()):0.0;
    chooseadditionprice= json['choose_addition_price'] != null? double.parse(json['choose_addition_price'].toString()):0.0;
    latitude= json['latitude'] != null? double.parse(json['latitude'].toString()):0.0;
    longitude= json['longitude'] != null? double.parse(json['longitude'].toString()):0.0;
    price= json['price'] != null? double.parse(json['price'].toString()):0.0;
    deliveryprice= json['delivery_price'] != null? double.parse(json['delivery_price'].toString()):0.0;
    total= json['total'] != null? double.parse(json['total'].toString()):0.0;
    alltotal= json['all_total'] != null? double.parse(json['all_total'].toString()):0.0;
    sizeprice= json['size_price'] != ""? double.parse(json['size_price'].toString()):0.0;
    addprice= json['add_price'] != ""? double.parse(json['add_price'].toString()):0.0;

    // bool
    isservices= json['is_services'] != null? true:false;

    // vars
    user= json['user'];
    product= json['product'];
    provider= json['provider'];
    section= json['section'];
    services= json['services'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = id;
      data['providerId'] = providerId;
      data['userid'] = userid;
      data['productid'] = productid;
      data['providersectionid'] = providersectionid;
      data['productsizeid'] = productsizeid;
      data['productadditionid'] = productadditionid;
      data['quantity'] = quantity;
      data['providerserviceid'] = providerserviceid;
      data['sale'] = sale;
      data['date'] = date;
      data['time'] = time;
      data['amorpm'] = amorpm;
      data['addrestext'] = addrestext;
      data['note'] = note;
      data['type'] = type;
      data['productimageurl'] = productimageurl;
      data['providername'] = providername;
      data['providersectionname'] = providersectionname;
      data['providerservicename'] = providerservicename;
      data['providersectiontype'] = providersectiontype;
      data['productname'] = productname;
      data['sizename'] = sizename;
      data['addname'] = addname;
      data['username'] = username;
      data['amorpmtime'] = amorpmtime;
      data['timestring'] = timestring;
      data['choosesizetotal'] = choosesizetotal;
      data['chooseadditiontotal'] = chooseadditiontotal;
      data['choosesizeprice'] = choosesizeprice;
      data['chooseadditionprice'] = chooseadditionprice;
      data['latitude'] = latitude;
      data['longitude'] = longitude;
      data['price'] = price;
      data['deliveryprice'] = deliveryprice;
      data['total'] = total;
      data['alltotal'] = alltotal;
      data['sizeprice'] = sizeprice;
      data['addprice'] = addprice;
      data['isservices'] = isservices;
      data['user'] = user;
      data['product'] = product;
      data['provider'] = provider;
      data['section'] = section;
      data['services'] = services;
      data['providerimage'] = providerimage;
      data['datestring'] = datestring;
      data['productdesc'] = productdesc;
      data['inorout'] = inorout;
      
      
      
    return data;
  }
}
