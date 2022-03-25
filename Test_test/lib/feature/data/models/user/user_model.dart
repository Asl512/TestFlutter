import 'package:test_test/feature/data/models/user/address_model.dart';
import 'package:test_test/feature/data/models/user/company_model.dart';
import 'package:test_test/feature/domin/entities/user/company_entity.dart';
import 'package:test_test/feature/domin/entities/user/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({
    required id,
    required name,
    required username,
    required initials,
    required email,
    required address,
    required phone,
    required website,
    required company,
}) : super(
      id:id,
      name: name,
      username: username,
      initials:initials,
      email:email,
      address: address,
      phone: phone,
      website:website,
      company: company
  );

  factory UserModel.fromJson(Map<String,dynamic> json){
    List name = json["name"].toString().split(' ');

    return UserModel(
      id: json["id"],
      name: name.join(' '),
      username: json["username"],
      initials: name.map((e) => e[0]).toList().join(''),
      email: json["email"],
      address: AddressModel.fromJson(json["address"]),
      phone: json["phone"],
      website: json["website"],
      company: CompanyModel.fromJson(json["company"])
    );
  }
}