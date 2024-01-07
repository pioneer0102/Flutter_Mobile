import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter/bloc/data_bloc.dart';

class HomeBloc extends StatefulWidget {
  const HomeBloc({super.key});

  @override
  State<HomeBloc> createState() => _HomeBlocState();
}

class _HomeBlocState extends State<HomeBloc> {
  late DataBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<DataBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('BLoC Page')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<DataBloc, DataState>(
              builder: (context, state) {
                if (state is Initial) {
                  return const Center(child: Text('Press the Button'));
                }
                if (state is UpdatedState) {
                  return Center(child: Text('${state.count}'));
                }
                return Container();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Icon(Icons.add),
                  onPressed: () => {bloc.add(IncrementEvent())},
                ),
                ElevatedButton(
                  child: const Icon(Icons.remove),
                  onPressed: () => {bloc.add(DecrementEvent())},
                )
              ],
            )
          ],
        ));
  }
}
