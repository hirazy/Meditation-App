import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/input_part/input_text_area.dart';
import 'sign_up_state.dart';
import 'sign_up_view_model.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final provider =
    StateNotifierProvider<SignUpViewModel, SignUpState>((ref) =>
        SignUpViewModel(),);

    return Scaffold(
      body: Column(
        children: [
          InputTextArea(
            initialText: '',
          )
        ],
      ),
    );
  }
}
