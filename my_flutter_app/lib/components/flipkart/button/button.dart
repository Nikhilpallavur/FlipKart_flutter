import 'package:flutter/material.dart';
import '../../../style/flipkart/colors.dart';

// Widget simpleButton(
//     {onPressed,
//     text,
//     bgColor = Colors.blue,
//     color = Colors.white,
//     padding = const EdgeInsets.only(left: 10, right: 10)}) {
//   return ElevatedButton(
//     style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//         padding: padding,
//         backgroundColor: bgColor),
//     onPressed: onPressed,
//     child: Text(
//       text,
//       style:
//           TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.normal),
//     ),
//   );
// }

Widget CustomIconButton(
    {onPressed,
    text,
    bgColor = Colors.blue,
    color = Colors.white,
    padding = const EdgeInsets.only(left: 10, right: 10),
    icon}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: padding,
          backgroundColor: bgColor),
      onPressed: onPressed,
      child: Row(children: [
        icon,
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, color: color, fontWeight: FontWeight.normal),
          ),
        )
      ]));
}
