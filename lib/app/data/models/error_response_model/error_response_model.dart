class ErrorResponseModel {
  String? message;
  Map<String, dynamic>? errors;

  ErrorResponseModel({this.message, this.errors});

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
      message: json['message'].toString(),
      errors: json['errors'] == null
          ? null
          : json['errors'] as Map<String, dynamic>?,
    );
  }
}
