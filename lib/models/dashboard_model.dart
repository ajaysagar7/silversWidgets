class DashboardMOdel {
  List<PremiumAds>? premiumAds;
  List<RecentAds>? recentAds;

  DashboardMOdel({this.premiumAds, this.recentAds});

  DashboardMOdel.fromJson(Map<String, dynamic> json) {
    if (json['PremiumAds'] != null) {
      premiumAds = <PremiumAds>[];
      json['PremiumAds'].forEach((v) {
        premiumAds!.add(PremiumAds.fromJson(v));
      });
    }
    if (json['RecentAds'] != null) {
      recentAds = <RecentAds>[];
      json['RecentAds'].forEach((v) {
        recentAds!.add(RecentAds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (premiumAds != null) {
      data['PremiumAds'] = premiumAds!.map((v) => v.toJson()).toList();
    }
    if (recentAds != null) {
      data['RecentAds'] = recentAds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PremiumAds {
  String? sId;
  String? category;
  String? subCategory;
  String? description;
  List<String>? specialMention;
  String? title;
  List<String>? imageUrl;
  String? adStatus;
  String? adType;
  String? adExpireDate;
  bool? isPrime;
  Dist? dist;
  String? sellerId;
  String? sellerJoined;
  String? sellerImage;
  String? sellerName;
  String? price;

  PremiumAds(
      {this.sId,
      this.category,
      this.subCategory,
      this.description,
      this.specialMention,
      this.title,
      this.imageUrl,
      this.adStatus,
      this.adType,
      this.adExpireDate,
      this.isPrime,
      this.dist,
      this.sellerId,
      this.sellerJoined,
      this.sellerImage,
      this.sellerName,
      this.price});

  PremiumAds.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    subCategory = json['sub_category'];
    description = json['description'];
    specialMention = json['special_mention'].cast<String>();
    title = json['title'];
    imageUrl = json['image_url'].cast<String>();
    adStatus = json['ad_status'];
    adType = json['ad_type'];
    adExpireDate = json['ad_expire_date'];
    isPrime = json['isPrime'];
    dist = json['dist'] != null ? Dist.fromJson(json['dist']) : null;
    sellerId = json['Seller_Id'];
    sellerJoined = json['Seller_Joined'];
    sellerImage = json['Seller_Image'];
    sellerName = json['Seller_Name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['category'] = category;
    data['sub_category'] = subCategory;
    data['description'] = description;
    data['special_mention'] = specialMention;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['ad_status'] = adStatus;
    data['ad_type'] = adType;
    data['ad_expire_date'] = adExpireDate;
    data['isPrime'] = isPrime;
    if (dist != null) {
      data['dist'] = dist!.toJson();
    }
    data['Seller_Id'] = sellerId;
    data['Seller_Joined'] = sellerJoined;
    data['Seller_Image'] = sellerImage;
    data['Seller_Name'] = sellerName;
    data['price'] = price;
    return data;
  }
}

class Dist {
  double? calculated;
  Location? location;

  Dist({this.calculated, this.location});

  Dist.fromJson(Map<String, dynamic> json) {
    calculated = json['calculated'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['calculated'] = calculated;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class RecentAds {
  String? sId;
  String? category;
  String? subCategory;
  String? description;
  List<String>? specialMention;
  String? title;
  List<String>? imageUrl;
  String? adStatus;
  String? adType;
  String? adExpireDate;
  bool? isPrime;
  Dist? dist;
  String? sellerId;
  String? sellerJoined;
  String? sellerImage;
  String? sellerName;
  String? price;

  RecentAds(
      {this.sId,
      this.category,
      this.subCategory,
      this.description,
      this.specialMention,
      this.title,
      this.imageUrl,
      this.adStatus,
      this.adType,
      this.adExpireDate,
      this.isPrime,
      this.dist,
      this.sellerId,
      this.sellerJoined,
      this.sellerImage,
      this.sellerName,
      this.price});

  RecentAds.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    subCategory = json['sub_category'];
    description = json['description'];
    specialMention = json['special_mention'].cast<String>();
    title = json['title'];
    imageUrl = json['image_url'].cast<String>();
    adStatus = json['ad_status'];
    adType = json['ad_type'];
    adExpireDate = json['ad_expire_date'];
    isPrime = json['isPrime'];
    dist = json['dist'] != null ? Dist.fromJson(json['dist']) : null;
    sellerId = json['Seller_Id'];
    sellerJoined = json['Seller_Joined'];
    sellerImage = json['Seller_Image'];
    sellerName = json['Seller_Name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['category'] = category;
    data['sub_category'] = subCategory;
    data['description'] = description;
    data['special_mention'] = specialMention;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['ad_status'] = adStatus;
    data['ad_type'] = adType;
    data['ad_expire_date'] = adExpireDate;
    data['isPrime'] = isPrime;
    if (dist != null) {
      data['dist'] = dist!.toJson();
    }
    data['Seller_Id'] = sellerId;
    data['Seller_Joined'] = sellerJoined;
    data['Seller_Image'] = sellerImage;
    data['Seller_Name'] = sellerName;
    data['price'] = price;
    return data;
  }
}
