import 'package:coin_picker/coins/coin_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinSource extends StatefulWidget {
  const CoinSource({Key? key, required this.selectedCoins}) : super(key: key);

  final List<int> selectedCoins;
  @override
  _CoinSourceState createState() => _CoinSourceState();
}

class _CoinSourceState extends State<CoinSource> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Wrap(
          spacing: 3,
          runSpacing: 3,
          children: List.generate(100, (index) {
            return index + 1;
          })
              .map((e) => buildCoin("$e", widget.selectedCoins.contains(e)))
              .toList(),
        ),
      ),
    );
  }

  Widget buildCoin(String text, bool isSelected) {
    return Container(
      width: 30,
      height: 30,
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
                fontSize: 11, color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff02d2f8) : null,
        border: isSelected
            ? null
            : Border.all(
                color: Color(0xff02d2f8),
                width: 1,
              ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
