import 'package:equatable/equatable.dart';

class AddressResponse {
//JsonName:state
  List<AddressResponseState> state;

//JsonName:message
  String message;

  AddressResponse({
    this.state,
    this.message,
  });

  static List<AddressResponseState> fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return AddressResponse(
      state: null == (temp = map['state'])
          ? []
          : (temp is List
              ? temp.map((map) => AddressResponseState.fromMap(map)).toList()
              : []),
      message: map['message']?.toString(),
    )?.state;
  }
}

class AddressResponseState {
//JsonName:name
  String name;

//JsonName:id
  int id;

//JsonName:locals
  List<AddressResponseLocalGovernment> locals;

  AddressResponseState({
    this.name,
    this.id,
    this.locals,
  });

  factory AddressResponseState.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return AddressResponseState(
      name: map['name']?.toString(),
      id: null == (temp = map['id'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      locals: null == (temp = map['locals'])
          ? []
          : (temp is List
              ? temp
                  .map((map) => AddressResponseLocalGovernment.fromMap(map))
                  .toList()
              : []),
    );
  }
}

class AddressResponseLocalGovernment extends Equatable {
//JsonName:name
  final String name;

//JsonName:id
  final int id;

  AddressResponseLocalGovernment({
    this.name,
    this.id,
  });

  factory AddressResponseLocalGovernment.fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return AddressResponseLocalGovernment(
      name: map['name']?.toString(),
      id: null == (temp = map['id'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [name, id];
}
