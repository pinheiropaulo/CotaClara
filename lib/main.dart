import 'package:cota_clara/app/app.dart';
import 'package:cota_clara/app/data/mock_api.dart';
import 'package:flutter/material.dart';

void main() {
  MockApi.instance.init();
  runApp(const CotaClaraApp());
}
