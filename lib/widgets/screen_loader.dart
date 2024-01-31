import 'package:flutter/material.dart';

typedef Show = bool Function();
typedef Hide = bool Function();

class LoadingController {
  final Show show;
  final Hide hide;

  const LoadingController({
    required this.show,
    required this.hide,
  });
}

class ScreenLoader {
  LoadingController? _controller;

  void show(
    BuildContext context, {
    Color? loadingColor,
    Color? containerColor,
    Color? backgroundColor,
  }) {
    if (_controller?.show() ?? false) {
      return;
    } else {
      _controller = _showLoading(
        context,
        loadingColor: loadingColor,
        containerColor: containerColor,
        backgroundColor: backgroundColor,
      );
    }
  }

  void hide() {
    _controller?.hide();
    _controller = null;
  }

  _showLoading(
    BuildContext context, {
    Color? loadingColor,
    Color? containerColor,
    Color? backgroundColor,
  }) {
    final state = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) {
        return Material(
          color: backgroundColor ?? Colors.black.withAlpha(125),
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: containerColor ?? Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: loadingColor,
                ),
              ),
            ),
          ),
        );
      },
    );

    state.insert(entry);

    return LoadingController(
      show: () {
        return true;
      },
      hide: () {
        entry.remove();
        return true;
      },
    );
  }
}