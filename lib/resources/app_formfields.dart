import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_strings.dart';

class SearchInputField extends StatefulWidget {
  final SearchController? controller;
  final String hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final double width;
  final double height;

  const SearchInputField({
    super.key,
    this.controller,
    this.hintText = AppStrings.search,
    this.onChanged,
    this.onSubmitted,
    this.width = 296,
    this.height = 52,
  });

  @override
  State<SearchInputField> createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  bool hasText = false;
  bool hasOwnController = false;
  late final SearchController _mySearchController;

  @override
  void initState() {
    super.initState();

    hasOwnController = widget.controller != null;
    _mySearchController = widget.controller ?? SearchController();
    hasText = _mySearchController.text.isNotEmpty;
    _mySearchController.addListener(() {
      bool nonEmpty = _mySearchController.text.isNotEmpty;
      if (nonEmpty != hasText) {
        setState(() {
          hasText = nonEmpty;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: SearchBar(
        controller: _mySearchController,
        elevation: const WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          hasText
              ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: 1, color: AppColors.primary),
              )
              : RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        backgroundColor: WidgetStatePropertyAll(
          hasText ? AppColors.secondary : AppColors.inputFieldGrey,
        ),
        hintText: widget.hintText,
        hintStyle: const WidgetStatePropertyAll(
          TextStyle(color: AppColors.textGrey, fontSize: 14),
        ),
        leading: const Icon(
          CupertinoIcons.search,
          size: 13.53,
          color: AppColors.textGrey,
        ),
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}

class CustomTextInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final void Function(bool)? onHasTextChanged;

  const CustomTextInputField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.onHasTextChanged,
  });

  @override
  State<CustomTextInputField> createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {
  late final TextEditingController _textFieldController;
  bool hasText = false;

  bool hasController = false;
  @override
  void initState() {
    super.initState();

    hasController = widget.controller != null;
    _textFieldController = widget.controller ?? TextEditingController();
    hasText = _textFieldController.text.isNotEmpty;
    _textFieldController.addListener(() {
      bool nonEmpty = _textFieldController.text.isNotEmpty;
      if (hasText != nonEmpty) {
        setState(() {
          hasText = nonEmpty;
          widget.onHasTextChanged?.call(hasText);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
        ],
        SizedBox(
          width: 358,

          child: TextFormField(
            cursorColor: AppColors.primary,
            maxLines: widget.maxLines,
            controller: _textFieldController,

            style: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),

            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: hasText ? AppColors.primary : AppColors.inputFieldGrey,
                  width: 1,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.primary, // make it visible
                  width: 2,
                ),
              ),

              filled: true,
              fillColor:
                  hasText ? AppColors.secondary : AppColors.inputFieldGrey,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 18,
              ),

              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: AppColors.textGrey,
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
