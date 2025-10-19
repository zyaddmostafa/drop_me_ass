import '../../home/data/models/rvm_model.dart';

abstract class QRScannerState {
  const QRScannerState();
}

class QRScannerInitial extends QRScannerState {
  final List<RvmModel> nearbyRVMs;

  const QRScannerInitial({required this.nearbyRVMs});
}

class QRScannerLoading extends QRScannerState {
  const QRScannerLoading();
}

class QRScannerScanning extends QRScannerState {
  const QRScannerScanning();
}

class QRScannerSuccess extends QRScannerState {
  final RvmModel scannedRVM;

  const QRScannerSuccess({required this.scannedRVM});
}

class QRScannerError extends QRScannerState {
  final String message;

  const QRScannerError({required this.message});
}
