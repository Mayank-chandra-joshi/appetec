class User {
  final String id;
  final String name;
  final String email;
  final int age;
  final String gender;
  final int height;
  final int weight;
  final int deviceUsageLimit;
  final String dietPreference;
  final bool isEmailVerified;
  final bool isAccountCompleted;
  final bool isDeleted;
  final List<String> appPermissions;
  final List<Map<String, String>> goals;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.deviceUsageLimit,
    required this.dietPreference,
    required this.isEmailVerified,
    required this.isAccountCompleted,
    required this.isDeleted,
    required this.appPermissions,
    required this.goals,
  });

  /// Create a User instance from a JSON map.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      height: json['height'] as int,
      weight: json['weight'] as int,
      deviceUsageLimit: json['deviceUsageLimit'] as int,
      dietPreference: json['dietPreference'] as String,
      isEmailVerified: json['isEmailVerified'] as bool,
      isAccountCompleted: json['isAccountCompleted'] as bool,
      isDeleted: json['isDeleted'] as bool,
      appPermissions: (json['appPermissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      goals: (json['goals'] as List<dynamic>).map<Map<String, String>>((goal) {
        final goalMap = goal as Map<String, dynamic>;
        return goalMap.map((key, value) => MapEntry(key, value.toString()));
      }).toList(),
    );
  }

  /// Convert the User instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'deviceUsageLimit': deviceUsageLimit,
      'dietPreference': dietPreference,
      'isEmailVerified': isEmailVerified,
      'isAccountCompleted': isAccountCompleted,
      'isDeleted': isDeleted,
      'appPermissions': appPermissions,
      'goals': goals,
    };
  }
}
