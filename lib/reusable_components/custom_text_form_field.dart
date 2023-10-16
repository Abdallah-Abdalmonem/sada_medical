import 'package:flutter/material.dart';
import 'package:application/constants/constant/constants.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final int? maxLins;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    this.onChanged,
    this.labelText,
    this.obscureText = false,
    this.maxLins = 1,
    this.onSaved,
    this.hintText,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: secondColor,
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: (data) {
          if (data?.isEmpty ?? true) {
            return 'field is required';
          }
          return null;
        },
        maxLines: maxLins,
        obscureText: obscureText,
        onChanged: onChanged,
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: postColor,
            ),
          ),
        ),
      ),
    );
  }
}



//=================================
// TextFormField(
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Password must be not empty';
//                     }
//                     return null;
//                   },
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     prefixIcon: const Icon(
//                       Icons.lock,
//                     ),
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           view = !view;
//                           if (view == true) {
//                             icon = Icons.remove_red_eye;
//                           } else {
//                             icon = Icons.visibility_off;
//                           }
//                         });
//                       },
//                       icon: Icon(
//                         icon,
//                       ),
//                     ),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   keyboardType: TextInputType.visiblePassword,
//                   obscureText: view,
//                 ),