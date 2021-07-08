
import 'package:flutter_base_by_minhnv/utils/localize/AppLocalization.dart';

extension ConvertStringExtensions on String {
  static String getText(context, key) =>  AppLocalization.of(context).translate(key);
}
