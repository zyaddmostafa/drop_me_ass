class RvmModel {
  final String id;
  final String location;
  final String address;
  final bool isActive;
  final int bottleCapacity;
  final int currentBottles;

  RvmModel({
    required this.id,
    required this.location,
    required this.address,
    required this.isActive,
    required this.bottleCapacity,
    required this.currentBottles,
  });

  int get availableCapacity => bottleCapacity - currentBottles;
  double get fillPercentage => (currentBottles / bottleCapacity * 100);
  int get pointsPerBottle => 10;

  // Mock data - 7 RVMs across Cairo
  static final List<RvmModel> mockData = [
    RvmModel(
      id: 'RVM042',
      location: 'City Stars Mall',
      address: 'Omar Ibn Al-Khattab, Nasr City, Cairo',
      isActive: true,
      bottleCapacity: 500,
      currentBottles: 225, // 45% full
    ),
    RvmModel(
      id: 'RVM018',
      location: 'Maadi Metro Station',
      address: 'Corniche El Nile, Maadi, Cairo',
      isActive: true,
      bottleCapacity: 400,
      currentBottles: 80, // 20% full
    ),
    RvmModel(
      id: 'RVM025',
      location: 'Zamalek Club',
      address: '26th of July St, Zamalek, Cairo',
      isActive: false, // Maintenance
      bottleCapacity: 450,
      currentBottles: 180,
    ),
    RvmModel(
      id: 'RVM067',
      location: 'Cairo Festival City',
      address: 'Road 90, New Cairo, Cairo',
      isActive: true,
      bottleCapacity: 600,
      currentBottles: 510, // 85% full - almost full!
    ),
    RvmModel(
      id: 'RVM091',
      location: 'Mall of Arabia',
      address: 'Mehwar 26 July, 6th of October City',
      isActive: true,
      bottleCapacity: 550,
      currentBottles: 165, // 30% full
    ),
    RvmModel(
      id: 'RVM103',
      location: 'Downtown Mall',
      address: 'Talaat Harb St, Downtown, Cairo',
      isActive: true,
      bottleCapacity: 350,
      currentBottles: 210, // 60% full
    ),
    RvmModel(
      id: 'RVM156',
      location: 'Heliopolis Square',
      address: 'Al-Ahram St, Heliopolis, Cairo',
      isActive: false, // Out of service
      bottleCapacity: 400,
      currentBottles: 400, // Full
    ),
  ];

  // Helper to get nearby RVMs (first 3)
  static List<RvmModel> get nearbyRVMs => mockData.take(3).toList();

  // Helper to get active RVMs only
  static List<RvmModel> get activeRVMs =>
      mockData.where((rvm) => rvm.isActive).toList();
}
