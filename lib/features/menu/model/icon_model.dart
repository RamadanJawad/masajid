import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/routes/routes.dart';

class IconModel {
  String? name;
  String? imagePath;
  String? routeName;

  IconModel({ this.name,  this.imagePath,  this.routeName});

  static List iconData = [
    IconModel(
        name: ManagerStrings.alquran,
        imagePath: ManagerAssets.quran,
        routeName: Routes.quran),
    IconModel(
        name: ManagerStrings.hadith,
        imagePath: ManagerAssets.hadith,
        routeName: Routes.hadith),
    IconModel(
        name: ManagerStrings.azkar,
        imagePath: ManagerAssets.azkar,
        routeName: Routes.azkar),
    IconModel(
        name: ManagerStrings.qibla,
        imagePath: ManagerAssets.qibla,
        routeName: Routes.qibla),
    IconModel(
        name: ManagerStrings.tasbih,
        imagePath: ManagerAssets.tasbih,
        routeName: Routes.tasbih),
    IconModel(
        name: ManagerStrings.aboutUs,
        imagePath: ManagerAssets.aboutUs,
        routeName: Routes.aboutUs),
    IconModel(
        name: ManagerStrings.gallery,
        imagePath: ManagerAssets.gallary,
        routeName: Routes.gallery),
    IconModel(
        name: ManagerStrings.services,
        imagePath: ManagerAssets.servicess,
        routeName: Routes.services),
    IconModel(
        name: ManagerStrings.contactUs,
        imagePath: ManagerAssets.contactUs,
        routeName: Routes.contact),
  ];
}
