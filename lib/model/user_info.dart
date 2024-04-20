class Userinfo {
  final String name;
  final String birthday;
  final String sex;
  final String age;
  final String job;
  final String address;
  final String phone;
  String uid;

  Userinfo({
    required this.name,
    required this.birthday,
    required this.sex,
    required this.age,
    required this.job,
    required this.address,
    required this.phone,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthday': birthday,
      'sex': sex,
      'age': age,
      'job': job,
      'address': address,
      'phone': phone,
      'uid': uid,
    };
  }
}
