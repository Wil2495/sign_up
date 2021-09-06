import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:sign_up/app/domain/repositories/sign_up_repository.dart';
import 'data/repositories_impl/authentication_repository_impl.dart';
import 'data/repositories_impl/sign_up_repository_impl.dart';
import 'domain/repositories/authentication_repository.dart';

void injectDependencies() {
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(FirebaseAuth.instance),
  );
  Get.i.lazyPut<SignUpRepository>(
    () => SignUpRepositoryImpl(FirebaseAuth.instance),
  );
}
