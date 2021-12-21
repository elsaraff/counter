import 'package:counter/cubit/cubit.dart';
import 'package:counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child:
          BlocConsumer<CounterCubit, CounterStates>(listener: (context, state) {
        if (state is CounterPlusState) {
          debugPrint(
              'Counter After PLUS STATE is ${CounterCubit.get(context).counter}');
          debugPrint('Counter After PLUS STATE is ${state.counter}');
        }
        if (state is CounterMinusState) {
          debugPrint(
              'Counter After MINUS STATE is ${CounterCubit.get(context).counter}');
          debugPrint('Counter After PLUS STATE is ${state.counter}');
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Counter Page')),
          body: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      onPressed: () {
                        CounterCubit.get(context).plus();
                      },
                      child: const Icon(Icons.add, size: 60)),
                  const SizedBox(width: 20.0),
                  Text('${CounterCubit.get(context).counter}',
                      style: const TextStyle(
                          fontSize: 70.0, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 20.0),
                  FloatingActionButton(
                      onPressed: () {
                        CounterCubit.get(context).minus();
                      },
                      child: const Icon(Icons.remove, size: 60)),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
