import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable(createToJson: false)
class UserData {
  UserData({
    required this.name,
    required this.address,
    required this.phone,
    this.age,
  });

  @JsonKey(name: 'name', defaultValue: '')
  String name;
  @JsonKey(name: 'phone', defaultValue: '')
  String phone;
  @JsonKey(name: 'address', defaultValue: '')
  String address;
  @JsonKey(name: 'age')
  int? age;
}
