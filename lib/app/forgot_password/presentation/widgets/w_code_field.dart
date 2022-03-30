import 'package:flutter/material.dart';
import 'package:mi_learning/app/forgot_password/presentation/widgets/w_code_input.dart';

class WCodeField extends StatelessWidget {
  final List<String> code = List.filled(4, '');
  final int length;
  final bool numberOnly;
  final void Function(String) onCodeEntered;

  WCodeField({
    Key? key,
    required this.length,
    required this.numberOnly,
    required this.onCodeEntered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        length,
        (index) => Expanded(
          child: WCodeInput(
            autofocus: index == 0,
            numberOnly: numberOnly,
            onChanged: (value) {
              code[index] = value;
              final codeValue = code.join();
              if (codeValue.isNotEmpty) {
                onCodeEntered(codeValue);
              }
            },
          ),
        ),
      ),
    );
  }
}
