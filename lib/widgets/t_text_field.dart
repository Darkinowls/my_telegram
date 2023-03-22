import 'package:flutter/material.dart';

class TTextField extends StatefulWidget {
  final String hintText;
  final Function(String) onButton;
  final Function(String?) onDrafted;
  final IconData buttonIcon;
  final String? text;

  const TTextField({
    Key? key,
    this.text,
    required this.hintText,
    required this.onButton,
    required this.onDrafted,
    required this.buttonIcon,
  }) : super(key: key);

  @override
  State<TTextField> createState() => _TTextFieldState();
}

class _TTextFieldState extends State<TTextField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.text != null) {
      textEditingController.text = widget.text!;
    }
    textEditingController.addListener(() {
      if (textEditingController.text.isNotEmpty) {
        widget.onDrafted(textEditingController.text);
      } else{
        widget.onDrafted(null);
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      cursorColor: Theme.of(context).focusColor,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          filled: true,
          hintText: widget.hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          suffixIcon: textEditingController.text.isNotEmpty
              ? TextButton(
                  style: TextButton.styleFrom(
                      shape: const CircleBorder()),
                  onPressed: () {
                    widget.onButton(textEditingController.text);
                    textEditingController.clear();
                  },
                  child: Icon(
                    widget.buttonIcon,
                    color: Theme.of(context).primaryColor,
                  ))
              : null),
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}
