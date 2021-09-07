import 'package:sign_up/app/domain/helpers/sign_up.dart';
import 'package:sign_up/app/domain/responses/sign_up_response.dart';

abstract class SignUpRepository {
  Future<SignUpResponse> register(SignUpData data);
}
