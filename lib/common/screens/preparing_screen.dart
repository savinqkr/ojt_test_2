import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PreparingScreen extends StatelessWidget {
  const PreparingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
              "https://assets1.lottiefiles.com/packages/lf20_ybfPAtf8S7.json"),
          const SizedBox(
            height: 40,
          ),
          Text("Coming soon", style: GoogleFonts.nanumGothic(fontSize: 24)),
        ],
      ),
    );
  }
}
