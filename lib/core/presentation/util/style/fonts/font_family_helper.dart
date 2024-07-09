
import 'package:postage_staff/core/core_packages.dart';

class FontFamilyHelper {
  const FontFamilyHelper._();

  static const String cairoArabic = 'Cairo';

  static const String poppinsEnglish = 'Poppins';

  static String geLocalozedFontFamily() {
    final currentLanguage = SharedPref.getString(PrefKeys.language);
    // print('currentLanguage $currentLanguage');
    if (currentLanguage == 'en') {
      return poppinsEnglish;
    } else {
      return cairoArabic;
    }
  }
}
