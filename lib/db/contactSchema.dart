class Contact {
  //Variables Needed
  final int? id;
  final String name;
  final String? imagePath;
  final String phone;
  final String email;
  final String address;
  //When creating the object following data must be passed
  Contact({
    this.id,
    this.imagePath,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });
  //To Map Method This Converts The Values into a suitable format for the db to store
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'imagePath': imagePath,
    };
  }

  //From Map Factory Constructor that will convert the Map into a possible dart class object
  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      name: map['name'],
      imagePath: map['imagePath'],
      phone: map['phone'],
      email: map['email'],
      address: map['address'],
    );
  }
}
