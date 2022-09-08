import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';


class BaseController extends GetxController{

  AppLocalizations get appLocalizations => AppLocalizations.of(Get.context!)!;
}