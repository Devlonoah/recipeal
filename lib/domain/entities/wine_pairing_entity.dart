import 'product_matches_entity.dart';

class WinePairingEntity {
  final List<String> pairedWines;
  final String pairingText;
  final List<ProductMatchesEntity> productMatches;

  WinePairingEntity(this.pairedWines, this.pairingText, this.productMatches);
}
