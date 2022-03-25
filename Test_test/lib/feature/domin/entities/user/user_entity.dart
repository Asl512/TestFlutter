import 'package:equatable/equatable.dart';
import 'package:test_test/feature/domin/entities/user/address_entity.dart';
import 'company_entity.dart';

class UserEntity extends Equatable{
  final int id;
  final String name;
  final String username;
  final String initials;
  final String email;
  final AddressEntity address;
  final String phone;
  final String website;
  final CompanyEntity company;

  const UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.initials,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,username,initials,email,address,phone,website,company];
}