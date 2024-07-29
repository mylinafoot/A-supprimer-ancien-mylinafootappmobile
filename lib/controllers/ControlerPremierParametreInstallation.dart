import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class ControlerPremierParametreInstallation with ChangeNotifier {
  GetStorage? stockage;
  bool _isFirstTimeBienvenue=false;
  bool get isFirstTimeBienvenue {
    return stockage?.read<bool>(StockageKeys.is_first_time) ?? _isFirstTimeBienvenue;
  }

  set isFirstTimeBienvenue(bool value) {
    _isFirstTimeBienvenue = value;
    stockage?.write(StockageKeys.is_first_time, value);
  }

  ControlerPremierParametreInstallation({this.stockage});
}

class StockageKeys{
  static const String is_first_time="IS_FIRST_TIME";
}