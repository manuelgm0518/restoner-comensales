class Endpoint {
  final bool error;
  final String dataError;
  final dynamic data;

  Endpoint({
    required this.error,
    required this.dataError,
    required this.data,
  });

  Endpoint copyWith({
    bool? error,
    String? dataError,
    dynamic data,
  }) {
    return Endpoint(
      error: error ?? this.error,
      dataError: dataError ?? this.dataError,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'error': error,
      'dataError': dataError,
      'data': data,
    };
  }

  factory Endpoint.fromMap(Map<String, dynamic> map) {
    return Endpoint(
      error: map['error'] ?? false,
      dataError: map['dataError'] ?? '',
      data: map['data'],
    );
  }

  @override
  String toString() => 'Endpoint(error: $error, dataError: $dataError, data: $data)';
}
