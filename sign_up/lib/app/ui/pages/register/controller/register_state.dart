import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    @Default('') String name,
    @Default('') String lastname,
    @Default('') String email,
    @Default('') String password,
    @Default('') String vpassword,
    @Default(false) bool termsOk,
  }) = _RegisterState;
  static RegisterState get initialState => RegisterState();
}
