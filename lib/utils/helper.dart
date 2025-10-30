  import 'package:url_launcher/url_launcher.dart';

Future<void> openWhatsApp() async {
    const phone = "916238008953";
    final message = Uri.encodeComponent("Hi Irfan! 👋 I saw your portfolio.");
    final url = Uri.parse("https://wa.me/$phone?text=$message");

    if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }


  }



Future<void> openLink({required String  link}) async {

    final message = Uri.encodeComponent("Hi Irfan! 👋 I saw your portfolio.");
    final url = Uri.parse(link);

    if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
  }



  