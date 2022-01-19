import 'package:equatable/equatable.dart';

class UsEntity {
  UsEntity({this.amount, this.unitLong, this.unitShort});

  final double? amount;
  final String? unitLong;
  final String? unitShort;
}
