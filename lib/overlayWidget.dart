import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

typedef PointMoveCallback = void Function(Offset offset);

class OverlayWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onDragStart;
  final VoidCallback onDragEnd;
  final PointMoveCallback onDragUpdate;
  const OverlayWidget(
      {super.key,
      required this.child,
      required this.onDragEnd,
      required this.onDragStart,
      required this.onDragUpdate});
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return Listener(
        onPointerMove: (event) {
          onDragUpdate(event.position);
        },
        child: MatrixGestureDetector(
          onMatrixUpdate: (m, tm, sm, rm) {
            notifier.value = m;
          },
          onScaleEnd: () {
            print("ON DRAG END CALL !!");
            onDragEnd();
          },
          onScaleStart: () {
            onDragStart();
          },
          child: AnimatedBuilder(
            animation: notifier,
            builder: (ctx, childWidget) {
              return Transform(
                  transform: notifier.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(fit: BoxFit.contain, child: child),
                  )

                  // FittedBox(fit: BoxFit.contain, child: child),
                  );
            },
          ),
        ));
  }
}
