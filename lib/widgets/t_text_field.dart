import 'package:flutter/material.dart';

class TTextField extends StatefulWidget {
  final String _hintText;
  final Function() _function;
  final IconData _icon;
  final TextEditingController _textController;

  const TTextField({
    required String hintText,
    required Function() function,
    required IconData icon,
    required TextEditingController textController,
    Key? key,
  })  : _textController = textController,
        _icon = icon,
        _function = function,
        _hintText = hintText,
        super(key: key);

  @override
  State<TTextField> createState() => _TTextFieldState();
}

class _TTextFieldState extends State<TTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._textController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          fillColor: const Color.fromRGBO(61, 68, 75, 1),
          filled: true,
          hintText: widget._hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          suffixIcon: widget._textController.text.isNotEmpty
              ? TextButton(
                  style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                      foregroundColor: Colors.grey),
                  onPressed: widget._function,
                  child: Icon(
                    widget._icon,
                  ))
              : null),
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}
