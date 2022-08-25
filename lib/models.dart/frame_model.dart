

// To parse this JSON data, do
//
//     final frameData = frameDataFromMap(jsonString);

import 'dart:convert';

class FrameData {
    FrameData({
        required   this.id,
        required   this.isDefault,
        required   this.isPaid,
        required   this.frameTypeId,
        required   this.politicalPartyId,
        required   this.politicalPartyName,
        required   this.politicalPartyShortname,
        required   this.politicalPartyLogo,
        required   this.frameTypeName,
        required   this.categoryId,
        required   this.categoryName,
        required   this.name,
        required   this.businessName,
        required   this.tagline,
        required   this.mobileNo,
        required   this.mobileNo2,
        required   this.email,
        required   this.website,
        required   this.address,
        required   this.logo,
        required   this.businessImage,
        required   this.socialIcones,
        required   this.createdAt,
        required   this.post,
        required   this.story,
    });

    int id;
    int isDefault;
    int isPaid;
    int frameTypeId;
    int politicalPartyId;
    String politicalPartyName;
    String politicalPartyShortname;
    String politicalPartyLogo;
    String frameTypeName;
    int categoryId;
    String categoryName;
    String name;
    String businessName;
    String tagline;
    String mobileNo;
    String mobileNo2;
    String email;
    String website;
    String address;
    String logo;
    String businessImage;
    String socialIcones;
    DateTime createdAt;
    Post post;
    Post story;

