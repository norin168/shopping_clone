import 'package:w_navigator/data/data_source/dto/data/user_data.dart';
import 'package:w_navigator/data/data_source/dto/mapper/base/mapper_base.dart';
import 'package:w_navigator/domain/enitity/user_entity.dart';

class ApiUserDataMapper extends BaseDataMapper<UserData, UserEntity> {
  @override
  UserEntity mapToEntity(UserData? data) {
    return UserEntity(
      name: data?.name ?? '',
      phone: data?.phone ?? '',
      address: data?.address ?? '',
      age: data?.age,
    );
  }
}
