import 'package:flutter/material.dart';
import 'package:untitled/styles/colors.dart';

Widget defaultButton ({
  double width = double.infinity,
  Color background = primarySwatch,
  required String text ,
  required Function function,

})
=> Container(
  width: width,
  color: background,
  child: MaterialButton(
    onPressed: ()
    {
      function();
    },
    child: Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),

  ),
);

Widget defaultTextButton({
  required double width,
  Color background = scaffoldBackgroundColor,
  required String text ,
  required Function function,

})
=> Container(
  width: width,
  color: background,
  child: TextButton(
    onPressed: ()
    {
      function();
    },
    child: Text(
      text.toUpperCase(),
      style:  const TextStyle(
        color: primarySwatch,
        fontSize: 15.0,
      ),
    ),

  ),
);

Widget defaultTextFormField({

  required var controller,
  required var keyboardType,
  required Function validator,
  required String labelText,
  required Icon prefix,
  Icon? suffix,
  Radius? radius,
  Color cursorColor = primarySwatch,
  Color prefixIconColor = primarySwatch,
  Color suffixIconColor = primarySwatch,
  Function? onTap,
  bool? autocorrect

})=>TextFormField(
controller: controller,
keyboardType: keyboardType,
obscureText: false,
validator: (value)
{
   validator();
},
decoration:InputDecoration(
labelText: labelText,
border: OutlineInputBorder(
  borderRadius: BorderRadius.all(radius!),
),
enabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.all(radius),
   borderSide: const BorderSide(color: Colors.blueGrey)
),
disabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.all(radius),
  // borderSide: BorderSide(color: primarySwatch),
),
prefixIcon: prefix,
prefixIconColor: prefixIconColor,
suffixIcon: suffix,
suffixIconColor: suffixIconColor ,

),
  cursorColor: cursorColor,
  onTap: ()
  {
    onTap!();
  },
  // autocorrect: autocorrect!,

);





Widget myDivider()=>Padding(
  padding: const EdgeInsets.only(
    right: 15.0,
    left: 15.0,
  ),
  child: Container(
    height: 1.0,
    color: Colors.grey[300],
  ),
);


void navigateTo(context,widget)=>Navigator.push(context,
    MaterialPageRoute(builder: (context)=> widget));

void navigateAndRemove(context,widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context)=> widget),
        (Route<dynamic>route)=> false);