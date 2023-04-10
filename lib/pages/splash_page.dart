import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/constants.dart';
import 'register_page.dart';
import 'rooms_page.dart';

/// Page to redirect users to the appropriate page depending on the initial auth state
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInitialSession();
    super.initState();
  }

  Future<void> getInitialSession() async {
    // quick and dirty way to wait for the widget to mount
    await Future.delayed(Duration.zero);

    try {
      final session = await SupabaseAuth.instance.initialSession;
      if (session == null) {
        Navigator.of(context).pushAndRemoveUntil(RegisterPage.route(), (_) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(RoomsPage.route(), (_) => false);
      }
    } catch (_) {
      context.showErrorSnackBar(
        message: 'Error occurred during session refresh',
      );
      Navigator.of(context).pushAndRemoveUntil(RegisterPage.route(), (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
