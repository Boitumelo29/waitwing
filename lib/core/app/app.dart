import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:waitwing/core/provider/app_provider.dart';
import 'package:waitwing/core/routers/router.dart';
import 'package:waitwing/l10n/app_localizations.dart';
import 'package:waitwing/utils/theme/colour_scheme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return
        //AppProvider(
        //child:
        ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        themeMode: ThemeMode.system,
        theme: ThemeData(
            colorScheme: ColourScheme.lightScheme, useMaterial3: true),
        darkTheme:
            ThemeData(colorScheme: ColourScheme.darkScheme, useMaterial3: true),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
        ],
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
      //)
    );
  }
}
