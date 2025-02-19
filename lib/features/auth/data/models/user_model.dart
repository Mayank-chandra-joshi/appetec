import 'package:appetec/features/auth/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserModel extends User {
  final String accessToken;
  final String expiry;
  UserModel({
    required this.accessToken,
    required this.expiry,
    required super.id,
    required super.email,
    required super.name,
    required super.age,
    required super.gender,
    required super.height,
    required super.weight,
    required super.deviceUsageLimit,
    required super.dietPreference,
    required super.isEmailVerified,
    required super.isAccountCompleted,
    required super.appPermissions,
    required super.goals,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    final user = map['user'];

    return UserModel(
      email: user['email'],
      name: user['name'],
      accessToken: map['accessToken'],
      expiry: map['expiry'],
      id: user['id'],
      age: user['age'],
      gender: user['gender'],
      height: user['height'],
      weight: user['weight'],
      deviceUsageLimit: user['deviceUsageLimit'],
      dietPreference: user['diet_preference'],
      isEmailVerified: user['isEmailVerified'],
      isAccountCompleted: user['isAccountCompleted'],
      appPermissions: List<String>.from(user['app_permissions']),
      goals: List<Map<String, String>>.from(user['goals'].map((goal) => {
            'id': goal['id'] as String,
            'goal_type': goal['goal_type'] as String,
            'selected_goal': goal['selected_goal'] as String,
          })),
    );
  }
}

class UserUpdateModel extends User {
  UserUpdateModel({
    required super.id,
    required super.email,
    required super.name,
    required super.age,
    required super.gender,
    required super.height,
    required super.weight,
    required super.deviceUsageLimit,
    required super.dietPreference,
    required super.isEmailVerified,
    required super.isAccountCompleted,
    required super.appPermissions,
    required super.goals,
  });

  factory UserUpdateModel.fromJson(Map<String, dynamic> user) {
    debugPrint(user.toString());
    debugPrint(UserUpdateModel(
      email: user['email'],
      name: user['name'],
      id: user['id'],
      age: user['age'],
      gender: user['gender'],
      height: user['height'],
      weight: user['weight'],
      deviceUsageLimit: user['deviceUsageLimit'],
      dietPreference: user['diet_preference'],
      isEmailVerified: user['isEmailVerified'],
      isAccountCompleted: user['isAccountCompleted'],
      appPermissions: [],
      goals: [],
    ).toString());
    return UserUpdateModel(
      email: user['email'],
      name: user['name'],
      id: user['id'],
      age: user['age'],
      gender: user['gender'],
      height: user['height'],
      weight: user['weight'],
      deviceUsageLimit: user['deviceUsageLimit'],
      dietPreference: user['diet_preference'],
      isEmailVerified: user['isEmailVerified'],
      isAccountCompleted: user['isAccountCompleted'],
      appPermissions: List<String>.from(user['app_permissions']),
      goals: List<Map<String, String>>.from(user['goals'].map((goal) => {
            'id': goal['id'] as String,
            'goal_type': goal['goal_type'] as String,
            'selected_goal': goal['selected_goal'] as String,
          })),
    );
  }
}
