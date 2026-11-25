import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../assets/app_colors.dart';

class CommonTextField extends StatefulWidget {
  CommonTextField({
    super.key,
    this.commonController,
    required this.textInputType,
    this.textCapitalization = TextCapitalization.words,
    this.inputFormatters,
    this.hint = "",
    this.enable = true,
    this.readOnly = false,
    this.isShowPassword = false,
    this.isDisable = false,
    this.suffixIcon,
    this.prefixIcon,
    this.style,
    this.borderSide = BorderSide.none,
    this.focusNode,
    this.onTap,
    this.maxLength,
    this.fillColor,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSubmitted,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.validator,
    this.maxLines =1,
    this.minLine =1,
    this.showDivider = true,
    this.showShadow = false,
    this.isShowCountryPicker = false,
    this.countryPickerCallBack,
    this.phoneCodeInitial,
    this.phoneCode,
  });

  final TextEditingController? commonController;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String hint;
  final bool enable;
  final BorderSide borderSide;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final bool isShowPassword;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final TextStyle? style;
  final Color? fillColor;
  final bool readOnly;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final String? Function(String?)? validator;
  final bool showDivider;
  final bool isShowCountryPicker;
  final bool showShadow;
  final int maxLines;
  final int minLine;
  final String? phoneCodeInitial;
  final String? phoneCode;
  final VoidCallback? countryPickerCallBack;
  bool? isDisable;


  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  /*String? _errorText;

  void _updateErrorText(String value) {
    if (widget.validator != null) {
      setState(() {
        _errorText = widget.validator!(value);
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          if(widget.showShadow)
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              blurRadius: 8.0, // Blur radius for the shadow
              offset: Offset(0,4), // Offset for X and Y axis
            ),
        ],
      ),
      child: TextFormField(
        controller:
        widget.commonController,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        cursorColor: AppColors.primary,
        enabled: widget.enable,
        maxLength: widget.maxLength,
        readOnly: widget.readOnly,
        focusNode: widget.focusNode,
        onChanged: (value) {
          // Update error text based on current value only
          // _updateErrorText(value);
          if (widget.onChanged != null) widget.onChanged!(value);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,

        // validator: (value) => _errorText, // Use stored error text
        validator: widget.validator,

        textCapitalization: widget.textCapitalization,
        textAlignVertical: TextAlignVertical.center,
        // style: widget.style ?? AppStyles.textFieldTextStyleTheme,
        maxLines: widget.maxLines,
        minLines: widget.minLine,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide(color: widget.focusedBorderColor ?? AppColors.extraLightGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide(color: widget.enabledBorderColor ?? AppColors.extraLightGrey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: const BorderSide(color: AppColors.extraLightGrey),
          ),
          errorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: const BorderSide(color: AppColors.extraLightGrey),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: const BorderSide(color: AppColors.extraLightGrey),
          ),
          filled: true,
          fillColor: widget.isDisable == true  ?  AppColors.windowColor : AppColors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintText: widget.hint,
          // hintStyle: AppStyle.textFieldHintTheme.copyWith(
          //   fontSize: Constant.xxSmallFont,
          //   color: AppColors.textFieldHint,
          // ),
          prefixIcon: widget.prefixIcon != null || widget.isShowCountryPicker
              ? SizedBox(
            height: 46,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if(widget.prefixIcon!=null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12),
                    child: widget.prefixIcon,
                  ),


                if(widget.showDivider)
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: AppColors.extraLightGrey,
                    margin: const EdgeInsets.only(right: 8.0),
                  ),
              ],
            ),
          )
              : null,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: widget.suffixIcon,
          ),
          //errorText: _errorText,
        ),
        onTap: widget.onTap,
        obscureText: widget.isShowPassword,
      ),
    );
  }
}
