import 'dart:math';

import 'package:coin_picker/coins/coin_constants.dart';
import 'package:coin_picker/coins/coin_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinPicker extends StatefulWidget {
  @override
  _CoinPickerState createState() => _CoinPickerState();
}

class _CoinPickerState extends State<CoinPicker> {
  List<int> selectedCoins = [];
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "images/Vector.png",
              height: 130,
              width: 150,
              // fit: BoxFit.cover,
            ),
            CoinSource(
              selectedCoins: selectedCoins,
            ),
            const SizedBox(height: 10),
            buildRandomNumber(),
            const SizedBox(height: 20),
            buildButtons(),
            const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }

  Widget buildButtons() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedCoins.clear();
              random = Random();
            });
          },
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff02d2f8).withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              color: const Color(0xff02d2f8),
            ),
            child: const Center(
                child: Icon(
              Icons.refresh_rounded,
              color: Colors.white,
              size: 23,
            )),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () {
              while (true) {
                int newNumber = random.nextInt(100) + 1;
                if (!selectedCoins.contains(newNumber)) {
                  selectedCoins.add(newNumber);
                  break;
                }
              }
              setState(() {});
            },
            child: Container(
              width: 277,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff02d2f8).withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: const Color(0xff02d2f8),
              ),
              child: Center(
                child: Text(
                  'Pick New Coin',
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget buildRandomNumber() {
    return Text(
      selectedCoins.isNotEmpty ? selectedCoins.last.toString() : "0",
      style: GoogleFonts.nunito(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 80,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildTitle() {
    return const Text(
      'Coin Picker',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        // fontFamily: AppFonts.nunito,
        fontWeight: FontWeight.normal,
        letterSpacing: 1.2,
      ),
    );
  }
}
