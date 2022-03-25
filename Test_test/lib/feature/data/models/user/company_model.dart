import 'package:test_test/feature/domin/entities/user/company_entity.dart';

class CompanyModel extends CompanyEntity{
  CompanyModel({
    required name,
    required catchPhrase,
    required bs,
}) : super(
      name:name,
      catchPhrase: catchPhrase,
      bs:bs,
  );

  factory CompanyModel.fromJson(Map<String,dynamic> json){
    return CompanyModel(
      name: json["name"],
      catchPhrase: json["catchPhrase"],
      bs: json["bs"]
    );
  }
}