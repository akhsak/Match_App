import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/responsive.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/bottomnav.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../data/controller/match_provider.dart';
import 'match_result_screen.dart';

class MatchInputScreen extends StatelessWidget {
  const MatchInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MatchInputScreenContent();
  }
}

class MatchInputScreenContent extends StatefulWidget {
  const MatchInputScreenContent({super.key});

  @override
  State<MatchInputScreenContent> createState() => _MatchInputScreenState();
}

class MatchInputFormController {
  final formKey = GlobalKey<FormState>();
  final boyController = TextEditingController();
  final girlController = TextEditingController();

  void dispose() {
    boyController.dispose();
    girlController.dispose();
  }
}

class _MatchInputScreenState extends State<MatchInputScreenContent> {
  late final MatchInputFormController _controller;
  bool _showBestWishes = false;

  @override
  void initState() {
    super.initState();
    _controller = MatchInputFormController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _checkMatch() async {
    if (!_controller.formKey.currentState!.validate()) return;

    final loadingStartedAt = DateTime.now();
    setState(() => _showBestWishes = true);

    final provider = context.read<MatchProvider>();
    final success = await provider.checkMatch(
      boyName: _controller.boyController.text,
      girlName: _controller.girlController.text,
    );

    final elapsed = DateTime.now().difference(loadingStartedAt);
    const minimumLoadingTime = Duration(milliseconds: 2500);
    if (elapsed < minimumLoadingTime) {
      await Future<void>.delayed(minimumLoadingTime - elapsed);
    }

    if (!mounted) return;

    setState(() => _showBestWishes = false);

    if (success) {
      _controller.boyController.clear();
      _controller.girlController.clear();
      _controller.formKey.currentState?.reset();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Data added successfully.')));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const MatchResultScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(provider.errorMessage ?? 'Something went wrong'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Scaffold(
      bottomNavigationBar: const AppBottomNav(selectedIndex: 0),
      body: SafeArea(
        child: Consumer<MatchProvider>(
          builder: (context, provider, _) {
            return _MatchInputScreenBody(
              mobile: mobile,
              controller: _controller,
              showLoading: _showBestWishes || provider.isLoading,
              provider: provider,
              onSubmit: _checkMatch,
            );
          },
        ),
      ),
    );
  }
}

class _MatchInputScreenBody extends StatelessWidget {
  const _MatchInputScreenBody({
    required this.mobile,
    required this.controller,
    required this.showLoading,
    required this.provider,
    required this.onSubmit,
  });

  final bool mobile;
  final MatchInputFormController controller;
  final bool showLoading;
  final MatchProvider provider;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.horizontalPadding(context),
          vertical: 20,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              children: [
                _BrandHeader(mobile: mobile),
                const SizedBox(height: 28),
                _MatchFormCard(
                  mobile: mobile,
                  showLoading: showLoading,
                  boyController: controller.boyController,
                  girlController: controller.girlController,
                  onSubmit: onSubmit,
                  provider: provider,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader({required this.mobile});

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: mobile ? 8 : 16),
        child: RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.matchRed,
                    size: mobile ? 28 : 34,
                  ),
                ),
              ),
              TextSpan(
                text: 'Match.Com\n',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: mobile ? 24 : 38,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  height: 0.95,
                ),
              ),
              TextSpan(
                text: 'Surprise',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: mobile ? 24 : 38,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  height: 0.95,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MatchFormCard extends StatelessWidget {
  const _MatchFormCard({
    required this.mobile,
    required this.showLoading,
    required this.boyController,
    required this.girlController,
    required this.onSubmit,
    required this.provider,
  });

  final bool mobile;
  final bool showLoading;
  final TextEditingController boyController;
  final TextEditingController girlController;
  final VoidCallback onSubmit;
  final MatchProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(mobile ? 20 : 28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.outlineVariant),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              _TitleText(mobile: mobile),
              const SizedBox(height: 14),
              _SubtitleText(mobile: mobile),
              const SizedBox(height: 28),
              _NameField(
                label: 'Girl Name:',
                controller: girlController,
                hintText: 'Enter her name',
                icon: Icons.face_3_outlined,
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Please enter girl name'
                    : null,
              ),
              const SizedBox(height: 20),
              _NameField(
                label: 'Boy Name:',
                controller: boyController,
                hintText: 'Enter his name',
                icon: Icons.face_outlined,
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Please enter boy name'
                    : null,
              ),
              const SizedBox(height: 26),
              PrimaryButton(
                text: provider.isLoading || showLoading
                    ? 'Checking...'
                    : 'Check Match',
                onPressed: provider.isLoading || showLoading ? null : onSubmit,
              ),
            ],
          ),
          if (showLoading)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.deepRose.withValues(alpha: 0.96),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const _LoadingOverlay(),
              ),
            ),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText({required this.mobile});

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome to\nMatch.Com Surprise\nApp...!!',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontSize: mobile ? 28 : 32,
        color: AppColors.charcoalInk,
        height: 1.05,
      ),
    );
  }
}

class _SubtitleText extends StatelessWidget {
  const _SubtitleText({required this.mobile});

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Enter names to discover your\nconnection.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: mobile ? 16 : 18,
        color: AppColors.onSurfaceVariant,
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    required this.label,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.validator,
  });

  final String label;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.charcoalInk,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            validator: validator,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.onSurface,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
              filled: true,
              fillColor: const Color(0xFFF8F1F1),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.outlineVariant),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.outlineVariant),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.matchRed,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingOverlay extends StatelessWidget {
  const _LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.auto_awesome,
              color: AppColors.secondaryContainer,
              size: 46,
            ),
            const SizedBox(height: 18),
            Text(
              'All the best buddy...!!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontSize: mobile ? 18 : 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 18),
            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: AppColors.matchRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
