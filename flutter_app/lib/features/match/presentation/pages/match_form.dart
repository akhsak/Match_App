// import 'package:flutter/material.dart';
// import 'package:flutter_app/features/match/data/providers/match_provider.dart';
// import 'package:provider/provider.dart';

// import '../../../../core/constants/app_constants.dart';
// import '../../../../core/constants/ui_constants.dart';
// import '../../../../core/utils/validators.dart';
// import '../controllers/match_input_controller.dart';
// import '../providers/match_provider.dart';
// import '../widgets/match_card.dart';

// class MatchForm extends StatelessWidget {
//   const MatchForm({required this.onSubmit, super.key});

//   final VoidCallback onSubmit;

//   @override
//   Widget build(BuildContext context) {
//     final MatchInputController controller =
//         context.read<MatchInputController>();

//     final bool enabled = !context.select<MatchProvider, bool>(
//       (MatchProvider p) => p.isLoading,
//     );

//     return Form(
//       key: controller.formKey,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           const MatchHeader(),
//           const SizedBox(height: UiConstants.spaceLg),
//           NameInputField(
//             label: AppConstants.girlNameLabel,
//             controller: controller.girlNameController,
//             focusNode: controller.girlNameFocusNode,
//             enabled: enabled,
//             textInputAction: TextInputAction.next,
//             onChanged: controller.onGirlNameChanged,
//             onSubmitted: controller.focusBoyNameField,
//             validator: (String? value) => Validators.validateName(
//               value,
//               label: 'Girl name',
//             ),
//           ),
//           const SizedBox(height: UiConstants.spaceMd),
//           NameInputField(
//             label: AppConstants.boyNameLabel,
//             controller: controller.boyNameController,
//             focusNode: controller.boyNameFocusNode,
//             enabled: enabled,
//             textInputAction: TextInputAction.done,
//             onChanged: controller.onBoyNameChanged,
//             onSubmitted: onSubmit,
//             validator: (String? value) => Validators.validateName(
//               value,
//               label: 'Boy name',
//             ),
//           ),
//           const SizedBox(height: UiConstants.spaceXl),
//           CheckMatchButton(onPressed: onSubmit),
//         ],
//       ),
//     );
//   }
// }