    factory FrameData.fromJson(String str) => FrameData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FrameData.fromMap(Map<String, dynamic> json) => FrameData(
        id: json["id"],
        isDefault: json["is_default"],
        isPaid: json["is_paid"],
        frameTypeId: json["frame_type_id"],
        politicalPartyId: json["political_party_id"],
        politicalPartyName: json["political_party_name"],
        politicalPartyShortname: json["political_party_shortname"],
        politicalPartyLogo: json["political_party_logo"],
        frameTypeName: json["frame_type_name"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        name: json["name"],
        businessName: json["business_name"],
        tagline: json["tagline"],
        mobileNo: json["mobile_no"],
        mobileNo2: json["mobile_no_2"],
        email: json["email"],
        website: json["website"],
        address: json["address"],
        logo: json["logo"],
        businessImage: json["business_image"],
        socialIcones: json["social_icones"],
        createdAt: DateTime.parse(json["created_at"]),
        post: Post.fromMap(json["post"]),
        story: Post.fromMap(json["story"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "is_default": isDefault,
        "is_paid": isPaid,
        "frame_type_id": frameTypeId,
        "political_party_id": politicalPartyId,
        "political_party_name": politicalPartyName,
        "political_party_shortname": politicalPartyShortname,
        "political_party_logo": politicalPartyLogo,
        "frame_type_name": frameTypeName,
        "category_id": categoryId,
        "category_name": categoryName,
        "name": name,
        "business_name": businessName,
        "tagline": tagline,
        "mobile_no": mobileNo,
        "mobile_no_2": mobileNo2,
        "email": email,
        "website": website,
        "address": address,
        "logo": logo,
        "business_image": businessImage,
        "social_icones": socialIcones,
        "created_at": createdAt.toIso8601String(),
        "post": post.toMap(),
        "story": story.toMap(),
    };
}

class Post {
    Post({
        required   this.custom,
        required   this.general,
    });

    List<Custom> custom;
    List<General> general;

    factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Post.fromMap(Map<String, dynamic> json) => Post(
        custom: List<Custom>.from(json["custom"].map((x) => Custom.fromMap(x))),
        general: List<General>.from(json["general"].map((x) => General.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "custom": List<dynamic>.from(custom.map((x) => x.toMap())),
        "general": List<dynamic>.from(general.map((x) => x.toMap())),
    };
}

class Custom {
    Custom({
        required   this.id,
        required   this.image,
    });

    int id;
    String image;

    factory Custom.fromJson(String str) => Custom.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Custom.fromMap(Map<String, dynamic> json) => Custom(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
    };
}

class General {
    General({
        required   this.id,
        required   this.thumbImage,
        required   this.image,
        required   this.name,
        required   this.width,
        required   this.height,
        required   this.ratio,
        required   this.layer,
        required   this.socialIcon,
        required   this.logo,
    });

    int id;
    String thumbImage;
    String image;
    String name;
    int width;
    int height;
    String ratio;
    List<Layer> layer;
    SocialIcon socialIcon;
    Logo logo;

    factory General.fromJson(String str) => General.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory General.fromMap(Map<String, dynamic> json) => General(
        id: json["id"],
        thumbImage: json["thumb_image"],
        image: json["image"],
        name: json["name"],
        width: json["width"],
        height: json["height"],
        ratio: json["ratio"],
        layer: List<Layer>.from(json["layer"].map((x) => Layer.fromMap(x))),
        socialIcon: SocialIcon.fromMap(json["social_icon"]),
        logo: Logo.fromMap(json["logo"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "thumb_image": thumbImage,
        "image": image,
        "name": name,
        "width": width,
        "height": height,
        "ratio": ratio,
        "layer": List<dynamic>.from(layer.map((x) => x.toMap())),
        "social_icon": socialIcon.toMap(),
        "logo": logo.toMap(),
    };
}

class Layer {
    Layer({
        required   this.posx,
        required   this.posy,
        required   this.width,
        required   this.height,
        // required   this.align,
        required   this.textWidth,
        required   this.textHeight,
        required   this.text,
        // required   this.fontName,
        // required   this.textColor,
        // required   this.textMargin,
        required   this.maxLine,
        required   this.fontSize,
        // required   this.overlayColor,
        required   this.iconWidth,
        required   this.iconHeight,
        // required   this.resource,
        // required   this.resType,
        required   this.web,
        required   this.webImage,
    });

    int posx;
    int posy;
    int width;
    int height;
    // Align align;
    int textWidth;
    int textHeight;
    String text;
    // FontName fontName;
    // Color textColor;
    // TextMargin textMargin;
    int maxLine;
    int fontSize;
    // Color overlayColor;
    int iconWidth;
    int iconHeight;
    // Resource resource;
    // ResType resType;
    bool web;
    String webImage;

    factory Layer.fromJson(String str) => Layer.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Layer.fromMap(Map<String, dynamic> json) => Layer(
        posx: json["posx"],
        posy: json["posy"],
        width: json["width"],
        height: json["height"],
        // align: alignValues.map[json["align"]],
        textWidth: json["text_width"],
        textHeight: json["text_height"],
        text: json["text"],
        // fontName: fontNameValues.map[json["font_name"]],
        // textColor: colorValues.map[json["text_color"]],
        // textMargin: textMarginValues.map[json["text_margin"]],
        maxLine: json["max_line"],
        fontSize: json["font_size"],
        // overlayColor: colorValues.map[json["overlay_color"]],
        iconWidth: json["icon_width"],
        iconHeight: json["icon_height"],
        // resource: resourceValues.map[json["resource"]],
        // resType: resTypeValues.map[json["res_type"]],
        web: json["web"],
        webImage: json["web_image"] == null ? null : json["web_image"],
    );

    Map<String, dynamic> toMap() => {
        "posx": posx,
        "posy": posy,
        "width": width,
        "height": height,
        // "align": alignValues.reverse[align],
        "text_width": textWidth,
        "text_height": textHeight,
        "text": text,
        // "font_name": fontNameValues.reverse[fontName],
        // "text_color": colorValues.reverse[textColor],
        // "text_margin": textMarginValues.reverse[textMargin],
        "max_line": maxLine,
        "font_size": fontSize,
        // "overlay_color": colorValues.reverse[overlayColor],
        "icon_width": iconWidth,
        "icon_height": iconHeight,
        // "resource": resourceValues.reverse[resource],
        // "res_type": resTypeValues.reverse[resType],
        "web": web,
        "web_image": webImage == null ? null : webImage,
    };
}

// enum Align { L, C, R }

// final alignValues = EnumValues({
//     "C": Align.C,
//     "L": Align.L,
//     "R": Align.R
// });

// enum FontName { CALIBRI_REGULAR }

// final fontNameValues = EnumValues({
//     "calibri_regular": FontName.CALIBRI_REGULAR
// });

// enum Color { THE_000000, FFFFFF, COLOR_FFFFFF }

// final colorValues = EnumValues({
//     "FFFFFF": Color.COLOR_FFFFFF,
//     "ffffff": Color.FFFFFF,
//     "000000": Color.THE_000000
// });

// enum ResType { PROFILE_NAME1, BUSINESS_NAME1, WEBSITE1, EMAIL1, MOBILE_NO1, ADDRESS1, TAGLINE1 }

// final resTypeValues = EnumValues({
//     "address1": ResType.ADDRESS1,
//     "business_name1": ResType.BUSINESS_NAME1,
//     "email1": ResType.EMAIL1,
//     "mobile_no1": ResType.MOBILE_NO1,
//     "profile_name1": ResType.PROFILE_NAME1,
//     "tagline1": ResType.TAGLINE1,
//     "website1": ResType.WEBSITE1
// });

// enum Resource { IC_PROFILE1, IC_BUSINESSNAME1, IC_WEBSITE1, IC_EMAIL1, IC_MOBILE_NO1, IC_ADDRESS1, IC_TAGLINE1 }

// final resourceValues = EnumValues({
//     "ic_address1": Resource.IC_ADDRESS1,
//     "ic_businessname1": Resource.IC_BUSINESSNAME1,
//     "ic_email1": Resource.IC_EMAIL1,
//     "ic_mobile_no1": Resource.IC_MOBILE_NO1,
//     "ic_profile1": Resource.IC_PROFILE1,
//     "ic_tagline1": Resource.IC_TAGLINE1,
//     "ic_website1": Resource.IC_WEBSITE1
// });

enum TextMargin { THE_8080, THE_8880, THE_0000 }

// final textMarginValues = EnumValues({
//     "0,0,0,0": TextMargin.THE_0000,
//     "8,0,8,0": TextMargin.THE_8080,
//     "8,8,8,0": TextMargin.THE_8880
// });

class Logo {
    Logo({
        required   this.posx,
        required   this.posy,
        required   this.width,
        required   this.height,
        required   this.opacity,
        required   this.size,
        required   this.text,
        // required   this.fontName,
        // required   this.textColor,
        // required   this.align,
        required   this.fontSize,
    });

    int posx;
    int posy;
    int width;
    int height;
    int opacity;
    bool size;
    String text;
    // FontName fontName;
    // Color textColor;
    // Align align;
    int fontSize;

    factory Logo.fromJson(String str) => Logo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Logo.fromMap(Map<String, dynamic> json) => Logo(
        posx: json["posx"],
        posy: json["posy"],
        width: json["width"],
        height: json["height"],
        opacity: json["opacity"],
        size: json["size"],
        text: json["text"],
        // fontName: fontNameValues.map[json["font_name"]],
        // textColor: colorValues.map[json["text_color"]],
        // align: alignValues.map[json["align"]],
        fontSize: json["font_size"],
    );

    Map<String, dynamic> toMap() => {
        "posx": posx,
        "posy": posy,
        "width": width,
        "height": height,
        "opacity": opacity,
        "size": size,
        "text": text,
        // "font_name": fontNameValues.reverse[fontName],
        // "text_color": colorValues.reverse[textColor],
        // "align": alignValues.reverse[align],
        "font_size": fontSize,
    };
}

class SocialIcon {
    SocialIcon({
        required   this.posx,
        required   this.posy,
        required   this.width,
        required   this.height,
        required   this.iconWidth,
        required   this.iconHeight,
        required   this.iconMargin,
        // required   this.alignment,
        required   this.orientation,
    });

    int posx;
    int posy;
    int width;
    int height;
    int iconWidth;
    int iconHeight;
    String iconMargin;
    // Align alignment;
    String orientation;

    factory SocialIcon.fromJson(String str) => SocialIcon.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SocialIcon.fromMap(Map<String, dynamic> json) => SocialIcon(
        posx: json["posx"],
        posy: json["posy"],
        width: json["width"],
        height: json["height"],
        iconWidth: json["icon_width"],
        iconHeight: json["icon_height"],
        iconMargin: json["icon_margin"],
        // alignment: alignValues.map[json["alignment"]],
        orientation: json["orientation"],
    );

    Map<String, dynamic> toMap() => {
        "posx": posx,
        "posy": posy,
        "width": width,
        "height": height,
        "icon_width": iconWidth,
        "icon_height": iconHeight,
        "icon_margin": iconMargin,
        // "alignment": alignValues.reverse[alignment],
        "orientation": orientation,
    };
}

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(   this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
