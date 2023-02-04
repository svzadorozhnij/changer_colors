import 'dart:async';

import 'package:changer_color/app.dart';
import 'package:flutter/material.dart';

class NavigationService {
  Future<void> push(Widget classTo) async {
    unawaited(
      Navigator.push(
        App.globalContext,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => classTo,
          transitionDuration: Duration.zero,
        ),
      ),
    );
  }

  Future<void> pushAndRemoveUntil(Widget classTo) async {
    unawaited(
      Navigator.pushAndRemoveUntil(
        App.globalContext,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => classTo,
          transitionDuration: Duration.zero,
        ),
        (route) => false,
      ),
    );
  }

  Future<void> pushReplacement(Widget classTo) async {
    unawaited(
      Navigator.pushReplacement(
        App.globalContext,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => classTo,
          transitionDuration: Duration.zero,
        ),
      ),
    );
  }

  Future<void> pop(BuildContext context, {Object? result}) async {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop(result);
    }
  }
}
