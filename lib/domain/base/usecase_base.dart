import 'package:meta/meta.dart';
import 'package:w_navigator/helper/log/log.dart';

abstract class BaseUsecase<I extends BaseInput, O> with LogMixin {
  const BaseUsecase();

  @protected
  O buildUsecase(I input);
}

abstract class BaseInput {
  const BaseInput();
}

abstract class BaseOutput {
  const BaseOutput();
}
