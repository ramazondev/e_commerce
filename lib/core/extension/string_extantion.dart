import 'dart:ui';

extension StringExtantion on String {
  Color toColor(){
    return Color(int.parse(replaceFirst('#', '0xFF')));
  }
}