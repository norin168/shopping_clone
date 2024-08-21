abstract class BaseDataMapper<Model, Entity> {
  const BaseDataMapper();

  Entity mapToEntity(Model? data);

  List<Entity> mapToListEntity(List<Model>? listData) {
    return listData?.map(mapToEntity).toList() ?? List.empty();
  }
}
