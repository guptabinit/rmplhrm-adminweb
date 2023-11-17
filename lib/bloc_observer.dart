import 'package:bloc/bloc.dart';
import 'package:rmpl_hrm_admin/utils/utils.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    'onError(${bloc.runtimeType}, $error, $stackTrace)'.log();
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    'onChange(${bloc.runtimeType}, $change)'.log();
  }
}
