import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class Utils {
  static String formatPhoneNumber({
    @required String phoneNumber,
  }) {
    String phoneNumberFormatted = phoneNumber;
    if (phoneNumber.startsWith("009665")) {
      final List<String> phoneNumberSplit = phoneNumber.split("009665");
      phoneNumberFormatted = "+9665${phoneNumberSplit[1]}";
    } else if (phoneNumber.startsWith("9665")) {
      final List<String> phoneNumberSplit = phoneNumber.split("9665");
      phoneNumberFormatted = "+9665${phoneNumberSplit[1]}";
    } else if (phoneNumber.startsWith("+9665")) {
      final List<String> phoneNumberSplit = phoneNumber.split("+9665");
      phoneNumberFormatted = "+9665${phoneNumberSplit[1]}";
    } else if (phoneNumber.startsWith("05")) {
      final List<String> phoneNumberSplit = phoneNumber.split("05");
      phoneNumberFormatted = "+9665${phoneNumberSplit[1]}";
    } else if (phoneNumber.startsWith("5")) {
      final List<String> phoneNumberSplit = phoneNumber.split("5");
      phoneNumberFormatted = "+9665${phoneNumberSplit[1]}";
    }
    print("Phone number before formatting: $phoneNumber");
    print("Phone number after formatting: $phoneNumberFormatted");
    return phoneNumberFormatted;
  }

  static Future<void> launchPhoneNumber({
    @required String phoneNumber,
  }) async {
    final String launchablePhoneNumber = "tel:$phoneNumber";
    await url_launcher.launch(launchablePhoneNumber);
  }

  static Future<void> launchPhoneNumberInWhatsapp({
    @required String phoneNumber,
  }) async {
    final String launchablePhoneNumber = "https://wa.me/$phoneNumber";
    await url_launcher.launch(launchablePhoneNumber);
  }
}
