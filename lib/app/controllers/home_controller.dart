import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<CurrencyModel>? currencies;

  TextEditingController? toText = TextEditingController();
  TextEditingController? fromText = TextEditingController();

  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;

  HomeController({this.toText, this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies?[0];
    fromCurrency = currencies?[1];
  }

  void convert() {
    String? text = toText!.text;
    double? value = double.tryParse(text) ?? 1.0;
    double? returnValue;

    if (fromCurrency!.name! == 'Real') {
      returnValue = value * toCurrency!.real!;
    } else if (fromCurrency!.name! == 'Dolar') {
      returnValue = value * toCurrency!.dolar!;
    } else if (fromCurrency!.name! == 'Euro') {
      returnValue = value * toCurrency!.euro!;
    }

    fromText!.text = returnValue!.toStringAsFixed(2);
  }
}
