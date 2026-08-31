import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/responsive.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

class CoupleImages extends StatelessWidget {
  const CoupleImages({
    super.key,
    required this.boyImage,
    required this.girlImage,
    required this.isMatch,
  });

  final String boyImage;
  final String girlImage;
  final bool isMatch;

  @override
  Widget build(BuildContext context) {
    final size = Responsive.isMobile(context) ? 150.0 : 180.0;

    return SizedBox(
      height: size + 30,
      width: size * 2.2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // --------------------------------------------------
          // BOY IMAGE
          // --------------------------------------------------
          Positioned(
            left: 0,
            top: 0,
            child: ClipOval(
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 6),
                  borderRadius: BorderRadius.circular(size),
                ),
                child: Image.network(
                  boyImage,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: size,
                      height: size,
                      color: const Color(0xFFD8D8D8),
                      child: const Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // --------------------------------------------------
          // GIRL IMAGE
          // --------------------------------------------------
          Positioned(
            right: 0,
            bottom: 0,
            child: ClipOval(
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 6),
                  borderRadius: BorderRadius.circular(size),
                ),
                child: Image.network(
                  girlImage,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: size,
                      height: size,
                      color: const Color(0xFFD8D8D8),
                      child: const Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // --------------------------------------------------
          // CENTER HEART
          // --------------------------------------------------
          Positioned(
            child: Container(
              width: 76,
              height: 76,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x228A0F2A),
                    blurRadius: 16,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Icon(
                isMatch ? Icons.favorite : Icons.heart_broken,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HEART ROW
// ============================================================

class HeartRow extends StatelessWidget {
  const HeartRow({super.key, required this.isMatch});

  final bool isMatch;

  @override
  Widget build(BuildContext context) {
    const count = 7;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(
            isMatch ? Icons.favorite : Icons.heart_broken,
            color: AppColors.matchRed,
            size: isMatch ? 24 : 26,
          ),
        ),
      ),
    );
  }
}
