

class AssetData {
  int? status;
  bool? success;
  String? message;
  List<Data>? data;

  AssetData({this.status, this.success, this.message, this.data});

  AssetData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? isDefault;
  int? isPaid;
  int? frameTypeId;
  int? politicalPartyId;
  String? politicalPartyName;
  String? politicalPartyShortname;
  String? politicalPartyLogo;
  String? frameTypeName;
  int? categoryId;
  String? categoryName;
  String? name;
  String? businessName;
  String? tagline;
  String? mobileNo;
  String? mobileNo2;
  String? email;
  String? website;
  String? address;
  String? logo;
  String? businessImage;
  String? socialIcones;
  String? createdAt;
  Post? post;
  Post? story;

  Data(
      {this.id,
      this.isDefault,
      this.isPaid,
      this.frameTypeId,
      this.politicalPartyId,
      this.politicalPartyName,
      this.politicalPartyShortname,
      this.politicalPartyLogo,
      this.frameTypeName,
      this.categoryId,
      this.categoryName,
      this.name,
      this.businessName,
      this.tagline,
      this.mobileNo,
      this.mobileNo2,
      this.email,
      this.website,
      this.address,
      this.logo,
      this.businessImage,
      this.socialIcones,
      this.createdAt,
      this.post,
      this.story});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isDefault = json['is_default'];
    isPaid = json['is_paid'];
    frameTypeId = json['frame_type_id'];
    politicalPartyId = json['political_party_id'];
    politicalPartyName = json['political_party_name'];
    politicalPartyShortname = json['political_party_shortname'];
    politicalPartyLogo = json['political_party_logo'];
    frameTypeName = json['frame_type_name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    name = json['name'];
    businessName = json['business_name'];
    tagline = json['tagline'];
    mobileNo = json['mobile_no'];
    mobileNo2 = json['mobile_no_2'];
    email = json['email'];
    website = json['website'];
    address = json['address'];
    logo = json['logo'];
    businessImage = json['business_image'];
    socialIcones = json['social_icones'];
    createdAt = json['created_at'];
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
    story = json['story'] != null ? new Post.fromJson(json['story']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_default'] = this.isDefault;
    data['is_paid'] = this.isPaid;
    data['frame_type_id'] = this.frameTypeId;
    data['political_party_id'] = this.politicalPartyId;
    data['political_party_name'] = this.politicalPartyName;
    data['political_party_shortname'] = this.politicalPartyShortname;
    data['political_party_logo'] = this.politicalPartyLogo;
    data['frame_type_name'] = this.frameTypeName;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['name'] = this.name;
    data['business_name'] = this.businessName;
    data['tagline'] = this.tagline;
    data['mobile_no'] = this.mobileNo;
    data['mobile_no_2'] = this.mobileNo2;
    data['email'] = this.email;
    data['website'] = this.website;
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['business_image'] = this.businessImage;
    data['social_icones'] = this.socialIcones;
    data['created_at'] = this.createdAt;
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    if (this.story != null) {
      data['story'] = this.story!.toJson();
    }
    return data;
  }
}

class Post {
  List<Custom>? custom;
  List<General>? general;

  Post({this.custom, this.general});

