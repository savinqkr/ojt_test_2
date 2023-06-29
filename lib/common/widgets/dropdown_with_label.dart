import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojt_test_2/config/palette.dart';

class DropDownWithLabel extends StatefulWidget {
  final String label;
  final double? width;
  final Function? onChangeValue;
  final bool isLabelVisible;
  final List<Map> dropdownOptions;

  const DropDownWithLabel({
    super.key,
    required this.label,
    required this.dropdownOptions,
    this.width,
    required this.isLabelVisible,
    this.onChangeValue,
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
          if (widget.isLabelVisible)
            Text(
              widget.label,
              style:
                  GoogleFonts.nanumGothic(fontSize: 12, color: Palette.black),
            ),
          if (widget.isLabelVisible) const SizedBox(height: 4),
          Container(
            height: 32,
            width: widget.width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 226, 226, 226), width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value.toString();
                        });
                        if (widget.onChangeValue != null) {
                          widget.onChangeValue!(selectedValue);
                        } else {
                          print(value);
                        }
                      },
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 1,
                      style: GoogleFonts.nanumGothic(
                        fontSize: 12,
                        color: Palette.black,
                      ),
                      dropdownColor: Colors.white,
                      focusColor: Colors.white,
                      items: widget.dropdownOptions
                          .map(
                            (option) => DropdownMenuItem(
                                value: option['value'],
                                child: Text(option['name'],
                                    style: GoogleFonts.nanumGothic(
                                        fontSize: 12, color: Palette.black))),
                          )
                          .toList(),
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
