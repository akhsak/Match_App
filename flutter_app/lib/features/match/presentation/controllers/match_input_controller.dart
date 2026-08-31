// import 'package:flutter/material.dart';
// import 'package:flutter_app/features/match/data/providers/match_provider.dart';

// import '../providers/match_provider.dart';

// class MatchInputController extends ChangeNotifier {
//   MatchInputController({required MatchProvider matchProvider})
//       : _matchProvider = matchProvider;

//   final MatchProvider _matchProvider;

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController girlNameController = TextEditingController();
//   final TextEditingController boyNameController = TextEditingController();
//   final FocusNode girlNameFocusNode = FocusNode();
//   final FocusNode boyNameFocusNode = FocusNode();

//   void onGirlNameChanged(String value) => _matchProvider.updateGirlName(value);

//   void onBoyNameChanged(String value) => _matchProvider.updateBoyName(value);

//   void focusBoyNameField() => boyNameFocusNode.requestFocus();

//   Future<bool> submit() async {
//     if (_matchProvider.isLoading) return false;
//     if (!(formKey.currentState?.validate() ?? false)) return false;

//     girlNameFocusNode.unfocus();
//     boyNameFocusNode.unfocus();

//     return _matchProvider.checkMatch();
//   }

//   void clear() {
//     girlNameController.clear();
//     boyNameController.clear();
//     formKey.currentState?.reset();
//     _matchProvider.reset();
//   }

//   @override
//   void dispose() {
//     girlNameController.dispose();
//     boyNameController.dispose();
//     girlNameFocusNode.dispose();
//     boyNameFocusNode.dispose();
//     super.dispose();
//   }
// }
