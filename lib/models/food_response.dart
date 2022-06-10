// To parse this JSON data, do
//
//     final foodResponse = foodResponseFromJson(jsonString);

import 'dart:convert';

FoodResponse foodResponseFromJson(String str) =>
    FoodResponse.fromJson(json.decode(str));

String foodResponseToJson(FoodResponse data) => json.encode(data.toJson());

class FoodResponse {
  FoodResponse({
    this.data,
    this.page,
    this.size,
    this.total,
  });

  List<Datum>? data;
  int? page;
  int? size;
  int? total;

  factory FoodResponse.fromJson(Map<String, dynamic> json) => FoodResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        page: json["page"],
        size: json["size"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "page": page,
        "size": size,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.pageUrl,
    this.originalPageUrl,
    this.media,
    this.isActive,
    this.orders,
    this.bannerVariantId,
    this.variant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? pageUrl;
  String? originalPageUrl;
  String? media;
  bool? isActive;
  int? orders;
  int? bannerVariantId;
  Variant? variant;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        pageUrl: json["page_url"],
        originalPageUrl: json["original_page_url"],
        media: json["media"],
        isActive: json["is_active"],
        orders: json["orders"],
        bannerVariantId: json["banner_variant_id"],
        variant: Variant.fromJson(json["variant"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "page_url": pageUrl,
        "original_page_url": originalPageUrl,
        "media": media,
        "is_active": isActive,
        "orders": orders,
        "banner_variant_id": bannerVariantId,
        "variant": variant?.toJson(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Variant {
  Variant({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
