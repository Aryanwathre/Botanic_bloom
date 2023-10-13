// To parse this JSON data, do
//
//     final details = detailsFromJson(jsonString);

import 'dart:convert';

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

String detailsToJson(Details data) => json.encode(data.toJson());

class Details {
  int id;
  String commonName;
  List<String> scientificName;
  List<String> otherName;
  dynamic family;
  List<String> origin;
  String type;
  String dimension;
  Dimensions dimensions;
  String cycle;
  List<dynamic> attracts;
  List<String> propagation;
  Hardiness hardiness;
  HardinessLocation hardinessLocation;
  String watering;
  List<dynamic> depthWaterRequirement;
  List<dynamic> volumeWaterRequirement;
  dynamic wateringPeriod;
  WateringGeneralBenchmark wateringGeneralBenchmark;
  List<PlantAnatomy> plantAnatomy;
  List<String> sunlight;
  List<String> pruningMonth;
  List<dynamic> pruningCount;
  int seeds;
  dynamic maintenance;
  String careGuides;
  List<dynamic> soil;
  String growthRate;
  bool droughtTolerant;
  bool saltTolerant;
  bool thorny;
  bool invasive;
  bool tropical;
  bool indoor;
  String careLevel;
  List<dynamic> pestSusceptibility;
  String pestSusceptibilityApi;
  bool flowers;
  dynamic floweringSeason;
  String flowerColor;
  bool cones;
  bool fruits;
  bool edibleFruit;
  String edibleFruitTasteProfile;
  String fruitNutritionalValue;
  List<dynamic> fruitColor;
  dynamic harvestSeason;
  bool leaf;
  List<String> leafColor;
  bool edibleLeaf;
  bool cuisine;
  bool medicinal;
  int poisonousToHumans;
  int poisonousToPets;
  String description;
  DefaultImage defaultImage;
  String otherImages;

