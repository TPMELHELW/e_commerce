import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String userName;
  String email;
  String number;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.number,
  });

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': number,
    };
  }

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        number: '',
      );

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      firstName: data['FirstName'] ?? '',
      lastName: data['LastName'] ?? '',
      userName: data['UserName'] ?? '',
      email: data['Email'] ?? '',
      number: data['PhoneNumber'] ?? '',
    );
  }
}
