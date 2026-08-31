import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/responsive.dart';
import 'package:flutter_app/core/theme/app_colors.dart';
import 'package:flutter_app/core/widgets/primary_button.dart';

class NoMatchResultScreen extends StatelessWidget {
  final String boyName;
  final String girlName;
  final VoidCallback? onAnotherMatch;

  const NoMatchResultScreen({
    super.key,
    required this.boyName,
    required this.girlName,
    this.onAnotherMatch,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    final safeBoyName = boyName.trim().isNotEmpty ? boyName : 'BoyName';
    final safeGirlName = girlName.trim().isNotEmpty ? girlName : 'GirlName';

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.mistWhite, AppColors.tertiaryFixed],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.horizontalPadding(context),
                vertical: 24,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: Container(
                  padding: EdgeInsets.all(mobile ? 18 : 26),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shadow,
                        blurRadius: 18,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.heart_broken,

                            color: AppColors.matchRed,
                            size: 26,
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.heart_broken,
                            color: AppColors.matchRed,
                            size: 26,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Find the Match\nResult...',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontSize: mobile ? 28 : 38,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                                height: 1.08,
                              ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Icon(
                        Icons.heart_broken,
                        color: AppColors.matchRed,
                        size: 46,
                      ),
                      const SizedBox(height: 18),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '$safeBoyName and\n$safeGirlName are\nNOT a match...!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge
                              ?.copyWith(
                                fontSize: mobile ? 30 : 52,
                                color: AppColors.charcoalInk,
                                fontWeight: FontWeight.w900,
                                height: 0.9,
                                letterSpacing: -2,
                              ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'ayyoo, ayyoo ellaam pochu...!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontSize: mobile ? 18 : 22,
                                color: AppColors.primary,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(
                              Icons.favorite,
                              size: 24,
                              color: AppColors.matchRed,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        text: 'Check Another Match',
                        pill: true,
                        onPressed: onAnotherMatch,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
