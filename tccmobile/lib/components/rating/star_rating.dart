import 'package:flutter/material.dart';
import 'package:tccmobile/main.dart';

class StarRating extends StatelessWidget {
  final String avaliacao;

  const StarRating({super.key, this.avaliacao = "0"});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.star_border_outlined, size: 30),
        Icon(Icons.star_border_outlined, size: 30),
        Icon(Icons.star_border_outlined, size: 30),
        Icon(Icons.star_border_outlined, size: 30),
        Icon(Icons.star_border_outlined, size: 30),
        Text(avaliacao, style: TextStyle(fontSize: Fonte.fonteXLarge)),
      ],
    );
  }
}
