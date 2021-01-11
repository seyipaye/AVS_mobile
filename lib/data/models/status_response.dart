class StatusResponse {
//JsonName:success
  bool success;

  //JsonName:code
  int code;

//JsonName:message
  String message;

  StatusResponse({
    this.success,
    this.code,
    this.message,
  });

  factory StatusResponse.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return StatusResponse(
      success: null == (temp = map['success'])
          ? false
          : (temp is bool
              ? temp
              : (temp is num
                  ? 0 != temp.toInt()
                  : ('true' == temp.toString()))),
      code: null == (temp = map['code'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      message: map['message']?.toString(),
    );
  }
}

class Ds {
//JsonName:stack
  String stack;

//JsonName:code
  int code;

//JsonName:message
  String message;

  Ds({
    this.stack,
    this.code,
    this.message,
  });
}
