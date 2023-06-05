import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';

class TextFieldWithIcon extends StatefulWidget {
  final String label;
  final Icon icon;
  final TextEditingController controller;

  const TextFieldWithIcon({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
  });

  @override
  State<TextFieldWithIcon> createState() => _TextFieldWithIconState();
}

class _TextFieldWithIconState extends State<TextFieldWithIcon> {
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Popup'),
          content: const Text('This is a custom dialog.'),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.label);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              widget.label,
              style:
                  GoogleFonts.nanumGothic(fontSize: 12, color: Palette.black),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 32,
            child: TextField(
              controller: widget.controller,
              style:
                  GoogleFonts.nanumGothic(fontSize: 14, color: Palette.black),
              cursorColor: Palette.mint,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8.0),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _showPopup(context); // Show the dialog
                  },
                  child: widget.icon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
