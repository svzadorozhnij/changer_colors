import 'package:changer_color/models/localization.dart';
import 'package:changer_color/providers/localization_provider.dart';
import 'package:flutter/material.dart' show BuildContext;

import 'package:provider/provider.dart';


Localization l10n(BuildContext context) {
  return context.read<LocalizationProvider>().currentLocalization;
}
