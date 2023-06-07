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

  @override
  void initState() {
    super.initState();
    selectedDate = widget.controller.text.isNotEmpty
        ? DateFormat('yyyy-MM-dd').parse(widget.controller.text)
        : DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        widget.controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
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
            width: 120,
            height: 32,
            child: Stack(
              children: [
                TextField(
                  controller: widget.controller,
                  enabled: false,
                  style: GoogleFonts.nanumGothic(
                      fontSize: 12, color: Palette.black),
                  cursorColor: Palette.mint,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide.none,
                    ),
                    // suffixIcon: GestureDetector(
                    //   onTap: () {
                    //     _selectDate(context);
                    //   },
                    //   child: widget.icon,
                    // ),
                  ),
                ),
                Positioned(
                  top: -4,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: widget.icon,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
