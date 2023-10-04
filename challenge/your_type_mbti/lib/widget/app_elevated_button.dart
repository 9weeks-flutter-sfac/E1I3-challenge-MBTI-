import 'package:flutter/material.dart';
import 'package:your_type_mbti/util/app_color.dart';
import 'package:your_type_mbti/util/app_textstyle.dart';

class AppElevatedButton extends StatefulWidget {
  const AppElevatedButton({super.key, this.onPressed, required this.options, this.isSelected = false});
  final Function()? onPressed;
  final String options;
  final bool isSelected;

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 9.2,
        width: MediaQuery.of(context).size.width / 1.5,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: AppColor.pinkRed, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: widget.isSelected ? AppColor.pinkRed : AppColor.white,
            foregroundColor: widget.isSelected ? AppColor.white : AppColor.black,
            padding: EdgeInsets.all(32),
          ),
          onPressed: widget.onPressed,
          child: Text(widget.options,style: AppTextstyle.koPtSemiBold15(),),
        ),
      ),
    );
  }
}
