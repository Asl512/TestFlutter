import 'package:test_test/feature/domin/entities/user/geo_entity.dart';

class GeoModel extends GeoEntity{
  GeoModel({
    required lat,
    required lng,
}) : super(
      lat:lat,
      lng: lng
  );

  factory GeoModel.fromJson(Map<String,dynamic> json){
    return GeoModel(
        lat: json["lat"],
        lng: json["lng"],
    );
  }
}