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
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (textEditingController.text.isNotEmpty) {
      widget.onDrafted(textEditingController.text);
    } else{
      widget.onDrafted(null);
    }
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          fillColor: const Color.fromRGBO(61, 68, 75, 1),
          filled: true,
          hintText: widget.hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          suffixIcon: textEditingController.text.isNotEmpty
              ? TextButton(
                  style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                      foregroundColor: Colors.grey),
                  onPressed: () {
                    widget.onButton(textEditingController.text);
                    textEditingController.clear();
                  },
                  child: Icon(
                    widget.buttonIcon,
                  ))
              : null),
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}
