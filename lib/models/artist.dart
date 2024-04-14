class Artist {
  final int id;
  final String firstName;
  final String lastName;
  final String gender;
  final String country;

  Artist(this.id, this.firstName, this.lastName, this.gender, this.country);

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        json['id'] as int,
        json['firstName'] as String,
        json['lastName'] as String,
        json['gender'] as String,
        json['country'] as String,
      );
}
