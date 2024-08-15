library languages_simple;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:languages_simple/const.dart';

class LanguagesSimple extends StatelessWidget {
  final Function? onPressedLanguage;
  //
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Clip clipBehavior = Clip.none;
  //
  final bool? shrinkWrap;

  const LanguagesSimple({
    super.key,
    required this.onPressedLanguage,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: shrinkWrap ?? false,
        itemCount: languages.length,
        itemBuilder: (_, i) {
          return GestureDetector(
              onTap: () {
                final data = [
                  languages.keys.elementAt(i).substring(0, 2),
                  languages.values.elementAt(i)
                ];
                onPressedLanguage?.call(data);
              },
              child: Container(
                  padding: padding ?? const EdgeInsets.all(20),
                  margin: margin ?? const EdgeInsets.all(5),
                  decoration:
                      decoration ?? const BoxDecoration(color: Colors.white),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(languages.values.elementAt(i))),
                        SvgPicture.asset(_getImagePath(i),
                            height: 24, width: 32)
                      ])));
        });
  }

  _getImagePath(int i) {
    String name = '';
    String fileName = languages.keys.elementAt(i);
    if (fileName.contains('-')) {
      name = fileName.split('-').last;
    } else {
      name = fileName;
    }
    return 'packages/languages_simple/lib/res/svg/$name.svg';
  }
}
