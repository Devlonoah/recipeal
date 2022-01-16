import 'product_matches_model.dart';

class WinePairingModel {
  WinePairingModel({
    required this.pairedWines,
    required this.pairingText,
    required this.productMatches,
  });
  late final List<String> pairedWines;
  late final String pairingText;
  late final List<ProductMatchesModel> productMatches;

  WinePairingModel.fromJson(Map<String, dynamic> json) {
    pairedWines = List.castFrom<dynamic, String>(json['pairedWines']);
    pairingText = json['pairingText'];
    productMatches = List.from(json['productMatches'])
        .map((e) => ProductMatchesModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pairedWines'] = pairedWines;
    _data['pairingText'] = pairingText;
    _data['productMatches'] = productMatches.map((e) => e.toJson()).toList();
    return _data;
  }
}
