import 'package:flutter/material.dart';

navigatTo(context, widget) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}
