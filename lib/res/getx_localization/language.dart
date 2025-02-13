import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // america symbol
        'en_US': {
          'email_hint': 'Email',
          'internet_exception':
              "We're unable to show results.\nPlease check your data\nconenction.",
          'general_exception':
              "We're unable to process your request.\n Please try again",
          'welcome_back': 'Welcome\nBack',
          'login': 'Login',
          'password_hint': 'Password',
        },
        // bangladesh symbol
        'bn_BD': {
          'email_hint': 'আপনার ই-মেইল', // 'email_hint' same as en_US key
        }
      };
}