  Post.fromJson(Map<String, dynamic> json) {
    if (json['custom'] != null) {
      custom = <Custom>[];
      json['custom'].forEach((v) {
        custom!.add(new Custom.fromJson(v));
      });
    }
    if (json['general'] != null) {
      general = <General>[];
      json['general'].forEach((v) {
        general!.add(new General.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.custom != null) {
      data['custom'] = this.custom!.map((v) => v.toJson()).toList();
    }
    if (this.general != null) {
      data['general'] = this.general!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Custom {
  int? id;
  String? image;

  Custom({this.id, this.image});

  Custom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class General {
  int? id;
  String? thumbImage;
  String? image;
  String? name;
  int? width;
  int? height;
  String? ratio;
  List<Layer>? layer;
  SocialIcon? socialIcon;
  Logo? logo;

  General(
      {this.id,
      this.thumbImage,
      this.image,
      this.name,
      this.width,
      this.height,
      this.ratio,
      this.layer,
      this.socialIcon,
      this.logo});

  General.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbImage = json['thumb_image'];
    image = json['image'];
    name = json['name'];
    width = json['width'];
    height = json['height'];
    ratio = json['ratio'];
    if (json['layer'] != null) {
      layer = <Layer>[];
      json['layer'].forEach((v) {
        layer!.add(new Layer.fromJson(v));
      });
    }
    socialIcon = json['social_icon'] != null
        ? new SocialIcon.fromJson(json['social_icon'])
        : null;
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['thumb_image'] = this.thumbImage;
    data['image'] = this.image;
    data['name'] = this.name;
    data['width'] = this.width;
    data['height'] = this.height;
    data['ratio'] = this.ratio;
    if (this.layer != null) {
      data['layer'] = this.layer!.map((v) => v.toJson()).toList();
    }
    if (this.socialIcon != null) {
      data['social_icon'] = this.socialIcon!.toJson();
    }
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    return data;
  }
}

class Layer {
  int? posx;
  int? posy;
  int? width;
  int? height;
  String? align;
  int? textWidth;
  int? textHeight;
  String? text;
  String? fontName;
  String? textColor;
  String? textMargin;
  int? maxLine;
  int? fontSize;
  String? overlayColor;
  int? iconWidth;
  int? iconHeight;
  String? resource;
  String? resType;
  bool? web;
  String? webImage;

  Layer(
      {this.posx,
      this.posy,
      this.width,
      this.height,
      this.align,
      this.textWidth,
      this.textHeight,
      this.text,
      this.fontName,
      this.textColor,
      this.textMargin,
      this.maxLine,
      this.fontSize,
      this.overlayColor,
      this.iconWidth,
      this.iconHeight,
      this.resource,
      this.resType,
      this.web,
      this.webImage});

  Layer.fromJson(Map<String, dynamic> json) {
    posx = json['posx'];
    posy = json['posy'];
    width = json['width'];
    height = json['height'];
    align = json['align'];
    textWidth = json['text_width'];
    textHeight = json['text_height'];
    text = json['text'];
    fontName = json['font_name'];
    textColor = json['text_color'];
    textMargin = json['text_margin'];
    maxLine = json['max_line'];
    fontSize = json['font_size'];
    overlayColor = json['overlay_color'];
    iconWidth = json['icon_width'];
    iconHeight = json['icon_height'];
    resource = json['resource'];
    resType = json['res_type'];
    web = json['web'];
    webImage = json['web_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['posx'] = this.posx;
    data['posy'] = this.posy;
    data['width'] = this.width;
    data['height'] = this.height;
    data['align'] = this.align;
    data['text_width'] = this.textWidth;
    data['text_height'] = this.textHeight;
    data['text'] = this.text;
    data['font_name'] = this.fontName;
    data['text_color'] = this.textColor;
    data['text_margin'] = this.textMargin;
    data['max_line'] = this.maxLine;
    data['font_size'] = this.fontSize;
    data['overlay_color'] = this.overlayColor;
    data['icon_width'] = this.iconWidth;
    data['icon_height'] = this.iconHeight;
    data['resource'] = this.resource;
    data['res_type'] = this.resType;
    data['web'] = this.web;
    data['web_image'] = this.webImage;
    return data;
  }
}

class SocialIcon {
  int? posx;
  int? posy;
  int? width;
  int? height;
  int? iconWidth;
  int? iconHeight;
  String? iconMargin;
  String? alignment;
  String? orientation;

  SocialIcon(
      {this.posx,
      this.posy,
      this.width,
      this.height,
      this.iconWidth,
      this.iconHeight,
      this.iconMargin,
      this.alignment,
      this.orientation});

  SocialIcon.fromJson(Map<String, dynamic> json) {
    posx = json['posx'];
    posy = json['posy'];
    width = json['width'];
    height = json['height'];
    iconWidth = json['icon_width'];
    iconHeight = json['icon_height'];
    iconMargin = json['icon_margin'];
    alignment = json['alignment'];
    orientation = json['orientation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['posx'] = this.posx;
    data['posy'] = this.posy;
    data['width'] = this.width;
    data['height'] = this.height;
    data['icon_width'] = this.iconWidth;
    data['icon_height'] = this.iconHeight;
    data['icon_margin'] = this.iconMargin;
    data['alignment'] = this.alignment;
    data['orientation'] = this.orientation;
    return data;
  }
}

class Logo {
  int? posx;
  int? posy;
  int? width;
  int? height;
  int? opacity;
  bool? size;
  String? text;
  String? fontName;
  String? textColor;
  String? align;
  int? fontSize;

  Logo(
      {this.posx,
      this.posy,
      this.width,
      this.height,
      this.opacity,
      this.size,
      this.text,
      this.fontName,
      this.textColor,
      this.align,
      this.fontSize});

  Logo.fromJson(Map<String, dynamic> json) {
    posx = json['posx'];
    posy = json['posy'];
    width = json['width'];
    height = json['height'];
    opacity = json['opacity'];
    size = json['size'];
    text = json['text'];
    fontName = json['font_name'];
    textColor = json['text_color'];
    align = json['align'];
    fontSize = json['font_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['posx'] = this.posx;
    data['posy'] = this.posy;
    data['width'] = this.width;
    data['height'] = this.height;
    data['opacity'] = this.opacity;
    data['size'] = this.size;
    data['text'] = this.text;
    data['font_name'] = this.fontName;
    data['text_color'] = this.textColor;
    data['align'] = this.align;
    data['font_size'] = this.fontSize;
    return data;
  }
}