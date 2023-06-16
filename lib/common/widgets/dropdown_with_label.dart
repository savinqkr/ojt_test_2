import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';

class DropDownWithLabel extends StatefulWidget {
  final String label;
  final List<Map> dropdownOptions;

  const DropDownWithLabel({
    super.key,
    required this.label,
    required this.dropdownOptions,
  });

  @override
  State<DropDownWithLabel> createState() => _DropDownWithLabelState();
}

class _DropDownWithLabelState extends State<DropDownWithLabel> {
  String selectedValue = '';

  @override
  void initState() {
    super.initState();
    selectedValue = widget.dropdownOptions[0]['value'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.nanumGothic(fontSize: 12, color: Palette.black),
          ),
          const SizedBox(height: 4),
          Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border:
                  // Border.all(color: Palette.mint.withOpacity(0.6), width: 1.5),
                  Border.all(
                      color: const Color.fromARGB(255, 226, 226, 226),
                      width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedValue,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 1,
                      style: GoogleFonts.nanumGothic(
                        fontSize: 12,
                        color: Palette.black,
                      ),
                      dropdownColor: Colors.white,
                      items: widget.dropdownOptions
                          .map(
                            (option) => DropdownMenuItem(
                                value: option['value'],
                                child: Text(option['name'],
                                    style: GoogleFonts.nanumGothic(
                                        fontSize: 12, color: Palette.black))),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value.toString();
                        });
                      },
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
