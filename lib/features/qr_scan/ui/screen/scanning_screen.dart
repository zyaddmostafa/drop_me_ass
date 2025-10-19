import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/extention.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../cubit/qr_scanner_cubit.dart';
import '../../cubit/qr_scanner_state.dart';
import '../widgets/scanning/camera_placeholder.dart';
import '../widgets/scanning/scanning_frame.dart';
import '../widgets/scanning/scanning_status_indicator.dart';
import '../widgets/confirmation/scan_error_dialog.dart';

class ScanningScreen extends StatefulWidget {
  const ScanningScreen({super.key});

  @override
  State<ScanningScreen> createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scanAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
    // Start scanning via Cubit
    context.read<QRScannerCubit>().startScanning();
  }

  void _setupAnimation() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scanAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleRetry() {
    // Restart animation and trigger new scan
    setState(() {
      _animationController.reset();
      _animationController.repeat(reverse: true);
    });
    context.read<QRScannerCubit>().startScanning();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QRScannerCubit, QRScannerState>(
      listener: (context, state) {
        if (state is QRScannerSuccess) {
          _qrScannerSuccess(context, state);
        }

        if (state is QRScannerError) {
          _qrScannerError(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(
          title: 'Scan QR Code',
          showBackButton: true,
          leadingIcon: Icons.close,
          leadingIconColor: Colors.white,
          backgroundColor: Colors.transparent,
          titleStyle: AppTextStyles.font18SemiBoldBlack.copyWith(
            color: Colors.white,
          ),
          onBackPressed: () => context.pop(),
        ),
        body: Stack(
          children: [
            const CameraPlaceholder(),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScanningFrame(scanAnimation: _scanAnimation),
                  verticalSpace(24),
                  const ScanningStatusIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _qrScannerError(BuildContext context) {
    ScanErrorDialog.show(
      context: context,
      onCancel: () {
        context.pop();
        context.pop();
      },
      onRetry: () {
        context.pop();
        _handleRetry();
      },
    );
  }

  void _qrScannerSuccess(BuildContext context, QRScannerSuccess state) {
    context.pushReplacementNamed(
      Routes.confirmationScreen,
      arguments: state.scannedRVM,
    );
  }
}
