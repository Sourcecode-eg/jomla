// abstract class CreateAccountState {}

// // ---------------------
// // create account States
// // ---------------------
// class CreateAccountInitial extends CreateAccountState {}

// class CreateAccountLoading extends CreateAccountState {}

// class CreateAccountSuccess extends CreateAccountState {
//   final String message;

//   CreateAccountSuccess(this.message);
// }

// class CreateAccountFailure extends CreateAccountState {
//   final String error;

//   CreateAccountFailure(this.error);
// }

// // ---------------------
// // Store States
// // ---------------------

// class CreateStoreLoading extends CreateAccountState {}

// class CreateStoreSuccess extends CreateAccountState {
//   final String message;

//   CreateStoreSuccess(this.message);
// }

// class CreateStoreFailure extends CreateAccountState {
//   final String error;

//   CreateStoreFailure(this.error);
// }

// // ---------------------
// // all store type state
// // ---------------------

// class GetStoreTypesLoading extends CreateAccountState {}

// class GetStoreTypesSuccess extends CreateAccountState {
//   final List<Map<String, dynamic>> types;

//   GetStoreTypesSuccess(this.types);
// }

// class GetStoreTypesFailure extends CreateAccountState {
//   final String error;

//   GetStoreTypesFailure(this.error);
// }
abstract class CreateAccountState {}

class CreateAccountInitial extends CreateAccountState {}

class CreateAccountLoading extends CreateAccountState {
  final String? message;
  CreateAccountLoading({this.message});
}

class CreateAccountSuccess extends CreateAccountState {
  final String message;
  CreateAccountSuccess(this.message);
}

class CreateAccountFailure extends CreateAccountState {
  final String error;
  CreateAccountFailure(this.error);
}

class CreateAccountStepChanged extends CreateAccountState {
  final int currentStep;
  final bool showOtp;
  final String appBarTitle;
  final String buttonText;

  CreateAccountStepChanged({
    required this.currentStep,
    required this.showOtp,
    required this.appBarTitle,
    required this.buttonText,
  });
}

class CreateAccountShowOtp extends CreateAccountState {
  final String phoneNumber;
  final String email;
  CreateAccountShowOtp({required this.phoneNumber, required this.email});
}

class CreateStoreLoading extends CreateAccountState {}

class CreateStoreSuccess extends CreateAccountState {
  final String message;
  CreateStoreSuccess(this.message);
}

class CreateStoreFailure extends CreateAccountState {
  final String error;
  CreateStoreFailure(this.error);
}

class GetStoreTypesLoading extends CreateAccountState {}

class GetStoreTypesSuccess extends CreateAccountState {
  final List<Map<String, dynamic>> types;
  GetStoreTypesSuccess(this.types);
}

class GetStoreTypesFailure extends CreateAccountState {
  final String error;
  GetStoreTypesFailure(this.error);
}
