import 'package:dogs_we_love/di/setupBlocs.dart';
import 'package:dogs_we_love/ui/blocs/dogs/dogs_bloc.dart';
import 'package:dogs_we_love/ui/components/dogs_component.dart';
import 'package:dogs_we_love/ui/components/error_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<DogsBloc>()..add(LoadDogsInfo()),
      child: DogsView(),
    );
  }
}

class DogsView extends StatelessWidget {
  const DogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dogs We Love", style: TextStyle(fontSize: 30, color: Color(0xFF333333)))),
      ),
      body: Center(
        child: BlocBuilder<DogsBloc, DogsState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return const CircularProgressIndicator();
              case Status.loading:
                return CircularProgressIndicator();
              case Status.success:
                return DogsComponent(dogsList: state.dogs);
              case Status.failure:
                return ErrorComponent(message: state.message);
            }
          },
        ),
      ),
    );
  }
}
