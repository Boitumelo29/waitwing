import 'package:flutter/material.dart';

class LongTextField extends StatelessWidget {
  //final GlobalKey globalkey;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool? suffexIcon;

  const LongTextField(
      {super.key,
      // required this.globalkey,
      required this.controller,
      required this.hintText,
      required this.labelText,
      this.suffexIcon});

  @override
  Widget build(BuildContext context) {
    // suffexIcon = false;
    return TextFormField(
      //  key: globalkey,
      controller: controller,
      decoration: InputDecoration(
        // suffix: suffexIcon ? Icon(Icons.remove_red_eye) : Icon(Icons.remove_red_eye),

        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class LongTextFieldForm extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String labelText;
  final bool showSuffixIcon;
  final bool showPrefixIcon;
  final IconData? prefixIcon;
  final bool obsureText;
  final String? prefixText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Function(String) onChanged;
  final bool isRed;

  const LongTextFieldForm(
      {super.key,
      this.controller,
      this.focusNode,
      required this.onChanged,
       this.hintText,
      required this.labelText,
      this.showSuffixIcon = false,
      this.showPrefixIcon = false,
      this.prefixText,
      this.prefixIcon,
      required this.validator,
      this.obsureText = false,
      this.isRed = false});

  @override
  State<LongTextFieldForm> createState() => _LongTextFieldFormState();
}

class _LongTextFieldFormState extends State<LongTextFieldForm> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      /// Todo: dont forget https://www.geeksforgeeks.org/how-to-hide-the-keyboard-when-user-tap-out-of-the-textfield-in-flutter/?ref=ml_lbp
      focusNode: widget.focusNode,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: widget.obsureText ? passwordVisible : false,
      controller: widget.controller,
      decoration: InputDecoration(
        focusedBorder: widget.isRed
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.green,
                  width: 0.7,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey, width: 0.7)),
        enabledBorder: widget.isRed
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.green,
                  width: 0.7,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey, width: 0.7)),
        prefixIcon: widget.showPrefixIcon ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.showSuffixIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                icon: Icon(passwordVisible
                    ? Icons.visibility_off_sharp
                    : Icons.visibility_sharp),
              )
            : null,
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixText: widget.prefixText,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(20)),
      ),

      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );
  }
}
