import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/data/repo/rvm_repo.dart';
import '../../home/data/models/rvm_model.dart';
import 'qr_scanner_state.dart';

class QRScannerCubit extends Cubit<QRScannerState> {
  final RvmRepo rvmRepo;

  QRScannerCubit({required this.rvmRepo}) : super(const QRScannerLoading());

  Future<void> loadNearbyRVMs() async {
    try {
      emit(const QRScannerLoading());

      final rvms = await rvmRepo.getNearbyRVMs();

      emit(QRScannerInitial(nearbyRVMs: rvms));
    } catch (e) {
      emit(QRScannerError(message: 'Failed to load RVMs: ${e.toString()}'));
    }
  }

  Future<void> startScanning() async {
    emit(const QRScannerScanning());

    try {
      await Future.delayed(const Duration(seconds: 2));

      final random = Random();
      final isSuccess = random.nextInt(100) < 80;

      if (isSuccess) {
        final rvm = await rvmRepo.getRandomRVM();
        emit(QRScannerSuccess(scannedRVM: rvm));
      } else {
        emit(const QRScannerError(message: 'Invalid QR Code'));
      }
    } catch (e) {
      emit(QRScannerError(message: 'Scan failed: ${e.toString()}'));
    }
  }
}
