import 'dart:math';

import 'package:flutter/material.dart';

class ScrollableCardStack extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const ScrollableCardStack({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  State<ScrollableCardStack> createState() => _ScrollableCardStackState();
}

class _ScrollableCardStackState extends State<ScrollableCardStack>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onScroll);
    _pageController.dispose();
    super.dispose();
  }

  void _onScroll() => setState(() => _currentPage = _pageController.page ?? 0);

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! > 0 && _currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else if (details.primaryVelocity! < 0 &&
        _currentPage < widget.itemCount - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            for (int i = widget.itemCount - 1; i >= 0; i--)
              _buildStackedCard(i, constraints),
            Positioned.fill(
              child: GestureDetector(
                onHorizontalDragEnd: _onHorizontalDragEnd,
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _pageController,
                  itemCount: widget.itemCount,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStackedCard(int index, BoxConstraints constraints) {
    final double scrollOffset = index - _currentPage;
    final double scale = 1 - (scrollOffset.abs() * 0.1).clamp(0.0, 0.4);
    final double rotationAngle = (pi / 180) * (scrollOffset * 5);

    // Calculate opacity for fading effect
    double opacity = 1.0;
    if (scrollOffset >= 0 && scrollOffset < 1 && index == 0) {
      // Current card fading out
      opacity = 1 - scrollOffset;
    } else if (scrollOffset < 0 && scrollOffset > -1) {
      // Card coming into view
      opacity = 1 + scrollOffset;
    } else if (scrollOffset <= -1) {
      // Cards before the incoming card
      opacity = 0;
    }

    return Positioned(
      left: constraints.maxWidth / 2,
      bottom: -constraints.maxHeight * 0.3 + (scrollOffset * 20),
      child: Opacity(
        opacity: opacity.clamp(0.0, 1.0),
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..translate(
              -constraints.maxWidth * 0.5 * scale,
              -constraints.maxHeight * 0.7 * scale,
              scrollOffset * 10,
            )
            ..rotateZ(rotationAngle)
            ..scale(scale),
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight * 0.7,
            child: widget.itemBuilder(context, index),
          ),
        ),
      ),
    );
  }
}
