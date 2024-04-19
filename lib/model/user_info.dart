

class Userinfo {
  final String name;
  final String birthday;
  final String sex;
  final String age;
  final String job;
  final String address;
  final String email;
  final String phone;

  Userinfo({
    required this.name,
    required this.birthday,
    required this.sex,
    required this.age,
    required this.job,
    required this.address,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthday': birthday,
      'sex': sex,
      'age': age,
      'job': job,
      'address': address,
      'email': email,
      'phone': phone,
    };
  }
}

