class Customer {
  final int id;
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String address;
  final String email;
  final String role;

  Customer(this.id, this.username, this.password, this.firstName, this.lastName,
      this.address, this.email, this.role);

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        json['id'] as int,
        json['username'] as String,
        json['password'] as String,
        json['FName'] as String,
        json['LName'] as String,
        json['Address'] as String,
        json['email'] as String,
        json['role'] as String,
      );
}
