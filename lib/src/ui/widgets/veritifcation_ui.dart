import 'package:arrowad_grade_eleven/src/app/core/validators/verification_code_validator.dart';
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class VerificationUI extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onPressed;

  const VerificationUI({
    Key key,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 35),
          Text(
            "Verify Phone Number",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Please be patient while the Verification Code is sent via SMS",
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).textTheme.bodySmall.color,
            ),
          ),
          const SizedBox(height: 25),
          TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: const TextInputType.numberWithOptions(),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              labelText: "Verification",
              errorMaxLines: 2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (String verificationCode) {
              return validateVerificationCode(verificationCode);
            },
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Verify",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
