import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:llm_chatbot/core/application/app_startup_service_provider.dart';
import 'package:llm_chatbot/core/theme/app_theme.dart';
import 'package:llm_chatbot/features/chat/presentation/pages/chat_page.dart';
import 'package:llm_chatbot/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await MobileAds.instance.initialize();
  final container = ProviderContainer();
  container.read(appStartupServiceProvider);

  //We pass out manually pre-warmed container to UncontrolledProviderScope
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const ChatPage(),
    );
  }
}
