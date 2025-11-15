import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme.dart';
import 'router.dart';

class WellthApp extends StatelessWidget {
  const WellthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Wellth',
        debugShowCheckedModeBanner: false,
        theme: buildWellthTheme(),
        routerConfig: appRouter,
      ),
    );
  }
}
