import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'cubits/profiles/profiles_cubit.dart';
import 'pages/splash_page.dart';
import 'utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // // TODO: Replace credentials with your own
    url: 'SUPABASE_URL',
    anonKey: 'SUPABASE_ANON_KEY',
    authCallbackUrlHostname: 'login',
  );
  runApp(const SupabaseChatApp());
}

class SupabaseChatApp extends StatelessWidget {
  const SupabaseChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilesCubit>(
      create: (context) => ProfilesCubit(),
      child: MaterialApp(
        title: 'Supabase Chat App',
        theme: appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
