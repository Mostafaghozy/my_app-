import 'package:first_app/dio/model/new_products.dart';

abstract class AppState{}
class InitialState extends AppState {}
class LoadingState extends AppState {}
class LoadedState extends AppState {
 final List<NewProduct>? pr ;

  LoadedState(this.pr);

}
class ErrorState extends AppState {}