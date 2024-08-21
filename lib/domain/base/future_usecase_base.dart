import 'package:w_navigator/domain/base/usecase_base.dart';
import 'package:w_navigator/helper/exceptions/app_exception.dart';
import 'package:w_navigator/helper/exceptions/uncaught_exception.dart';
import 'package:w_navigator/helper/log/config.dart';

abstract class BaseFutureUsecase<I extends BaseInput, O extends BaseOutput>
    extends BaseUsecase<I, Future<O>> {
  const BaseFutureUsecase();

  Future<O> excute(I input) async {
    try {
      if (LogConfig.enabled) {
        logD('FutureUseCase $I Input: $input');
      }
      final output = await buildUsecase(input);
      if (LogConfig.enabled) {
        logD('FutureUseCase $O Output: $output');
      }

      return output;
    } catch (e) {
      if (LogConfig.enabled) {
        logE('FutureUseCase Error: $e');
      }

      throw e is AppException ? e : AppUncaughtException(e);
    }
  }
}
