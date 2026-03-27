import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || (this!.trim()).isEmpty;
}

extension ListExtension on List? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension MapExtension on Map? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
