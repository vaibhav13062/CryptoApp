class ResponseResolver {
  dynamic data;
  Status? status;

  ResponseResolver({this.data, this.status});

  factory ResponseResolver.fromJson(Map<String, dynamic> json) {
    return ResponseResolver(
      data: json['data'] ?? "",
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    return data;
  }
}

class Status {
  int? credit_count;
  int? elapsed;
  int? error_code;
  String? error_message;
  String? notice;
  String? timestamp;

  Status(
      {this.credit_count,
      this.elapsed,
      this.error_code,
      this.error_message,
      this.notice,
      this.timestamp});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      credit_count: json['credit_count'],
      elapsed: json['elapsed'],
      error_code: json['error_code'],
      error_message: json['error_message'] ?? "",
      notice: json['notice'] ?? "",
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['credit_count'] = credit_count;
    data['elapsed'] = elapsed;
    data['error_code'] = error_code;
    data['timestamp'] = timestamp;
    if (error_message != null) {
      data['error_message'] = error_message;
    }
    if (notice != null) {
      data['notice'] = notice;
    }
    return data;
  }
}
