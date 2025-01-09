import 'trace.dart';

class PolicyShowModel {
  String? message;
  String? exception;
  String? file;
  int? line;
  List<Trace>? trace;

  PolicyShowModel({
    this.message,
    this.exception,
    this.file,
    this.line,
    this.trace,
  });

  factory PolicyShowModel.fromJson(Map<String, dynamic> json) {
    return PolicyShowModel(
      message: json['message'] as String?,
      exception: json['exception'] as String?,
      file: json['file'] as String?,
      line: json['line'] as int?,
      trace: (json['trace'] as List<dynamic>?)
          ?.map((e) => Trace.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'exception': exception,
        'file': file,
        'line': line,
        'trace': trace?.map((e) => e.toJson()).toList(),
      };
}
