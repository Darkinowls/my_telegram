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
  void initState() {
    super.initState();

    widget._textController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._textController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          fillColor: const Color(0xFF3d444b),
          filled: true,
          hintText: widget._hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          suffixIcon: widget._textController.text.isNotEmpty
              ? TextButton(
                  style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                      foregroundColor: Colors.grey),
                  // shape: const CircleBorder(),
                  onPressed: widget._function,
                  child: Icon(
                    color: Colors.grey,
                    widget._icon,
                  ))
              : null),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    );
  }
}
