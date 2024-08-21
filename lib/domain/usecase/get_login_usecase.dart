import 'package:injectable/injectable.dart';

import '../base/future_usecase_base.dart';
import '../base/usecase_base.dart';

@Injectable()
class GetLoginUsecase extends BaseFutureUsecase<GetLoginInput, GetLoginOutput> {
  @override
  Future<GetLoginOutput> buildUsecase(GetLoginInput input) {
    // TODO: implement buildUsecase
    throw UnimplementedError();
  }
}

class GetLoginInput extends BaseInput {
  const GetLoginInput();
}

class GetLoginOutput extends BaseOutput {
  const GetLoginOutput();
}
