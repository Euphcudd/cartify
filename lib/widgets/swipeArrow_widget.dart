import 'package:flutter/material.dart';

class SwipeArrowWidget extends StatefulWidget {
  final bool isLeft;
  final VoidCallback? onTap;

  const SwipeArrowWidget({super.key, this.isLeft = true, this.onTap});

  @override
  State<SwipeArrowWidget> createState() => _SwipeArrowWidgetState();
}

class _SwipeArrowWidgetState extends State<SwipeArrowWidget> {
  bool _showArrow = false;

  void _setHover(bool hover) {
    setState(() => _showArrow = hover);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: widget.isLeft ? 0 : null,
      right: widget.isLeft ? null : 0,
      child: MouseRegion(
        onEnter: (_) => _setHover(true),
        onExit: (_) => _setHover(false),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: widget.onTap,
          onPanDown: (_) => _setHover(true),
          onPanEnd: (_) => _setHover(false),
          child: AnimatedOpacity(
            opacity: _showArrow ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: 50,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: widget.isLeft
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  end: widget.isLeft
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                ),
              ),
              child: Center(
                child: Icon(
                  widget.isLeft
                      ? Icons.arrow_back_ios
                      : Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
