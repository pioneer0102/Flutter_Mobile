import 'package:flutter/material.dart';
import 'package:my_flutter/projects/instagram_redesign/bloc/instagram_bloc.dart';
export 'package:my_flutter/projects/instagram_redesign/bloc/instagram_bloc.dart';

class InstagramBlocProvider extends InheritedWidget {
  const InstagramBlocProvider({
    super.key,
    required this.instagramBloc,
    required super.child,
  });

  final InstagramBloc instagramBloc;

  static InstagramBlocProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InstagramBlocProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => this != oldWidget;
}
