class UserModel {
  final String id;
  final String name;
  final int points;
  final List<String> redeemedRewards;
  final int lifetimePoints;
  final int totalRecycledBottles;

  UserModel({
    required this.id,
    required this.name,
    required this.points,
    required this.redeemedRewards,
    int? lifetimePoints,
    this.totalRecycledBottles = 0,
  }) : lifetimePoints = lifetimePoints ?? points;

  String get tier {
    if (lifetimePoints >= 2001) return 'Gold';
    if (lifetimePoints >= 501) return 'Silver';

    return 'Bronze';
  }

  String get tierEmoji {
    if (lifetimePoints >= 2001) return '👑';
    if (lifetimePoints >= 501) return '⭐';

    return '🥉';
  }

  static UserModel get mockUser => UserModel(
    id: 'USER001',
    name: 'Zyad Mostafa',
    points: 850,
    lifetimePoints: 1200,
    redeemedRewards: [],
    totalRecycledBottles: 85,
  );
}
