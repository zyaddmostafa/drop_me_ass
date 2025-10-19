import 'package:flutter_bloc/flutter_bloc.dart';

import 'drop_me_app.dart';
import 'package:flutter/material.dart';

import 'core/di/get_it.dart';
import 'my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(const DropMeApp());
}
