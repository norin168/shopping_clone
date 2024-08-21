import 'package:injectable/injectable.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';
import 'package:w_navigator/presentation/home/bloc/home_state.dart';

part 'home_event.dart';

@Injectable()
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    // do sth here
  }
}
