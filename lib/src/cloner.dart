import 'cloner_base.dart';

/// deepcopy with mutable list
class NormalCloner implements ClonerBase {
  /// mutable list deepcopy
  @override
  List deepcopyList(List list) {
    List copy = [];

    for (final item in list) {
      if (item is Map) {
        copy.add(deepcopyMap(item));
      } else if (item is List) {
        copy.add(deepcopyList(item));
      } else if (item is Set) {
        copy.add(deepcopySet(item));
      } else {
        copy.add(item);
      }
    }
    return copy;
  }

  /// mutable map deepcopy
  @override
  Map<String, dynamic> deepcopyMap(Map map) {
    Map<String, dynamic> copy = {};

    for (final entry in map.entries) {
      String key = entry.key.toString();
      final value = entry.value;

      if (value is Map) {
        copy[key] = deepcopyMap(value);
      } else if (value is List) {
        copy[key] = deepcopyList(value);
      } else if (value is Set) {
        copy[key] = deepcopySet(value);
      } else {
        copy[key] = value;
      }
    }
    return copy;
  }

  /// mutable map deepcopy
  @override
  Set deepcopySet(Set set) {
    Set copy = {};

    for (final item in set) {
      if (item is Map) {
        copy.add(deepcopyMap(item));
      } else if (item is List) {
        copy.add(deepcopyList(item));
      } else if (item is Set) {
        copy.add(deepcopySet(item));
      } else {
        copy.add(item);
      }
    }
    return copy;
  }
}
