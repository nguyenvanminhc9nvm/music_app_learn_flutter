import 'package:flutter_base_by_minhnv/bloc_provider_factory.dart';
import 'package:flutter_base_by_minhnv/data/app_data_manager.dart';
import 'package:flutter_base_by_minhnv/data/data_manager.dart';

class Application {
  static final Application _singleton = Application._internal();
  late DataManager dataManager;
  late BlockProviderFactory blockProviderFactory;

  Application._internal() {
    dataManager = AppDataManager();
    blockProviderFactory = BlockProviderFactory();
  }

  factory Application() {
    return _singleton;
  }
}