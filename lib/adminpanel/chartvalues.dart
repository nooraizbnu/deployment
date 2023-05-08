import 'package:collection/collection.dart';

class Points{
  late final double x;
  late final double y;
  Points({required this.x, required this.y});
}

List<Points> get dataPoints{
  final data = <double>[2,4,6,11,3,6,4];
  return data.mapIndexed((index, element) => Points(x: index.toDouble(), y: element)).toList();
}