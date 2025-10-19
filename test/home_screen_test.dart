import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drop_me_ass/features/home/data/models/user_model.dart';

void main() {
  group('Home Screen Tests', () {
    test('Test Home Screen loads correctly - User Model', () {
      // Arrange: Get mock user
      final user = UserModel.mockUser;

      // Assert: Verify user data is correct
      expect(user.name, equals('Zyad Ahmed'));
      expect(user.points, equals(850));
      expect(user.tier, equals('Silver'));
      expect(user.id, equals('USER001'));

      debugPrint('✅ TEST PASSED: User Model loads correctly');
      debugPrint('   Name: ${user.name}');
      debugPrint('   Points: ${user.points}');
      debugPrint('   Tier: ${user.tier}');
    });
  });
}
