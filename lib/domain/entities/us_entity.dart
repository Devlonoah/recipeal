import 'package:equatable/equatable.dart';

class UsEntity extends Equatable {
  UsEntity(this.amount, this.unitLong, this.unitShort);

  final int? amount;
  final String unitLong;
  final String unitShort;

  @override
  // TODO: implement props
  List<Object?> get props => [amount, unitShort, unitLong];

  @override
  bool? get stringify => true;
}
