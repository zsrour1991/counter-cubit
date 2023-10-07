import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled1/cubit/counter_cubit/cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled1/utils/color_schemes.g.dart';
import 'package:untitled1/utils/constant.dart';
import 'package:untitled1/utils/custom_route.dart';
import 'package:untitled1/utils/typography.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(settingsBox);
  runApp( MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubitCubit()),
        ],
        child: ValueListenableBuilder(
            valueListenable: Hive.box(settingsBox).listenable(),
            builder: (__, box, _) {
              bool darkMode = box.get(darkModeValue, defaultValue: false);
              String language = box.get(languageValue, defaultValue: "en");
              return MaterialApp.router(
                title: nasaNews,
                themeMode: darkMode?ThemeMode.dark:ThemeMode.light,
                locale: Locale(language),
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates:AppLocalizations.localizationsDelegates,
                theme: ThemeData(
                  colorScheme: lightColorScheme,
                  textTheme: textTheme,
                  useMaterial3: true
                ),
                darkTheme: ThemeData(
                    textTheme: textTheme,
                  useMaterial3: true,
                  colorScheme: darkColorScheme
                ),
                routerConfig: appRouter.router,
              );
            }));
  }
}
