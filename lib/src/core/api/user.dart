class User {
  String? email;
  String? username;
  String? id;
  String? bio;
  String? gender;
  String? userType;
  String? isVerified;
  String? weight;
  String? height;
  String? postcode;
  String? pk;
  String? firstName;
  String? lastName;

  User({this.email, this.firstName, this.lastName, this.bio, this.username, this.gender, this.height, this.id, this.isVerified, this.pk, this.postcode, this.userType, this.weight});

  factory User.fromJson(Map<String, dynamic> json) => User(
      email: json['email'],
      username: json['username'],
      lastName: json['lastName'],
      bio: json['bio'],
    id: json['id'],
    gender: json['gender'],
    userType: json['userType'],
    isVerified: json['isVerified'],
    weight: json['weight'],
    height: json['height'],
    postcode: json['postcode'],
    pk: json['pk'],
    firstName: json['firstName'],

  );
}


