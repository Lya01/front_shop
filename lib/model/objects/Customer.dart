
class Customer {
  int? id;
  String firstName;
  String lastName;
  String email;
  String? password;




  Customer({ this.id,  required this.firstName, required this.lastName, required this.email,this.password});


  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password
  };

  @override
  String toString() {
    return firstName + " " + lastName;
  }


}