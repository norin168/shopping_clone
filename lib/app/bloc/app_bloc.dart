import 'package:injectable/injectable.dart';
import 'package:w_navigator/app/bloc/app_event.dart';
import 'package:w_navigator/app/bloc/app_state.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';
import 'package:w_navigator/helper/validator/auth_validator.dart';

@Injectable()
class AppBloc extends BaseBloc<AppEvent, AppState>
    implements CardNumberChangeObserveable {
  AppBloc() : super(const AppState()) {
    // do sth here
  }

  static final _cardNumberChangeObservers = <CardNumberChangeObserver>[];

  @override
  void addObserver(CardNumberChangeObserver observer) {
    _cardNumberChangeObservers.add(observer);
  }

  @override
  void notifyCardNumberChange(String cardNumber) {
    for (final observer in _cardNumberChangeObservers) {
      observer.notifyChanged(cardNumber);
    }
  }

  @override
  void removeObserver(CardNumberChangeObserver observer) {
    _cardNumberChangeObservers.remove(observer);
  }
}
