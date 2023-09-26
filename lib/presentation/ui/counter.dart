import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/cubit/counter_cubit/cubit.dart';
import 'package:untitled1/cubit/counter_cubit/state.dart';


class CounterCubitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CounterCubitCubit>(context);

    return
      Scaffold(
        body:
      Column(
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
            FloatingActionButton(onPressed: () {
              cubit.increase();
            },
              child: const Icon(Icons.add),),
            SizedBox(width: 5,),
            FloatingActionButton(onPressed: () {
              cubit.decrease();
            },
              child: const Icon(Icons.remove),),
          ],
        ),
      ],
    ));
  }


}


