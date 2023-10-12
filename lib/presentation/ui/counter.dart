import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled1/cubit/counter_cubit/cubit.dart';
import 'package:untitled1/cubit/counter_cubit/state.dart';
import 'package:untitled1/presentation/widgets/home_drawer.dart';
import 'package:untitled1/utils/constant.dart';
import 'package:untitled1/utils/constant_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CounterCubitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CounterCubitCubit>(context);
    final settings=AppLocalizations.of(context)!;
    Box box=Hive.box(settingsBox);
    return Scaffold(
      appBar: AppBar(title: Text(settings.home),),
        drawer:const HomeDrawer(),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<CounterCubitCubit, CounterCubitState>(
          builder: (context, state) {
            return Text(cubit.counter.toString());
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                cubit.increase();
              },
              child: const Icon(Icons.add),
            ),
            SizedBox(
              width: 5.w,
            ),
            FloatingActionButton(
              onPressed: () {
                cubit.decrease();
              },
              child: const Icon(Icons.remove),
            ),
          ],
        ),
        FloatingActionButton(
            onPressed: () {
              context.push(news, extra: "zaynab srour");
            },
            child: Text(settings.news)),
        SizedBox(
          height: 5.w,
        ),
        Switch(
            value: box.get(darkModeValue),
            onChanged: (value) {
              box.put(darkModeValue, value);
            }),

        SizedBox(
          height: 5.w,
        ),
        DropdownButton<String>(
            value: box.get(languageValue),
            items: <String>["en", "ar"]
                .map(
                  (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
            )
                .toList(),
            onChanged: (locale) => box.put(languageValue, locale)),
      ],
    ));
  }
}
