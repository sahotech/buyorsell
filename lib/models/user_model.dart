// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserDetailsModel {
  String name;
  String email;
  String phoneNumber;
  UserDetailsModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> getJson() => {
        'displayName': name,
        'Email ': email,
        'Phone': phoneNumber,
      };
}
