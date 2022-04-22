import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText({
    Key? key,
    required this.text,
    required this.maxLines,
    this.textStyle,
    this.showMoreText = 'Show more',
    this.showLessText = 'Show less',
    this.showTextStyle,
  }) : super(key: key);

  final String text;
  final int maxLines;

  final String showMoreText;
  final String showLessText;
  final TextStyle? textStyle;
  final TextStyle? showTextStyle;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onReadMoreClicked() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    TextSpan link = TextSpan(
      text: _readMore ? widget.showMoreText : widget.showLessText,
      style: widget.showTextStyle,
      recognizer: TapGestureRecognizer()..onTap = _onReadMoreClicked,
    );
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection
              .rtl, //better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.maxLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset) ?? 0;

        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore
                ? widget.text.substring(0, endIndex) + "... "
                : widget.text + " ",
            style: widget.textStyle,
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
          );
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}
