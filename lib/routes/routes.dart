import 'package:flutter/material.dart';
import 'package:masajid/features/aboutUs/view/screen/aboutUs_screen.dart';
import 'package:masajid/features/announcements/view/screen/announcements_screen.dart';
import 'package:masajid/features/announcements/view/screen/single_announcement.dart';
import 'package:masajid/features/azkar/view/screen/azkar_screen.dart';
import 'package:masajid/features/contactUs/view/screen/contact.dart';
import 'package:masajid/features/contactUs/view/screen/contactUs_screen.dart';
import 'package:masajid/features/donate/view/screen/donate_screen.dart';
import 'package:masajid/features/gallery/view/screen/gallery_screen.dart';
import 'package:masajid/features/hadith/view/screen/hadith_screen.dart';
import 'package:masajid/features/main/view/screen/main_screen.dart';
import 'package:masajid/features/qibla/view/screen/qibla_screen.dart';
import 'package:masajid/features/quran/view/screen/quran_screen.dart';
import 'package:masajid/features/services/view/screen/services_screen.dart';
import 'package:masajid/features/splash/view/screen/splash_screen.dart';
import 'package:masajid/features/tasbih/view/screen/tasbih_screen.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String main = '/main_view';
  static const String home = '/home_view';
  static const String menu = '/menu_view';
  static const String quran = 'AlQurann';
  static const String qibla = 'Qibla';
  static const String services = 'Services';
  static const String azkar = 'Azkar';
  static const String tasbih = 'Tasbih';
  static const String gallery = 'Gallery';
  static const String donate = 'Donate';
  static const String hadith = 'Hadith';
  static const String aboutUs = 'About Us';
  static const String contactUs = 'Contact Us';
  static const String contact = '/contact_view';
  static const String announcements = 'Announcements';
  static const String singleAnnouncements = '/singleAnnouncements_view';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.azkar:
        return MaterialPageRoute(builder: (_) => const AzkarScreen());
      case Routes.hadith:
        return MaterialPageRoute(builder: (_) => const HadithScreen());
      case Routes.quran:
        return MaterialPageRoute(builder: (_) => const QuranScreen());
      case Routes.services:
        return MaterialPageRoute(builder: (_) => const ServicesScreen());
      case Routes.qibla:
        return MaterialPageRoute(builder: (_) => const QiblaScreen());
      case Routes.announcements:
        return MaterialPageRoute(builder: (_) => const AnnouncementsScreen());
      case Routes.tasbih:
        return MaterialPageRoute(builder: (_) => const TasbihScreen());
      case Routes.contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());
      case Routes.donate:
        return MaterialPageRoute(builder: (_) => const DonateScreen());
      case Routes.aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());
      case Routes.gallery:
        return MaterialPageRoute(builder: (_) => const GalleryScreen());
      case Routes.singleAnnouncements:
        return MaterialPageRoute(builder: (_) => const SingleAnnouncementsScreen());
      case Routes.contact:
        return MaterialPageRoute(builder: (_) => const ContactScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("no Route Found"),
        ),
        body: const Center(
          child: Text("no Route Found"),
        ),
      ),
    );
  }
}
