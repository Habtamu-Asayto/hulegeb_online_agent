import 'package:get/get.dart';

class ChangeLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'message': 'Enter your phone number for detail',
          'phone': 'Phone number',
          'change': 'Language',
          'button': 'Verify Phone',
          'pls_enter': 'Please enter phone number',
          'enter_valid': 'Please enter valid phone number',
          'verify': 'Phone Verification',
          'invalid_otp': 'Invalid OTP number',
          'ver': 'Verifying',
          'app_title': 'Hulegeb online agent',
          'phone_signin': 'Sign in with Phone',
          'google_signin': 'Sign in with Google'
        },
        'am_ET': {
          'message': 'የበለጠ መረጃ ለማግኘት የስልክ ቁጥርዎን ያስገቡ',
          'phone': 'ስልክ ቁጥር',
          'change': 'ቋንቋ ቀይር',
          'button': 'ስልክ ያረጋግጡ',
          'pls_enter': 'እባክዎ ስልክ ቁጥር ያስገቡ',
          'enter_valid': 'እባክዎ የሚሰራ ስልክ ቁጥር ያስገቡ',
          'verify': 'ስልክ ቁትር ማረጋገጫ',
          'invalid_otp': 'ልክ ያልሆነ የኦቲፒ ቁጥር',
          'ver': 'በማረጋገጥ ላይ',
          'app_title': 'ሁለገብ የመስመር ላይ ወኪል',
          'phone_signin': 'በስልክ ይግቡ',
          'google_signin': 'በ Google ይግቡ'
        },
      };
}
