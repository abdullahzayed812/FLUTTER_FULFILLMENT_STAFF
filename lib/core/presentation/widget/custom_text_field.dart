import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:postage_staff/core/presentation/extintions/context_extintions.dart';
import 'package:postage_staff/core/presentation/util/app_dimensions.dart';
import 'package:postage_staff/core/presentation/util/style/fonts/font_weight_helper.dart';
import 'package:postage_staff/core/presentation/widget/text_app.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.hint,
    this.readOnly,
    this.titleText,
    this.showTitle = true,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSuffixTap,
    this.fillColor,
    this.onSubmit,
    this.onChanged,
    this.capitalization = TextCapitalization.none,
    this.isCountryPicker = false,
    this.isShowBorder = true,
    this.isShowSuffixIcon = false,
    this.onTap,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.isSearch = false,
    this.inputDecoration,
    this.validator,
    this.onEditingComplete,
  }) : super(key: key);
  final String? hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Color? fillColor;
  final int maxLines;
  final bool isPassword;
  final bool? readOnly;
  final String? titleText;
  final bool showTitle;
  final bool isCountryPicker;
  final bool isShowBorder;
  final bool isShowSuffixIcon;
  final Function? onTap;
  final Function? onChanged;
  final Function? onSuffixTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isSearch;
  final Function? onSubmit;
  final bool isEnabled;
  final TextCapitalization capitalization;
  final InputDecoration? inputDecoration;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showTitle == true)
          TextApp(
            widget.titleText ?? widget.hint ?? '',
            style: context.textStyle.copyWith(
                fontSize: AppDimensions.fontSizeDefault,
                fontWeight: FontWeightHelper.regular),
          ),
        const SizedBox(height: 10),
        TextFormField(
          readOnly: widget.readOnly ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: AppDimensions.fontSizeLarge),
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          onEditingComplete: widget.onEditingComplete,
          //onChanged: widget.isSearch ? widget.languageProvider.searchLanguage : null,
          obscureText: widget.isPassword == true ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
                ]
              : null,
          decoration: widget.inputDecoration ??
              InputDecoration(
                errorStyle: context.textStyle.copyWith(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: AppDimensions.fontSizeSmall),
                focusedBorder: getBorder(),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                  ),
                ),
                enabledBorder: getBorder(),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                border: getBorder(),
                isDense: true,
                hintText: widget.hint ?? '',
                fillColor: widget.fillColor ?? context.color.containerShadow1,
                hintStyle: context.textStyle.copyWith(
                    fontSize: AppDimensions.fontSizeDefault,
                    color: context.color.hintColor),
                filled: true,
                prefixIcon: widget.prefixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: AppDimensions.paddingSizeLarge,
                            right: AppDimensions.paddingSizeSmall),
                        child: widget.prefixIcon,
                      )
                    : const SizedBox.shrink(),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 23, maxHeight: 20),
                suffixIcon: (widget.suffixIcon != null || widget.isPassword)
                    ? widget.isPassword
                        ? IconButton(
                            icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Theme.of(context)
                                    .hintColor
                                    .withOpacity(0.3)),
                            onPressed: _toggle)
                        : widget.suffixIcon
                    : null,
              ),
          onTap: widget.onTap as void Function()?,
          onFieldSubmitted: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null
                  ? widget.onSubmit!(text)
                  : null,
          onChanged: widget.onChanged as void Function(String)?,
          validator: widget.validator != null ? widget.validator! : null,
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  OutlineInputBorder getBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          style: widget.isShowBorder ? BorderStyle.solid : BorderStyle.none,
          width: widget.isShowBorder ? 1 : 0,
          color: context.color.borderColor!,
        ),
      );
}
