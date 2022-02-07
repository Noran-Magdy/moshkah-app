import 'package:kiwi/kiwi.dart';
import 'package:moshkah_app/blocs/home_bloc/bloc.dart';
import 'package:moshkah_app/blocs/single_path_bloc/bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerFactory((c) => HomeBloc());
  container.registerFactory((c) => SinglePathBloc());
}
