class Trace {
  String? file;
  int? line;
  String? function;
  String? traceClass;
  String? type;

  Trace({this.file, this.line, this.function, this.traceClass, this.type});

  factory Trace.fromJson(Map<String, dynamic> json) => Trace(
        file: json['file'] as String?,
        line: json['line'] as int?,
        function: json['function'] as String?,
        traceClass: json['class'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'file': file,
        'line': line,
        'function': function,
        'class': traceClass,
        'type': type,
      };
}
