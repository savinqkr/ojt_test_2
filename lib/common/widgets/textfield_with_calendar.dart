import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';
import 'package:intl/intl.dart';

// https://blog.logrocket.com/build-custom-calendar-flutter/

class TextFieldWithCalendar extends StatefulWidget {
  final String label;
  final Icon icon;
  final TextEditingController controller;

  const TextFieldWithCalendar({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
  });

  @override
  State<TextFieldWithCalendar> createState() => _TextFieldWithCalendarState();
}

class _TextFieldWithCalendarState extends State<TextFieldWithCalendar> {
  late DateTime selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate!;
        widget.controller.text = DateFormat.yMd().format(selectedDate);
      });
    }
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
                    _selectDate(context);
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
