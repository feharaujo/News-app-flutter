import 'package:flutter/material.dart';

class AppStyle {
  static double get paddingUnit => 16;

  static TextStyle get text28 => TextStyle(fontSize: 28).withTightSpacing;
  static TextStyle get text20 => TextStyle(fontSize: 20).withTightSpacing;
  static TextStyle get text16 => TextStyle(fontSize: 16).withNormalSpacing;
  static TextStyle get text14 => TextStyle(fontSize: 14).withNormalSpacing;
  static TextStyle get text12 => TextStyle(fontSize: 12).withWideSpacing;
  static TextStyle get text10 => TextStyle(fontSize: 10).withWideSpacing;

  static TextStyle get body20 => text20.withTallHeight;
  static TextStyle get body16 => text16.withTallHeight;
  static TextStyle get body14 => text14.withTallHeight;
  static TextStyle get body12 => text12.withTallHeight;

  static TextStyle get button14 => text16.withMediumWeight;
  static TextStyle get button12 => text12.withMediumWeight;

  static TextStyle get callout14 => text14.withLightWeight;
  static TextStyle get callout12 => text12.withLightWeight;
  static TextStyle get callout10 => text10.withNormalWeight;

  static Color get white => Colors.white;
  static Color get black => Colors.black;
  static Color get transparent => Colors.transparent;

  static Color get shade1 => shade(1.0);
  static Color get shade2 => shade(2.0);
  static Color get shade3 => shade(3.0);
  static Color get shade4 => shade(4.0);
  static Color get shade5 => shade(5.0);
  static Color get shade6 => shade(6.0);
  static Color get shade7 => shade(7.0);
  static Color get shade8 => shade(8.0);
  static Color get shade9 => shade(9.0);

  static Color shade(double shade) => Color.fromARGB(
      255, shade * 255 ~/ 10, shade * 255 ~/ 10, shade * 255 ~/ 10);

  static BorderRadius get squareRadius => BorderRadius.circular(0);
  static BorderRadius get tightRadius => BorderRadius.circular(6);
  static BorderRadius get normalRadius => BorderRadius.circular(16);
  static BorderRadius get wideRadius => BorderRadius.circular(28);
  static BorderRadius get stadiumRadius => BorderRadius.circular(9999);
}

extension on num {
  double get tau => this * 1.61803;
  double get pi => this * 3.14159;
  double get u => this * AppStyle.paddingUnit / 4;
  double get paddingUnits => this * AppStyle.paddingUnit;
  double get asRadians => (this / 180) * 1.pi;
  double get asDegrees => (this * 180) / 1.pi;
}

extension on TextStyle {
  TextStyle get withTightSpacing => this.copyWith(letterSpacing: -0.5);
  TextStyle get withNormalSpacing => this.copyWith(letterSpacing: null);
  TextStyle get withWideSpacing => this.copyWith(letterSpacing: 0.5);

  TextStyle get withShortHeight => this.copyWith(height: 0.8);
  TextStyle get withNormalHeight => this.copyWith(height: null);
  TextStyle get withTallHeight => this.copyWith(height: 1.2);

  TextStyle get withLightWeight => this.copyWith(fontWeight: FontWeight.w300);
  TextStyle get withNormalWeight => this.copyWith(fontWeight: FontWeight.w400);
  TextStyle get withMediumWeight => this.copyWith(fontWeight: FontWeight.w500);

  TextStyle colored(Color color) => this.copyWith(color: color);
}

extension on Color {
  Color get withLightOpacity => this.withOpacity(0.25);
  Color get withMediumOpacity => this.withOpacity(0.50);
  Color get withDarkOpacity => this.withOpacity(0.75);
}

extension on Widget {
  Widget get withHorizontalPadding => Padding(
      padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingUnit),
      child: this);

  Widget get withVerticalPadding => Padding(
      padding: EdgeInsets.symmetric(vertical: AppStyle.paddingUnit),
      child: this);

  Widget removePadding(
      {double l = 0,
        double t = 0,
        double r = 0,
        double b = 0,
        double h = 0,
        double v = 0,
        double all = 0}) =>
      Stack(children: <Widget>[
        Positioned(
            left: -l - h - all,
            top: -t - v - all,
            right: -r - h - all,
            bottom: -b - v - all,
            child: this)
      ]);

  Widget addPadding(
      {double l = 0,
        double t = 0,
        double r = 0,
        double b = 0,
        double h = 0,
        double v = 0,
        double all = 0}) =>
      Stack(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(
              left: l + h + all,
              top: t + v + all,
              right: r + h + all,
              bottom: b + v + all,
            ),
            child: this)
      ]);

  Widget nudge({double x = 0, double y = 0}) =>
      Transform.translate(offset: Offset(x, y), child: this);

  Widget rotate(double degrees) =>
      Transform.rotate(angle: degrees.asRadians, child: this);

  Widget get withFullWidth => SizedBox(width: double.maxFinite, child: this);
}