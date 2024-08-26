import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

export 'package:store_design_system/config.dart';

class Config {
  static final Config _instance = Config._internal();
  late Map<String, dynamic> _config;


  Config._internal();


  static Config get instance => _instance;


  Future<void> load(String path) async {
    final jsonString = await rootBundle.loadString(path);
    _config = json.decode(jsonString);
  }

  String getText(String page, String key) {
    return _config['textPages']?[page]?[key] ?? '';
  }

  String getColor(String colorKey) {
    return _config['colors']?[colorKey] ?? '#FFFFFF';
  }

  double getFontSize(String sizeKey) {
    return _config['typography']?['fontSizes']?[sizeKey]?.toDouble() ?? 14.0;
  }

  double getFontWeight(String weightKey) {
    return _config['typography']?['fontWeight']?[weightKey]?.toDouble() ?? 400.0;
  }

  double getLineHeight(String heightKey) {
    return _config['typography']?['lineHeight']?[heightKey]?.toDouble() ?? 1.5;
  }

  double getSize(String sizeKey) {
    return _config['sizes']?[sizeKey]?.toDouble() ?? 0.0;
  }

  int getSpacing(String spacingKey) {
    return _config['spacing']?[spacingKey]?.toInt() ?? 0;
  }
}


