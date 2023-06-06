// import 'package:flutter/material.dart';
// import 'package:ojt_test_2/config/palette.dart';

// class FavoriteButton extends StatefulWidget {
//   final VoidCallback onPressed;

//   const FavoriteButton({Key? key, required this.onPressed}) : super(key: key);

//   @override
//   _FavoriteButtonState createState() => _FavoriteButtonState();
// }

// class _FavoriteButtonState extends State<FavoriteButton> {
//   final bool _isFavorite = false;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       color: _isFavorite ? Palette.mint : Palette.yellow,
//       onPressed: () {
//         setState(() {
//           _isFavorite = !_isFavorite;
//         });
//       },
//       icon: const Icon(Icons.star),
//     );
//   }
// }
