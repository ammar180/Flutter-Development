class RegistrationResultModel {
  final bool status;
  final String message;

  RegistrationResultModel({required this.status, required this.message});

  factory RegistrationResultModel.fromJson(json) {
    return RegistrationResultModel(
      status: json['status'] ?? false,
      message: json['message'] ?? "Login fails",
    );
  }
}
