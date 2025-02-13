import 'package:flutter/material.dart';
import 'package:ready/core/mangers/colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({Key? key,required this.hintText,this.maxLines=1,this.onSaved,this.onChanged}) : super(key: key);
  final String hintText;
  final int maxLines;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged,
      onSaved:onSaved,
      validator:(value){
        if(value?.isEmpty ?? true){
          return 'Field Is Required';
        }else {
          return null;
        }
      },
     style: TextStyle(color: AppColors.primeColor),
      maxLines: maxLines,
      cursorColor : AppColors.primeColor,
      decoration: InputDecoration(
        hintText:hintText,
        hintStyle: TextStyle(

            color:AppColors.primeColor
        ),
        border:buildBorder(),
        enabledBorder: buildBorder(color: Colors.white),
        focusedBorder: buildBorder(),
      ),
    );
  }
  OutlineInputBorder buildBorder({color})=> OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:  BorderSide(
          color: color?? AppColors.primeColor
      )
  );
}
