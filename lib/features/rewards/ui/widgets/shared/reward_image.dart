import 'package:flutter/material.dart';
import '../../../data/models/reward_model.dart';
import '../../../../../core/theme/app_colors.dart';

class RewardImage extends StatelessWidget {
  final RewardModel reward;
  final BoxFit fit;

  const RewardImage({super.key, required this.reward, this.fit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      reward.imageUrl,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[200],
          child: Center(
            child: Icon(_getCategoryIcon(), size: 60, color: AppColors.primary),
          ),
        );
      },
    );
  }

  IconData _getCategoryIcon() {
    switch (reward.category.toLowerCase()) {
      case 'vouchers':
        return Icons.local_offer;
      case 'products':
        return Icons.shopping_bag;
      case 'charity':
        return Icons.volunteer_activism;
      case 'experiences':
        return Icons.celebration;
      case 'cashback':
        return Icons.attach_money;
      default:
        return Icons.card_giftcard;
    }
  }
}
