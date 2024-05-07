// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final void Function()? onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.07,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Theme.of(context).colorScheme.primary,
          child: Center(
              child: Text(
            text ?? "",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
