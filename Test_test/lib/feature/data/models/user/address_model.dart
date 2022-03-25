import 'package:test_test/feature/data/models/user/geo_model.dart';
import 'package:test_test/feature/domin/entities/user/address_entity.dart';

class AddressModel extends AddressEntity{
  AddressModel({
    required street,
    required suite,
    required city,
    required zipcode,
    required geo,
}) : super(
      street:street,
      suite: suite,
      city:city,
      zipcode: zipcode,
      geo:geo
  );

  factory AddressModel.fromJson(Map<String,dynamic> json){
    return AddressModel(
      street: json["street"],
      suite: json["suite"],
      city: json["city"],
      zipcode: json["zipcode"],
      geo: GeoModel.fromJson(json["geo"]),
    );
  }
}