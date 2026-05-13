import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final String hintText;
  final Widget? leadingWidget;

  const InputField({
    super.key,
    required this.controller,
    required this.onSend,
    required this.hintText,
    this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        color: Colors.grey.shade200,
        child: Row(
          children: [
            ?leadingWidget,
            Expanded(
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  hintText: hintText,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(onPressed: onSend, icon: Icon(Icons.send)),
          ],
        ),
      ),
    );
  }
}
