abstract class IMapImplementor<T> {
  Map<String, dynamic> toMap();
  List<T> fromMaps(List<Map<String, dynamic>> maps);
}
