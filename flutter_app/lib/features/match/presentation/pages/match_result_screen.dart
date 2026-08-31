import 'package:flutter/material.dart';
import 'package:flutter_app/features/match/presentation/widgets/widget.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/responsive.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../data/controller/match_provider.dart';

class MatchResultScreen extends StatelessWidget {
  const MatchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final result = context.watch<MatchProvider>().result;
    final mobile = Responsive.isMobile(context);

    if (result == null) {
      return const Scaffold(body: Center(child: Text('No result available')));
    }

    final isMatch = result.isMatch;

    final boyName = result.boyName.trim().isNotEmpty
        ? result.boyName
        : 'BoyName';

    final girlName = result.girlName.trim().isNotEmpty
        ? result.girlName
        : 'GirlName';

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
                constraints: const BoxConstraints(maxWidth: 640),
                child: Container(
                  padding: EdgeInsets.all(mobile ? 18 : 26),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
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
                      const SizedBox(height: 4),

                      // --------------------------------------------------
                      // TITLE
                      // --------------------------------------------------
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '🔥 🔥  Find the Match\nResult...  🔥 🔥',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontSize: mobile ? 28 : 42,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                                height: 1.08,
                                letterSpacing: -1,
                              ),
                        ),
                      ),

                      const SizedBox(height: 2),

                      // --------------------------------------------------
                      // CENTER HEART
                      // --------------------------------------------------
                      SizedBox(
                        height: mobile ? 130 : 180,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              child: Container(
                                width: mobile ? 56 : 68,
                                height: mobile ? 56 : 68,
                                decoration: BoxDecoration(
                                  color: isMatch
                                      ? AppColors.matchRed
                                      : AppColors.charcoalInk,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColors.shadow,
                                      blurRadius: 12,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  isMatch ? Icons.favorite : Icons.heart_broken,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 2),

                      // --------------------------------------------------
                      // RESULT TEXT
                      // --------------------------------------------------
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          isMatch
                              ? '$boyName and\n$girlName are\na match...!!'
                              : '$boyName and\n$girlName are\nNOT a match...!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge
                              ?.copyWith(
                                fontSize: mobile ? 20 : 32,
                                color: AppColors.charcoalInk,
                                fontWeight: FontWeight.w900,
                                height: 0.6,
                                letterSpacing: -2,
                              ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // --------------------------------------------------
                      // SUBTITLE
                      // --------------------------------------------------
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          isMatch
                              ? 'Made for Each Other.....!!!!'
                              : 'ayyoo, ayyoo ellaam pochu...!',
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

                      // --------------------------------------------------
                      // HEART ROW
                      // --------------------------------------------------
                      HeartRow(isMatch: isMatch),

                      const SizedBox(height: 24),

                      // --------------------------------------------------
                      // CHECK ANOTHER MATCH BUTTON
                      // --------------------------------------------------
                      PrimaryButton(
                        text: 'Check Another Match',
                        pill: true,
                        onPressed: () {
                          context.read<MatchProvider>().clearResult();

                          Navigator.pop(context);
                        },
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
