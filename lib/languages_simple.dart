library languages_simple;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:languages_simple/const.dart';

class LanguagesSimple extends StatefulWidget {
  final Function? onPressedLanguage;
  //
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? selectedDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final bool? shrinkWrap;
  final bool? isSortedByLanguageCode;

  const LanguagesSimple({
    super.key,
    required this.onPressedLanguage,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.selectedDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.shrinkWrap,
    this.isSortedByLanguageCode,
  });

  @override
  State<LanguagesSimple> createState() => _LanguagesSimpleState();
}

class _LanguagesSimpleState extends State<LanguagesSimple> {
  int _selectedIndex = -1;
  Map<String, String> _handledLanguages = {};

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: widget.shrinkWrap ?? false,
        itemCount: _handledLanguages.length,
        itemBuilder: (_, i) {
          return GestureDetector(
              onTap: () {
                final data = [
                  _handledLanguages.keys.elementAt(i).substring(0, 2),
                  _handledLanguages.values.elementAt(i)
                ];
                _selectedIndex = i;
                widget.onPressedLanguage?.call(data);
                setState(() {});
              },
              child: Container(
                  padding: widget.padding ?? const EdgeInsets.all(20),
                  margin: widget.margin ?? const EdgeInsets.all(5),
                  decoration: i == _selectedIndex
                      ? widget.selectedDecoration
                      : widget.decoration ??
                          const BoxDecoration(color: Colors.white),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(_handledLanguages.values.elementAt(i))),
                        SvgPicture.asset(_getImagePath(i),
                            height: 24, width: 32)
                      ])));
        });
  }

  _getImagePath(int i) {
    String name = '';
    String fileName = _handledLanguages.keys.elementAt(i);
    if (fileName.contains('-')) {
      name = fileName.split('-').last;
    } else {
      name = fileName;
    }
    return 'packages/languages_simple/lib/res/svg/$name.svg';
  }

  _init() {
    if (widget.isSortedByLanguageCode == null) {
      _handledLanguages = Map.fromEntries(languages.entries.toList()
        ..sort((a, b) => a.value.compareTo(b.value)));
    } else {
      _handledLanguages = languages;
    }
  }
}
