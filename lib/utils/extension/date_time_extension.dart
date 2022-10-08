import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../resource/constants.dart';

extension DateTimeExtension on DateTime {
  String get dateString {
    final engFormat = DateFormat();
    return engFormat.format(this);
  }

  /// Get Time of now
  int getSessionDay() {
    if (hour >= 5 && hour < 12) {
      return Constants.isMorning;
    } else if (hour >= 12 && hour < 18) {
      return Constants.isAfternoon;
    }
    return Constants.isEvening;
  }

  String getGreetingDay(
    BuildContext context,
    String name,
  ) {
    switch (getSessionDay()) {
      case Constants.isMorning:
        return AppLocalizations.of(context)!.goodMorning(name);
      case Constants.isAfternoon:
        return AppLocalizations.of(context)!.goodAfternoon(name);
      case Constants.isEvening:
        return AppLocalizations.of(context)!.goodEvening(name);
    }
    return '';
  }
}
