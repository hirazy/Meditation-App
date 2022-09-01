import 'package:flutter/widgets.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [],
          ),
        ),
        child: Row(
          children: const [

          ],
        ),
      ),
    );
  }
}
