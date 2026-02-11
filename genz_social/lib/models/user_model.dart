// User Model - Stores user information
class UserModel {
  final String id;
  final String fullName;
  final int age;
  final String gender;
  final String city;
  final String email;
  final String phoneNumber;
  final String? profileImage;
  final String? nickname;
  final String? intent;
  
  UserModel({
    required this.id,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.city,
    required this.email,
    required this.phoneNumber,
    this.profileImage,
    this.nickname,
    this.intent,
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      age: json['age'] ?? 18,
      gender: json['gender'] ?? 'Other',
      city: json['city'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      profileImage: json['profileImage'],
      nickname: json['nickname'],
      intent: json['intent'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'age': age,
      'gender': gender,
      'city': city,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'nickname': nickname,
      'intent': intent,
    };
  }
}
