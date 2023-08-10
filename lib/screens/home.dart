import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intro_bloc/cubit/internet_cubit.dart';

import '../bloc/internet_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if(state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Internet Connected!'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                  ),
                    backgroundColor: Colors.green,
                  ),

                );
              } else if(state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Internet Not Connected!'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)
                    ),
                    backgroundColor: Colors.red,
                  ),

                );
              }
            },
            builder: (context, state) {
              if(state is InternetGainedState) {
                return const Text('Connected');
              } else if(state is InternetLostState) {
                return const Text('Not Connected');
              } else {
                return const Text('Loading...');
              }
            },
          )
      ),
    );
  }
}


