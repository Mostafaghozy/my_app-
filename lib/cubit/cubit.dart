import 'package:first_app/cubit/state.dart';
import 'package:first_app/dio/api_provider.dart';
import 'package:first_app/dio/model/new_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit():super(InitialState());
  List<NewProduct>? pr ;
  ApiProvider apiProvider = ApiProvider();
  get({required String cate})async{
    emit(LoadingState());
    try {
      pr =await apiProvider.getDetailsProduct(category: "$cate");
      emit(LoadedState(pr));
    }  catch (e) {
      emit(ErrorState());
      // TODO
    }
  }

}