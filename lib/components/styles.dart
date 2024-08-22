import 'package:eng_game_app/components/constants.dart';
import 'package:flutter/material.dart';

final BoxDecoration lessonCardBoxDecoration = BoxDecoration(
  color: menuCardColor,
  borderRadius: BorderRadius.circular(
    10,
  ),
  boxShadow: [
    BoxShadow(
      color: menuCardShadow,
      blurRadius: 6,
    ),
  ],
);

const TextStyle lessonCardTextStyle = TextStyle(
  color: fontColorPrimary,
  fontWeight: FontWeight.bold,
  fontSize: 25,
);

final BoxDecoration wordCardBoxDecoration = BoxDecoration(
  color: menuCardColor,
  borderRadius: BorderRadius.circular(
    10,
  ),
  boxShadow: [
    BoxShadow(
      color: menuCardShadow,
      blurRadius: 6,
    ),
  ],
);

const TextStyle wordTextStyle = TextStyle(
  color: fontColorPrimary,
  fontWeight: FontWeight.bold,
  fontSize: 50,
);

final TextStyle translationTextStyle = TextStyle(
  color: fontColorSecondary,
  fontSize: 25,
);

const TextStyle alertDialogTextStyle = TextStyle(
  color: appBarColor,
);

const BoxDecoration matchGameCardBoxDecoration = BoxDecoration(
  color: appBarColor,
);

final BoxDecoration wordCardDecoratiom = BoxDecoration(
  color: wordCardColor,
  borderRadius: BorderRadius.circular(10),
);

const wordCardTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 60,
);

const TextStyle appBarTextStyle = TextStyle(
  color: appBarFontColor,
  fontWeight: FontWeight.bold,
);

final BoxDecoration translationCardBoxDecoration = BoxDecoration(
  color: appBarColor,
  borderRadius: BorderRadius.circular(10),
);

const TextStyle translationCardTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 60,
);

final answerButtonStyle = TextButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      12,
    ),
  ),
  backgroundColor: buttonColor,
  minimumSize: const Size(150, 50),
);

const matchGameCardTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 25,
);
