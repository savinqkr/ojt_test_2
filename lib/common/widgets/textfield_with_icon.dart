import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';

class TextFieldWithIcon extends StatefulWidget {
  final String dialogTitle;
  final String label;
  final Icon icon;
  final TextEditingController controller;
  final Widget dialogContent;
  final Function dialogOnPressed;
  final dynamic dialogVar;
  final bool? isParentSelected;

  const TextFieldWithIcon({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    required this.dialogTitle,
    required this.dialogContent,
    required this.dialogOnPressed,
    this.dialogVar,
    this.isParentSelected,
  });

  @override
  State<TextFieldWithIcon> createState() => _TextFieldWithIconState();
}

class _TextFieldWithIconState extends State<TextFieldWithIcon> {
  // showDialog
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.dialogTitle,
              style:
                  GoogleFonts.nanumGothic(fontSize: 20, color: Palette.black)),
          content: widget.dialogContent,
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (widget.dialogVar != null) {
                  widget.dialogOnPressed();
                }
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
              // enabled: widget.isParentSelected == null
              //     ? true
              //     : widget.isParentSelected! == true
              //         ? true
              //         : false,
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
                    _showDialog(); // Show the dialog
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
