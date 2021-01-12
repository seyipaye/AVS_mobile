class StatusResponse {
//JsonName:success
  bool success;

  StatusResponse({
    this.success,
  });

  factory StatusResponse.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return StatusResponse(
      success: null == (temp = map['success'])
          ? null
          : (temp is bool
              ? temp
              : (temp is num
                  ? 0 != temp.toInt()
                  : ('true' == temp.toString()))),
    );
  }
}
