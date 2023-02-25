import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/network/end_points/end_points.dart';
import 'package:untitled/network/remote/dio_helper.dart';
import 'package:untitled/shop_app/shop_login/login_cubit/states.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);


  void userLogin({
    required String email,
    required String password,

  }) {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      emit(ShopLoginSuccessState());
    }).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
    });
  }

}