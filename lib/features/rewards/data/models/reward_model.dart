class RewardModel {
  final String id;
  final String name;
  final String imageUrl;
  final int pointCost;
  final String category;
  final String description;
  final bool isAvailable;
  final int stockRemaining;
  final String terms;
  final DateTime? expiryDate;

  RewardModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.pointCost,
    required this.category,
    required this.description,
    this.isAvailable = true,
    this.stockRemaining = 999,
    this.terms = '',
    this.expiryDate,
  });

  bool get isExpired =>
      expiryDate != null && expiryDate!.isBefore(DateTime.now());

  bool get canRedeem => isAvailable && stockRemaining > 0 && !isExpired;

  bool isAffordable(int userPoints) => userPoints >= pointCost;

  int pointsNeeded(int userPoints) =>
      userPoints >= pointCost ? 0 : pointCost - userPoints;

  /// Mock rewards data - 15 rewards across 5 categories
  static final List<RewardModel> mockRewards = [
    // ==================== VOUCHERS ====================
    RewardModel(
      id: 'RWD001',
      name: 'Costa Coffee Voucher',
      description:
          'Enjoy a free medium coffee at any Costa Coffee branch nationwide. Valid for 30 days from redemption.',
      imageUrl: 'assets/images/rewards/Costa-Coffee-logo-recycling.jpg',
      pointCost: 150,
      category: 'Vouchers',
      isAvailable: true,
      stockRemaining: 45,
      terms:
          '• Valid for 30 days\n• One-time use only\n• Show QR code at counter\n• All Costa branches nationwide',
      expiryDate: DateTime.now().add(const Duration(days: 90)),
    ),
    RewardModel(
      id: 'RWD002',
      name: 'Uber Eats 50 EGP',
      description:
          'Get 50 EGP credit on your next Uber Eats order. Minimum order 100 EGP required.',
      imageUrl: 'assets/images/rewards/uber_eats.png',
      pointCost: 250,
      category: 'Vouchers',
      isAvailable: true,
      stockRemaining: 30,
      terms:
          '• Valid for 60 days\n• Minimum order 100 EGP\n• One-time use\n• Cannot be combined with other offers',
      expiryDate: DateTime.now().add(const Duration(days: 90)),
    ),
    RewardModel(
      id: 'RWD003',
      name: 'Carrefour 100 EGP',
      description:
          '100 EGP discount voucher for Carrefour. Use in-store or online shopping.',
      imageUrl: 'assets/images/rewards/carrefour.png',
      pointCost: 500,
      category: 'Vouchers',
      isAvailable: true,
      stockRemaining: 20,
      terms:
          '• Valid for 90 days\n• In-store or online\n• Cannot be combined with other offers\n• Show voucher code at checkout',
      expiryDate: DateTime.now().add(const Duration(days: 120)),
    ),
    RewardModel(
      id: 'RWD004',
      name: 'Cinema Ticket',
      description:
          'Free cinema ticket valid at any Vox Cinemas location. Standard 2D movies only.',
      imageUrl: 'assets/images/rewards/max_cinema.jpg',
      pointCost: 350,
      category: 'Vouchers',
      isAvailable: true,
      stockRemaining: 25,
      terms:
          '• Valid for 45 days\n• Standard 2D movies only\n• Subject to seat availability\n• All Vox Cinemas locations',
      expiryDate: DateTime.now().add(const Duration(days: 60)),
    ),

    // ==================== PRODUCTS ====================
    RewardModel(
      id: 'RWD005',
      name: 'Eco Water Bottle',
      description:
          'Premium stainless steel water bottle. 750ml capacity. BPA-free and eco-friendly.',
      imageUrl: 'assets/images/rewards/watter_bottle.webp',
      pointCost: 400,
      category: 'Products',
      isAvailable: true,
      stockRemaining: 15,
      terms:
          '• Delivery within 7-14 days\n• Color selection based on availability\n• High-quality stainless steel\n• BPA-free and eco-friendly',
      expiryDate: null,
    ),
    RewardModel(
      id: 'RWD006',
      name: 'Reusable Shopping Bag',
      description:
          'Durable canvas shopping bag. Perfect for groceries. Drop Me branded design.',
      imageUrl: 'assets/images/rewards/shopping_bag.jpg',
      pointCost: 200,
      category: 'Products',
      isAvailable: true,
      stockRemaining: 50,
      terms:
          '• Delivery within 5-10 days\n• Durable canvas material\n• Drop Me branded\n• Machine washable',
      expiryDate: null,
    ),
    RewardModel(
      id: 'RWD007',
      name: 'Bamboo Cutlery Set',
      description:
          'Eco-friendly bamboo cutlery set with carrying case. Perfect for on-the-go meals.',
      imageUrl: 'assets/images/rewards/cutler_set.webp',
      pointCost: 300,
      category: 'Products',
      isAvailable: true,
      stockRemaining: 35,
      terms:
          '• Includes fork, spoon, knife, chopsticks\n• Carrying case included\n• 100% natural bamboo\n• Delivery within 7-10 days',
      expiryDate: null,
    ),

    // ==================== CHARITY ====================
    RewardModel(
      id: 'RWD008',
      name: 'Plant a Tree',
      description:
          'Plant a tree in your name. Contribute to Egypt\'s reforestation efforts.',
      imageUrl: 'assets/images/rewards/Plant-a-tree-tile.jpg',
      pointCost: 100,
      category: 'Charity',
      isAvailable: true,
      stockRemaining: 999,
      terms:
          '• Tree planted within 30 days\n• Certificate sent via email\n• GPS location of your tree\n• Supporting local communities',
      expiryDate: null,
    ),
    RewardModel(
      id: 'RWD009',
      name: 'Beach Cleanup Donation',
      description:
          'Support beach cleanup initiatives. Your points fund equipment and volunteers.',
      imageUrl: 'assets/images/rewards/beach_cleanup.webp',
      pointCost: 500,
      category: 'Charity',
      isAvailable: true,
      stockRemaining: 999,
      terms:
          '• Donation processed immediately\n• Tax receipt available\n• Support coastal conservation\n• Monthly impact reports',
      expiryDate: null,
    ),
    RewardModel(
      id: 'RWD010',
      name: 'School Supplies Fund',
      description:
          'Help provide school supplies to underprivileged children across Egypt.',
      imageUrl: 'assets/images/rewards/school-supply-donation.png',
      pointCost: 250,
      category: 'Charity',
      isAvailable: true,
      stockRemaining: 999,
      terms:
          '• Direct support to children in need\n• Donation receipt provided\n• Photos and updates sent via email\n• Vetted partner organizations',
      expiryDate: null,
    ),

    // ==================== EXPERIENCES ====================
    RewardModel(
      id: 'RWD012',
      name: 'Green Tour Cairo',
      description:
          'Guided tour of Cairo\'s eco-initiatives and sustainable projects. 4-hour experience.',
      imageUrl: 'assets/images/rewards/cairo_tour.png',
      pointCost: 800,
      category: 'Experiences',
      isAvailable: true,
      stockRemaining: 8,
      terms:
          '• 4-hour guided tour\n• Transportation included\n• Light refreshments\n• Book 1 week in advance',
      expiryDate: DateTime.now().add(const Duration(days: 60)),
    ),

    // ==================== CASHBACK ====================
    RewardModel(
      id: 'RWD013',
      name: '50 EGP Credit',
      description:
          'Direct 50 EGP credit to your mobile wallet. Instant transfer.',
      imageUrl: 'assets/images/rewards/50_egp.webp',
      pointCost: 500,
      category: 'Cashback',
      isAvailable: true,
      stockRemaining: 100,
      terms:
          '• Instant transfer\n• No expiry date\n• Supported wallets: Vodafone Cash, Orange Cash, Etisalat Cash\n• Minimum balance: 0 EGP',
      expiryDate: null,
    ),
    RewardModel(
      id: 'RWD014',
      name: '100 EGP Credit',
      description:
          'Direct 100 EGP credit to your mobile wallet. Instant transfer.',
      imageUrl: 'assets/images/rewards/100_egp.webp',
      pointCost: 1000,
      category: 'Cashback',
      isAvailable: true,
      stockRemaining: 50,
      terms:
          '• Instant transfer\n• No expiry date\n• Supported wallets: Vodafone Cash, Orange Cash, Etisalat Cash\n• Minimum balance: 0 EGP',
      expiryDate: null,
    ),
    RewardModel(
      id: 'RWD015',
      name: '200 EGP Credit',
      description:
          'Direct 200 EGP credit to your mobile wallet. Instant transfer.',
      imageUrl: 'assets/images/rewards/200_egp.jpg',
      pointCost: 2000,
      category: 'Cashback',
      isAvailable: true,
      stockRemaining: 25,
      terms:
          '• Instant transfer\n• No expiry date\n• Supported wallets: Vodafone Cash, Orange Cash, Etisalat Cash\n• Minimum balance: 0 EGP',
      expiryDate: null,
    ),
  ];
}
