// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String id;
  final String user;
  final String password;
  final String name;
  final String lastname;
  final String ime;
  UserModel({
    required this.id,
    required this.user,
    required this.password,
    required this.name,
    required this.lastname,
    required this.ime,
  });

  UserModel copyWith({
    String? id,
    String? user,
    String? password,
    String? name,
    String? lastname,
    String? ime,
  }) {
    return UserModel(
      id: id ?? this.id,
      user: user ?? this.user,
      password: password ?? this.password,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      ime: ime ?? this.ime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'password': password,
      'name': name,
      'lastname': lastname,
      'ime': ime,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      user: map['user'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      lastname: map['lastname'] as String,
      ime: map['ime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, user: $user, password: $password, name: $name, lastname: $lastname, ime: $ime)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user == user &&
        other.password == password &&
        other.name == name &&
        other.lastname == lastname &&
        other.ime == ime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        password.hashCode ^
        name.hashCode ^
        lastname.hashCode ^
        ime.hashCode;
  }
}
