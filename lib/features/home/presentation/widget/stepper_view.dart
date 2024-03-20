import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';

enum StepProgressViewDirection {
  horizontal,
  vertical,
}

class StepProgressView extends StatelessWidget {
  final double _width;
  final List<String> _titles;
  final List<String> _titlesName;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor =Colors.black87;
  final double lineWidth = 3.0;
  final StepProgressViewDirection direction;

  StepProgressView({
    Key? key,
    required int curStep,
    List<String>? titles,
    List<String>? titlesName,
    required double width,
    required Color color,
    this.direction = StepProgressViewDirection.horizontal,
  })  : _titles = titles ?? [],
        _titlesName = titlesName ?? [],
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        assert(width > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: _buildProgressLayout(),
      ),
    );
  }

  Widget _buildProgressLayout() {
    if (direction == StepProgressViewDirection.horizontal) {
      return _buildHorizontalLayout();
    } else {
      return _buildVerticalLayout();
    }
  }

  Widget _buildHorizontalLayout() {
    return Column(
      children: <Widget>[
        Row(
          children: _iconViews(),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _titleViews(),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      children: <Widget>[
        Column(
          children: _iconViews(),
        ),
        SizedBox(
          height: 8,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _titleViews(),
        ),
      ],
    );
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];

    _titles.asMap().forEach((i, icon) {
      var circleColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
      var iconColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
      list.add(
        Expanded(
          child: Container(
            height: lineWidth,
            color: circleColor,
          ),
        ),
      );
      list.add(
        Column(
          children: [
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                  ),
                ),
                child: Center(
                    child: Text(
                  _titles[i],
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ))),
          ],
        ),
      );

      if (i != _titles.length - 1) {
        list.add(
          Expanded(
            child: Container(
              height: lineWidth,
              color: lineColor,
            ),
          ),
        );
      }
      list.add(
        Expanded(
          child: Container(
            height: lineWidth,
            color: lineColor,
          ),
        ),
      );
    });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titlesName.asMap().forEach((i, text) {
      list.add(Text(text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          )));
    });
    return list;
  }
}
