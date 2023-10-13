// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Datum> data;
  int to;
  int perPage;
  int currentPage;
  int from;
  int lastPage;
  int total;

  Welcome({
    required this.data,
    required this.to,
    required this.perPage,
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.total,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        to: json["to"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "to": to,
        "per_page": perPage,
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "total": total,
      };
}

class Datum {
  int id;
  String commonName;
  List<String> scientificName;
  List<String> otherName;
  Cycle cycle;
  Watering watering;
  List<Sunlight> sunlight;
  DefaultImage? defaultImage;

  Datum({
    required this.id,
    required this.commonName,
    required this.scientificName,
    required this.otherName,
    required this.cycle,
    required this.watering,
    required this.sunlight,
    required this.defaultImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0, // Provide a default value for 'id' if it's null
        commonName: json["common_name"] ??
            "No common name", // Default value for 'commonName'
        scientificName: (json["scientific_name"] != null)
            ? List<String>.from(json["scientific_name"].map((x) => x))
            : [], // Empty list if 'scientific_name' is null
        otherName: (json["other_name"] != null)
            ? List<String>.from(json["other_name"].map((x) => x))
            : [], // Empty list if 'other_name' is null
        cycle: cycleValues.map[json["cycle"]] ??
            Cycle.PERENNIAL, // Default value for 'cycle'
        watering: wateringValues.map[json["watering"]] ??
            Watering.AVERAGE, // Default value for 'watering'
        sunlight: (json["sunlight"] != null)
            ? List<Sunlight>.from(json["sunlight"]
                .map((x) => sunlightValues.map[x] ?? Sunlight.FILTERED_SHADE))
            : [], // Default value for 'sunlight'
        defaultImage: (json["default_image"] != null)
            ? DefaultImage.fromJson(json["default_image"])
            : null, // Null if 'default_image' is null
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "common_name": commonName,
        "scientific_name": List<dynamic>.from(scientificName.map((x) => x)),
        "other_name": List<dynamic>.from(otherName.map((x) => x)),
        "cycle": cycleValues.reverse[cycle],
        "watering": wateringValues.reverse[watering],
        "sunlight":
            List<dynamic>.from(sunlight.map((x) => sunlightValues.reverse[x])),
        "default_image": defaultImage?.toJson(),
      };
}

enum Cycle { PERENNIAL }

final cycleValues = EnumValues({"Perennial": Cycle.PERENNIAL});

class DefaultImage {
  int license;
  LicenseName licenseName;
  String licenseUrl;
  String originalUrl;
  String regularUrl;
  String mediumUrl;
  String smallUrl;
  String thumbnail;

  DefaultImage({
    required this.license,
    required this.licenseName,
    required this.licenseUrl,
    required this.originalUrl,
    required this.regularUrl,
    required this.mediumUrl,
    required this.smallUrl,
    required this.thumbnail,
  });

  factory DefaultImage.fromJson(Map<String, dynamic> json) => DefaultImage(
        license: json["license"] ??
            0, // Provide a default value for 'license' if it's null
        licenseName: licenseNameValues.map[json["license_name"]] ??
            LicenseName.ATTRIBUTION_LICENSE, // Default value for 'licenseName'
        licenseUrl: json["license_url"] ??
            "https://www.canva.com/design/DAFwl5JLqwc/iWQH1bU9bBfUzKX8fSREFg/edit?utm_content=DAFwl5JLqwc&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton", // Default value for 'licenseUrl'
        originalUrl: json["original_url"] ??
            "https://www.canva.com/design/DAFwl5JLqwc/iWQH1bU9bBfUzKX8fSREFg/edit?utm_content=DAFwl5JLqwc&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton", // Default value for 'originalUrl'
        regularUrl: json["regular_url"] ??
            "https://www.canva.com/design/DAFwl5JLqwc/iWQH1bU9bBfUzKX8fSREFg/edit?utm_content=DAFwl5JLqwc&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton", // Default value for 'regularUrl'
        mediumUrl: json["medium_url"] ??
            "https://www.canva.com/design/DAFwl5JLqwc/iWQH1bU9bBfUzKX8fSREFg/edit?utm_content=DAFwl5JLqwc&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton", // Default value for 'mediumUrl'
        smallUrl: json["small_url"] ??
            "https://www.canva.com/design/DAFwl5JLqwc/iWQH1bU9bBfUzKX8fSREFg/edit?utm_content=DAFwl5JLqwc&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton", // Default value for 'smallUrl'
        thumbnail: json["thumbnail"] ??
            "https://www.canva.com/design/DAFwl5JLqwc/iWQH1bU9bBfUzKX8fSREFg/edit?utm_content=DAFwl5JLqwc&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton", // Default value for 'thumbnail'
      );
  Map<String, dynamic> toJson() => {
        "license": license,
        "license_name": licenseNameValues.reverse[licenseName],
        "license_url": licenseUrl,
        "original_url": originalUrl,
        "regular_url": regularUrl,
        "medium_url": mediumUrl,
        "small_url": smallUrl,
        "thumbnail": thumbnail,
      };
}

enum LicenseName {
  ATTRIBUTION_LICENSE,
  ATTRIBUTION_SHARE_ALIKE_30_UNPORTED_CC_BY_SA_30,
  ATTRIBUTION_SHARE_ALIKE_LICENSE,
  CC0_10_UNIVERSAL_CC0_10_PUBLIC_DOMAIN_DEDICATION
}

final licenseNameValues = EnumValues({
  "Attribution License": LicenseName.ATTRIBUTION_LICENSE,
  "Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)":
      LicenseName.ATTRIBUTION_SHARE_ALIKE_30_UNPORTED_CC_BY_SA_30,
  "Attribution-ShareAlike License": LicenseName.ATTRIBUTION_SHARE_ALIKE_LICENSE,
  "CC0 1.0 Universal (CC0 1.0) Public Domain Dedication":
      LicenseName.CC0_10_UNIVERSAL_CC0_10_PUBLIC_DOMAIN_DEDICATION
});

enum Sunlight {
  FILTERED_SHADE,
  FULL_SUN,
  PART_SHADE,
  PART_SUN_PART_SHADE,
  SUNLIGHT_FULL_SUN
}

final sunlightValues = EnumValues({
  "filtered shade": Sunlight.FILTERED_SHADE,
  "full sun": Sunlight.FULL_SUN,
  "part shade": Sunlight.PART_SHADE,
  "part sun/part shade": Sunlight.PART_SUN_PART_SHADE,
  "Full sun": Sunlight.SUNLIGHT_FULL_SUN
});

enum Watering { AVERAGE, FREQUENT }

final wateringValues =
    EnumValues({"Average": Watering.AVERAGE, "Frequent": Watering.FREQUENT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