  Details({
    required this.id,
    required this.commonName,
    required this.scientificName,
    required this.otherName,
    required this.family,
    required this.origin,
    required this.type,
    required this.dimension,
    required this.dimensions,
    required this.cycle,
    required this.attracts,
    required this.propagation,
    required this.hardiness,
    required this.hardinessLocation,
    required this.watering,
    required this.depthWaterRequirement,
    required this.volumeWaterRequirement,
    required this.wateringPeriod,
    required this.wateringGeneralBenchmark,
    required this.plantAnatomy,
    required this.sunlight,
    required this.pruningMonth,
    required this.pruningCount,
    required this.seeds,
    required this.maintenance,
    required this.careGuides,
    required this.soil,
    required this.growthRate,
    required this.droughtTolerant,
    required this.saltTolerant,
    required this.thorny,
    required this.invasive,
    required this.tropical,
    required this.indoor,
    required this.careLevel,
    required this.pestSusceptibility,
    required this.pestSusceptibilityApi,
    required this.flowers,
    required this.floweringSeason,
    required this.flowerColor,
    required this.cones,
    required this.fruits,
    required this.edibleFruit,
    required this.edibleFruitTasteProfile,
    required this.fruitNutritionalValue,
    required this.fruitColor,
    required this.harvestSeason,
    required this.leaf,
    required this.leafColor,
    required this.edibleLeaf,
    required this.cuisine,
    required this.medicinal,
    required this.poisonousToHumans,
    required this.poisonousToPets,
    required this.description,
    required this.defaultImage,
    required this.otherImages,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        commonName: json["common_name"],
        scientificName:
            List<String>.from(json["scientific_name"].map((x) => x)),
        otherName: List<String>.from(json["other_name"].map((x) => x)),
        family: json["family"],
        origin: List<String>.from(json["origin"].map((x) => x)),
        type: json["type"],
        dimension: json["dimension"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        cycle: json["cycle"],
        attracts: List<dynamic>.from(json["attracts"].map((x) => x)),
        propagation: List<String>.from(json["propagation"].map((x) => x)),
        hardiness: Hardiness.fromJson(json["hardiness"]),
        hardinessLocation:
            HardinessLocation.fromJson(json["hardiness_location"]),
        watering: json["watering"],
        depthWaterRequirement:
            List<dynamic>.from(json["depth_water_requirement"].map((x) => x)),
        volumeWaterRequirement:
            List<dynamic>.from(json["volume_water_requirement"].map((x) => x)),
        wateringPeriod: json["watering_period"],
        wateringGeneralBenchmark: WateringGeneralBenchmark.fromJson(
            json["watering_general_benchmark"]),
        plantAnatomy: List<PlantAnatomy>.from(
            json["plant_anatomy"].map((x) => PlantAnatomy.fromJson(x))),
        sunlight: List<String>.from(json["sunlight"].map((x) => x)),
        pruningMonth: List<String>.from(json["pruning_month"].map((x) => x)),
        pruningCount: List<dynamic>.from(json["pruning_count"].map((x) => x)),
        seeds: json["seeds"],
        maintenance: json["maintenance"],
        careGuides: json["care-guides"],
        soil: List<dynamic>.from(json["soil"].map((x) => x)),
        growthRate: json["growth_rate"],
        droughtTolerant: json["drought_tolerant"],
        saltTolerant: json["salt_tolerant"],
        thorny: json["thorny"],
        invasive: json["invasive"],
        tropical: json["tropical"],
        indoor: json["indoor"],
        careLevel: json["care_level"],
        pestSusceptibility:
            List<dynamic>.from(json["pest_susceptibility"].map((x) => x)),
        pestSusceptibilityApi: json["pest_susceptibility_api"],
        flowers: json["flowers"],
        floweringSeason: json["flowering_season"],
        flowerColor: json["flower_color"],
        cones: json["cones"],
        fruits: json["fruits"],
        edibleFruit: json["edible_fruit"],
        edibleFruitTasteProfile: json["edible_fruit_taste_profile"],
        fruitNutritionalValue: json["fruit_nutritional_value"],
        fruitColor: List<dynamic>.from(json["fruit_color"].map((x) => x)),
        harvestSeason: json["harvest_season"],
        leaf: json["leaf"],
        leafColor: List<String>.from(json["leaf_color"].map((x) => x)),
        edibleLeaf: json["edible_leaf"],
        cuisine: json["cuisine"],
        medicinal: json["medicinal"],
        poisonousToHumans: json["poisonous_to_humans"],
        poisonousToPets: json["poisonous_to_pets"],
        description: json["description"],
        defaultImage: DefaultImage.fromJson(json["default_image"]),
        otherImages: json["other_images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "common_name": commonName,
        "scientific_name": List<dynamic>.from(scientificName.map((x) => x)),
        "other_name": List<dynamic>.from(otherName.map((x) => x)),
        "family": family,
        "origin": List<dynamic>.from(origin.map((x) => x)),
        "type": type,
        "dimension": dimension,
        "dimensions": dimensions.toJson(),
        "cycle": cycle,
        "attracts": List<dynamic>.from(attracts.map((x) => x)),
        "propagation": List<dynamic>.from(propagation.map((x) => x)),
        "hardiness": hardiness.toJson(),
        "hardiness_location": hardinessLocation.toJson(),
        "watering": watering,
        "depth_water_requirement":
            List<dynamic>.from(depthWaterRequirement.map((x) => x)),
        "volume_water_requirement":
            List<dynamic>.from(volumeWaterRequirement.map((x) => x)),
        "watering_period": wateringPeriod,
        "watering_general_benchmark": wateringGeneralBenchmark.toJson(),
        "plant_anatomy":
            List<dynamic>.from(plantAnatomy.map((x) => x.toJson())),
        "sunlight": List<dynamic>.from(sunlight.map((x) => x)),
        "pruning_month": List<dynamic>.from(pruningMonth.map((x) => x)),
        "pruning_count": List<dynamic>.from(pruningCount.map((x) => x)),
        "seeds": seeds,
        "maintenance": maintenance,
        "care-guides": careGuides,
        "soil": List<dynamic>.from(soil.map((x) => x)),
        "growth_rate": growthRate,
        "drought_tolerant": droughtTolerant,
        "salt_tolerant": saltTolerant,
        "thorny": thorny,
        "invasive": invasive,
        "tropical": tropical,
        "indoor": indoor,
        "care_level": careLevel,
        "pest_susceptibility":
            List<dynamic>.from(pestSusceptibility.map((x) => x)),
        "pest_susceptibility_api": pestSusceptibilityApi,
        "flowers": flowers,
        "flowering_season": floweringSeason,
        "flower_color": flowerColor,
        "cones": cones,
        "fruits": fruits,
        "edible_fruit": edibleFruit,
        "edible_fruit_taste_profile": edibleFruitTasteProfile,
        "fruit_nutritional_value": fruitNutritionalValue,
        "fruit_color": List<dynamic>.from(fruitColor.map((x) => x)),
        "harvest_season": harvestSeason,
        "leaf": leaf,
        "leaf_color": List<dynamic>.from(leafColor.map((x) => x)),
        "edible_leaf": edibleLeaf,
        "cuisine": cuisine,
        "medicinal": medicinal,
        "poisonous_to_humans": poisonousToHumans,
        "poisonous_to_pets": poisonousToPets,
        "description": description,
        "default_image": defaultImage.toJson(),
        "other_images": otherImages,
      };
}

class DefaultImage {
  int license;
  String licenseName;
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
        license: json["license"],
        licenseName: json["license_name"],
        licenseUrl: json["license_url"],
        originalUrl: json["original_url"],
        regularUrl: json["regular_url"],
        mediumUrl: json["medium_url"],
        smallUrl: json["small_url"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "license": license ?? 'No Data',
        "license_name": licenseName ?? 'No Data',
        "license_url": licenseUrl ?? 'No Data',
        "original_url": originalUrl ?? 'No Data',
        "regular_url": regularUrl ?? 'No Data',
        "medium_url": mediumUrl ?? 'No Data',
        "small_url": smallUrl ?? 'No Data',
        "thumbnail": thumbnail ?? 'No Data',
      };
}

class Dimensions {
  String type;
  int minValue;
  int maxValue;
  String unit;

  Dimensions({
    required this.type,
    required this.minValue,
    required this.maxValue,
    required this.unit,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        type: json["type"],
        minValue: json["min_value"],
        maxValue: json["max_value"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "type": type ?? 'No Data',
        "min_value": minValue ?? 'No Data',
        "max_value": maxValue ?? 'No Data',
        "unit": unit ?? 'No Data',
      };
}

class Hardiness {
  String min;
  String max;

  Hardiness({
    required this.min,
    required this.max,
  });

  factory Hardiness.fromJson(Map<String, dynamic> json) => Hardiness(
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "min": min ?? 'No Data',
        "max": max ?? 'No Data',
      };
}

class HardinessLocation {
  String fullUrl;
  String fullIframe;

  HardinessLocation({
    required this.fullUrl,
    required this.fullIframe,
  });

  factory HardinessLocation.fromJson(Map<String, dynamic> json) =>
      HardinessLocation(
        fullUrl: json["full_url"],
        fullIframe: json["full_iframe"],
      );

  Map<String, dynamic> toJson() => {
        "full_url": fullUrl ?? 'No Data',
        "full_iframe": fullIframe ?? 'No Data',
      };
}

class PlantAnatomy {
  String plantAnatomyPart;
  List<String> color;

  PlantAnatomy({
    required this.plantAnatomyPart,
    required this.color,
  });

  factory PlantAnatomy.fromJson(Map<String, dynamic> json) => PlantAnatomy(
        plantAnatomyPart: json["part"],
        color: List<String>.from(json["color"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "part": plantAnatomyPart ?? 'No Data',
        "color": List<dynamic>.from(color.map((x) => x)) ?? ['No Data'],
      };
}

class WateringGeneralBenchmark {
  String value;
  String unit;

  WateringGeneralBenchmark({
    required this.value,
    required this.unit,
  });

  factory WateringGeneralBenchmark.fromJson(Map<String, dynamic> json) =>
      WateringGeneralBenchmark(
        value: json["value"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "value": value ?? 'No Data',
        "unit": unit ?? 'No Data',
      };
}
