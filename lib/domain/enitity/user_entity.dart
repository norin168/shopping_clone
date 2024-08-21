class UserEntity {
  final String name;
  final String phone;
  final String address;
  final int? age;

  UserEntity({
    required this.name,
    required this.phone,
    required this.address,
    this.age,
  });
}
