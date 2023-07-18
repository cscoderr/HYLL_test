import 'package:hyll_test/domain/domain.dart';

final class SupplyInfoModel extends SupplyInfo {
  const SupplyInfoModel({
    super.supplierName,
    super.priceTitle,
    super.priceSubtitle,
    super.buttonType,
    super.link,
  });

  factory SupplyInfoModel.fromJson(Map<String, dynamic> json) =>
      SupplyInfoModel(
        supplierName: json['supplier_name'] as dynamic,
        priceTitle: json['price_title'] as String?,
        priceSubtitle: json['price_subtitle'] as String?,
        buttonType: json['button_type'] as String?,
        link: json['link'] as dynamic,
      );
}
