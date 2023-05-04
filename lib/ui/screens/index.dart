import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CiftcidenApp extends StatelessWidget {

  const CiftcidenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => ShuffleCubit()),
        // BlocProvider(
        //     create: (context) => AvatarCubit(
        //         googleSignIn: GoogleSignIn(
        //           // Optional clientId
        //           // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
        //           scopes: <String>[
        //             'email',
        //             // 'https://www.googleapis.com/auth/contacts.readonly',
        //           ],
        //         ))),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return const MaterialApp(
            // theme: darkTheme,
            title: "Çiftçiden",
            // localizationsDelegates: const [
            //   S.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            // supportedLocales: S.delegate.supportedLocales,
            // locale: Locale(getLanguageCode(context)),

            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            // initialRoute: ROUTE_ANIMATED_SPLASH_SCREEN,
            // theme: ThemeData(useMaterial3: true, fontFamily: "Montserrat"),
            // routes: {
            //   ROUTE_ANIMATED_SPLASH_SCREEN: (context) =>
            //       CevappAnimatedSplashScreen(openingString: openingString),
            // },
          );
        },
      ),
    );
  }

  // if there is no language code, return en
  static String getLanguageCode(BuildContext context) {
    if (["de", "en", "tr", "es", "fr", 'it']
        .contains(Localizations.localeOf(context).languageCode)) {
      return Localizations.localeOf(context).languageCode;
    } else {
      return "en";
    }
  }
// langCode(BuildContext context) {
//   return Localizations.localeOf(context).languageCode;
// }
}
