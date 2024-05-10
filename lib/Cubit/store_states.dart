abstract class StoreStates {}

class InitialState extends StoreStates {}

class LoadingState extends StoreStates {}

class SuccessState extends StoreStates {
  final List<dynamic> products;

  SuccessState(this.products);
}

class ErrorState extends StoreStates {
  final String message;

  ErrorState({required this.message});
}
