import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/data_layer/api_manager/custome_eception.dart';
import 'package:flutter_application_1/data_layer/repository/repository.dart';
import 'package:meta/meta.dart';

part 'test_api_state.dart';

class TestApiCubit extends Cubit<TestApiState> {
  TestApiCubit(this.repository) : super(TestApiInitial());
  final Repository repository;

  Future<void> login(String email, String password) async {
    emit(TestApiLoading());
    try {
      final response = await repository.login(email, password);
      emit(TestApiSuccess(message: response.info!.name!));
    } catch (e) {
      emit(TestApiError(message: e.toString()));
    }
  }

  Future<void> forgetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(TestApiLoading());
    try {
      final response = await repository.forgetPassword(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      emit(TestApiSuccess(message: response));
    } catch (e) {
      String errorMessage = "Unexpected Error";
      if (e is ApiException) {
        errorMessage = e.message;
      }
      emit(TestApiError(message: errorMessage));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String userName,
    required String mobileNumber,
    required String countryMobileCode,
    required String profilePicture,
  }) async {
    emit(TestApiLoading());
    try {
      final response = await repository.register(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        userName: userName,
        mobileNumber: mobileNumber,
        countryMobileCode: countryMobileCode,
        profilePicture: profilePicture,
      );
      emit(TestApiSuccess(message: response));
    } catch (e) {
      String errorMessage = "Unexpected Error";
      if (e is ApiException) {
        errorMessage = e.message;
      }
      emit(TestApiError(message: errorMessage));
    }
  }
}
