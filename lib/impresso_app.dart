import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:impresso_app/core/routing/router_config.dart';

class ImpressoApp extends StatelessWidget {
  const ImpressoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
