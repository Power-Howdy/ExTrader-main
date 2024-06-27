class Account {
  final String id;
  final String account_number;
  final String name;
  final String email;
  final String? profileImageUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Account({
    required this.id,
    required this.account_number,
    required this.name,
    required this.email,
    this.profileImageUrl,
    required this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create a User from a Map (e.g., from JSON)
  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      account_number: map['account_number'],
      name: map['name'],
      email: map['email'],
      profileImageUrl: map['profileImageUrl'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : null,
    );
  }

  // Method to convert the User to a Map (e.g., for JSON serialization)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}