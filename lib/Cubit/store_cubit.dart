import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phones_and_laptops_store_app/Cubit/store_states.dart';
import 'package:phones_and_laptops_store_app/Model/store_model.dart';

class StoreCubit extends Cubit<StoreStates> {
  StoreCubit() : super(InitialState());

  final Dio dio = Dio();
  late String _category;

  Future<void> fetchData(String category) async {
    _category = category;

    emit(LoadingState()); // Loading state

    try {
      final response =
          await dio.get('https://dummyjson.com/products/category/$_category');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data; // Map

        final List<dynamic> products = data['products']; // List of Map

        // Convert List of Map ==> List of StoreModel

        List<StoreModel> productsStore =
            products.map((element) => StoreModel.fromJson(element)).toList();

        emit(SuccessState(productsStore));
      } else {
        emit(ErrorState(message: 'Failed to fetch data'));
      }
    } catch (error) {
      emit(ErrorState(message: 'Error: $error'));
    }
  }
}
