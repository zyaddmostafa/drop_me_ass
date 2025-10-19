import 'dart:math';
import '../models/rvm_model.dart';

class RvmRepo {
  Future<void> _simulateDelay() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<List<RvmModel>> getNearbyRVMs() async {
    await _simulateDelay();

    return RvmModel.nearbyRVMs;
  }

  Future<List<RvmModel>> getAllRVMs() async {
    await _simulateDelay();

    return RvmModel.mockData;
  }

  Future<RvmModel> getRandomRVM() async {
    await _simulateDelay();
    final random = Random();
    final shuffled = List<RvmModel>.from(RvmModel.mockData)..shuffle(random);

    return shuffled.first;
  }

  Future<List<RvmModel>> getActiveRVMs() async {
    await _simulateDelay();

    return RvmModel.activeRVMs;
  }
}
