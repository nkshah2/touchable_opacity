import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class TouchableOpacity extends StatefulWidget {
  /// Creates a widget that uses Gesture Detector internally and works in the same way
  /// but fades the child when the user touches it.
  ///
  /// By default the opacity of the child is animated to 0.2 when the user touches it,
  /// this can be changed by providing a value for [activeOpacity]
  ///
  /// Pan and scale callbacks cannot be used simultaneously because scale is a
  /// superset of pan. Simply use the scale callbacks instead.
  ///
  /// Horizontal and vertical drag callbacks cannot be used simultaneously
  /// because a combination of a horizontal and vertical drag is a pan. Simply
  /// use the pan callbacks instead.
  ///
  /// By default, gesture detectors contribute semantic information to the tree
  /// that is used by assistive technology.
  TouchableOpacity({
    @required this.child,
    this.activeOpacity = 0.2,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onVerticalDragDown,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onVerticalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onHorizontalDragEnd,
    this.onHorizontalDragCancel,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onScaleEnd,
    this.behavior,
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.start,
  })  : assert(excludeFromSemantics != null),
        assert(dragStartBehavior != null),
        assert(() {
          final bool haveVerticalDrag = onVerticalDragStart != null ||
              onVerticalDragUpdate != null ||
              onVerticalDragEnd != null;
          final bool haveHorizontalDrag = onHorizontalDragStart != null ||
              onHorizontalDragUpdate != null ||
              onHorizontalDragEnd != null;
          final bool havePan =
              onPanStart != null || onPanUpdate != null || onPanEnd != null;
          final bool haveScale = onScaleStart != null ||
              onScaleUpdate != null ||
              onScaleEnd != null;
          if (havePan || haveScale) {
            if (havePan && haveScale) {
              throw FlutterError('Incorrect TouchableOpacity arguments.\n'
                  'Having both a pan gesture recognizer and a scale gesture recognizer is redundant; scale is a superset of pan. Just use the scale gesture recognizer.');
            }
            final String recognizer = havePan ? 'pan' : 'scale';
            if (haveVerticalDrag && haveHorizontalDrag) {
              throw FlutterError('Incorrect TouchableOpacity arguments.\n'
                  'Simultaneously having a vertical drag gesture recognizer, a horizontal drag gesture recognizer, and a $recognizer gesture recognizer '
                  'will result in the $recognizer gesture recognizer being ignored, since the other two will catch all drags.');
            }
          }
          return true;
        }()),
        super(key: _key);

  @override
  State<StatefulWidget> createState() {
    return _TouchableOpacityState(
      key: _gestureKey,
      child: child,
      activeOpacity: activeOpacity,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,
      onVerticalDragDown: onVerticalDragDown,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      onVerticalDragCancel: onVerticalDragCancel,
      onHorizontalDragDown: onHorizontalDragDown,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onHorizontalDragCancel: onHorizontalDragCancel,
      onForcePressStart: onForcePressStart,
      onForcePressPeak: onForcePressPeak,
      onForcePressUpdate: onForcePressUpdate,
      onForcePressEnd: onForcePressEnd,
      onPanDown: onPanDown,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      onPanCancel: onPanCancel,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      dragStartBehavior: dragStartBehavior,
    );
  }

  static final Key _key = Key("nksystems.touchable_opacity_super");
  static final Key _gestureKey =
      Key("nksystems.touchable_opacity_gesture_detector");

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// Double value that will be used as the opacity of the child when a pointer
  /// down event is registered. Defaults to 0.2, value must be between 1.0 and
  /// 0.0 .
  final double activeOpacity;

  /// A pointer that might cause a tap has contacted the screen at a particular
  /// location.
  ///
  /// This is called after a short timeout, even if the winning gesture has not
  /// yet been selected. If the tap gesture wins, [onTapUp] will be called,
  /// otherwise [onTapCancel] will be called.
  final GestureTapDownCallback onTapDown;

  /// A pointer that will trigger a tap has stopped contacting the screen at a
  /// particular location.
  ///
  /// This triggers immediately before [onTap] in the case of the tap gesture
  /// winning. If the tap gesture did not win, [onTapCancel] is called instead.
  final GestureTapUpCallback onTapUp;

  /// A tap has occurred.
  ///
  /// This triggers when the tap gesture wins. If the tap gesture did not win,
  /// [onTapCancel] is called instead.
  ///
  /// See also:
  ///
  ///  * [onTapUp], which is called at the same time but includes details
  ///    regarding the pointer position.
  final GestureTapCallback onTap;

  /// The pointer that previously triggered [onTapDown] will not end up causing
  /// a tap.
  ///
  /// This is called after [onTapDown], and instead of [onTapUp] and [onTap], if
  /// the tap gesture did not win.
  final GestureTapCancelCallback onTapCancel;

  /// The user has tapped the screen at the same location twice in quick
  /// succession.
  final GestureTapCallback onDoubleTap;

  /// Called when a long press gesture has been recognized.
  ///
  /// Triggered when a pointer has remained in contact with the screen at the
  /// same location for a long period of time.
  ///
  /// See also:
  ///
  ///  * [onLongPressStart], which has the same timing but has data for the
  ///    press location.
  final GestureLongPressCallback onLongPress;

  /// Callback for long press start with gesture location.
  ///
  /// Triggered when a pointer has remained in contact with the screen at the
  /// same location for a long period of time.
  ///
  /// See also:
  ///
  ///  * [onLongPress], which has the same timing but without the location data.
  final GestureLongPressStartCallback onLongPressStart;

  /// A pointer has been drag-moved after a long press.
  final GestureLongPressMoveUpdateCallback onLongPressMoveUpdate;

  /// A pointer that has triggered a long-press has stopped contacting the screen.
  ///
  /// See also:
  ///
  ///  * [onLongPressEnd], which has the same timing but has data for the up
  ///    gesture location.
  final GestureLongPressUpCallback onLongPressUp;

  /// A pointer that has triggered a long-press has stopped contacting the screen.
  ///
  /// See also:
  ///
  ///  * [onLongPressUp], which has the same timing but without the location data.
  final GestureLongPressEndCallback onLongPressEnd;

  /// A pointer has contacted the screen and might begin to move vertically.
  final GestureDragDownCallback onVerticalDragDown;

  /// A pointer has contacted the screen and has begun to move vertically.
  final GestureDragStartCallback onVerticalDragStart;

  /// A pointer that is in contact with the screen and moving vertically has
  /// moved in the vertical direction.
  final GestureDragUpdateCallback onVerticalDragUpdate;

  /// A pointer that was previously in contact with the screen and moving
  /// vertically is no longer in contact with the screen and was moving at a
  /// specific velocity when it stopped contacting the screen.
  final GestureDragEndCallback onVerticalDragEnd;

  /// The pointer that previously triggered [onVerticalDragDown] did not
  /// complete.
  final GestureDragCancelCallback onVerticalDragCancel;

  /// A pointer has contacted the screen and might begin to move horizontally.
  final GestureDragDownCallback onHorizontalDragDown;

  /// A pointer has contacted the screen and has begun to move horizontally.
  final GestureDragStartCallback onHorizontalDragStart;

  /// A pointer that is in contact with the screen and moving horizontally has
  /// moved in the horizontal direction.
  final GestureDragUpdateCallback onHorizontalDragUpdate;

  /// A pointer that was previously in contact with the screen and moving
  /// horizontally is no longer in contact with the screen and was moving at a
  /// specific velocity when it stopped contacting the screen.
  final GestureDragEndCallback onHorizontalDragEnd;

  /// The pointer that previously triggered [onHorizontalDragDown] did not
  /// complete.
  final GestureDragCancelCallback onHorizontalDragCancel;

  /// A pointer has contacted the screen and might begin to move.
  final GestureDragDownCallback onPanDown;

  /// A pointer has contacted the screen and has begun to move.
  final GestureDragStartCallback onPanStart;

  /// A pointer that is in contact with the screen and moving has moved again.
  final GestureDragUpdateCallback onPanUpdate;

  /// A pointer that was previously in contact with the screen and moving
  /// is no longer in contact with the screen and was moving at a specific
  /// velocity when it stopped contacting the screen.
  final GestureDragEndCallback onPanEnd;

  /// The pointer that previously triggered [onPanDown] did not complete.
  final GestureDragCancelCallback onPanCancel;

  /// The pointers in contact with the screen have established a focal point and
  /// initial scale of 1.0.
  final GestureScaleStartCallback onScaleStart;

  /// The pointers in contact with the screen have indicated a new focal point
  /// and/or scale.
  final GestureScaleUpdateCallback onScaleUpdate;

  /// The pointers are no longer in contact with the screen.
  final GestureScaleEndCallback onScaleEnd;

  /// The pointer is in contact with the screen and has pressed with sufficient
  /// force to initiate a force press. The amount of force is at least
  /// [ForcePressGestureRecognizer.startPressure].
  ///
  /// Note that this callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressStartCallback onForcePressStart;

  /// The pointer is in contact with the screen and has pressed with the maximum
  /// force. The amount of force is at least
  /// [ForcePressGestureRecognizer.peakPressure].
  ///
  /// Note that this callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressPeakCallback onForcePressPeak;

  /// A pointer is in contact with the screen, has previously passed the
  /// [ForcePressGestureRecognizer.startPressure] and is either moving on the
  /// plane of the screen, pressing the screen with varying forces or both
  /// simultaneously.
  ///
  /// Note that this callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressUpdateCallback onForcePressUpdate;

  /// The pointer is no longer in contact with the screen.
  ///
  /// Note that this callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressEndCallback onForcePressEnd;

  /// How this gesture detector should behave during hit testing.
  ///
  /// This defaults to [HitTestBehavior.deferToChild] if [child] is not null and
  /// [HitTestBehavior.translucent] if child is null.
  final HitTestBehavior behavior;

  /// Whether to exclude these gestures from the semantics tree. For
  /// example, the long-press gesture for showing a tooltip is
  /// excluded because the tooltip itself is included in the semantics
  /// tree directly and so having a gesture to show it would result in
  /// duplication of information.
  final bool excludeFromSemantics;

  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], gesture drag behavior will
  /// begin upon the detection of a drag gesture. If set to
  /// [DragStartBehavior.down] it will begin when a down event is first detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag
  /// animation smoother and setting it to [DragStartBehavior.down] will make
  /// drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// Only the [onStart] callbacks for the [VerticalDragGestureRecognizer],
  /// [HorizontalDragGestureRecognizer] and [PanGestureRecognizer] are affected
  /// by this setting.
  ///
  /// See also:
  ///
  ///  * [DragGestureRecognizer.dragStartBehavior], which gives an example for the different behaviors.
  final DragStartBehavior dragStartBehavior;
}

class _TouchableOpacityState extends State<TouchableOpacity>
    with SingleTickerProviderStateMixin {
  final Widget child;
  final double activeOpacity;
  final Key key;
  final GestureTapDownCallback onTapDown;
  final GestureTapUpCallback onTapUp;
  final GestureTapCallback onTap;
  final GestureTapCancelCallback onTapCancel;
  final GestureTapCallback onDoubleTap;
  final GestureLongPressCallback onLongPress;
  final GestureLongPressStartCallback onLongPressStart;
  final GestureLongPressMoveUpdateCallback onLongPressMoveUpdate;
  final GestureLongPressUpCallback onLongPressUp;
  final GestureLongPressEndCallback onLongPressEnd;
  final GestureDragDownCallback onVerticalDragDown;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final GestureDragCancelCallback onVerticalDragCancel;
  final GestureDragDownCallback onHorizontalDragDown;
  final GestureDragStartCallback onHorizontalDragStart;
  final GestureDragUpdateCallback onHorizontalDragUpdate;
  final GestureDragEndCallback onHorizontalDragEnd;
  final GestureDragCancelCallback onHorizontalDragCancel;
  final GestureForcePressStartCallback onForcePressStart;
  final GestureForcePressPeakCallback onForcePressPeak;
  final GestureForcePressUpdateCallback onForcePressUpdate;
  final GestureForcePressEndCallback onForcePressEnd;
  final GestureDragDownCallback onPanDown;
  final GestureDragStartCallback onPanStart;
  final GestureDragUpdateCallback onPanUpdate;
  final GestureDragEndCallback onPanEnd;
  final GestureDragCancelCallback onPanCancel;
  final GestureScaleStartCallback onScaleStart;
  final GestureScaleUpdateCallback onScaleUpdate;
  final GestureScaleEndCallback onScaleEnd;
  final HitTestBehavior behavior;
  final bool excludeFromSemantics;
  final DragStartBehavior dragStartBehavior;

  AnimationController _controller;

  _TouchableOpacityState({
    @required this.key,
    @required this.child,
    this.activeOpacity,
    @required this.onTapDown,
    @required this.onTapUp,
    @required this.onTap,
    @required this.onTapCancel,
    @required this.onDoubleTap,
    @required this.onLongPress,
    @required this.onLongPressStart,
    @required this.onLongPressMoveUpdate,
    @required this.onLongPressUp,
    @required this.onLongPressEnd,
    @required this.onVerticalDragDown,
    @required this.onVerticalDragStart,
    @required this.onVerticalDragUpdate,
    @required this.onVerticalDragEnd,
    @required this.onVerticalDragCancel,
    @required this.onHorizontalDragDown,
    @required this.onHorizontalDragStart,
    @required this.onHorizontalDragUpdate,
    @required this.onHorizontalDragEnd,
    @required this.onHorizontalDragCancel,
    @required this.onForcePressStart,
    @required this.onForcePressPeak,
    @required this.onForcePressUpdate,
    @required this.onForcePressEnd,
    @required this.onPanDown,
    @required this.onPanStart,
    @required this.onPanUpdate,
    @required this.onPanEnd,
    @required this.onPanCancel,
    @required this.onScaleStart,
    @required this.onScaleUpdate,
    @required this.onScaleEnd,
    @required this.behavior,
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.start,
  });

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 100),
        lowerBound: this.activeOpacity,
        upperBound: 1.0,
        value: 1.0);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      child: Opacity(
        child: child,
        opacity: _controller.value,
        key: Key("nksystems.touchable_opacity_opacity"),
      ),
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: onTap,
      onTapCancel: _onTapCancel,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,
      onVerticalDragDown: onVerticalDragDown,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      onVerticalDragCancel: onVerticalDragCancel,
      onHorizontalDragDown: onHorizontalDragDown,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onHorizontalDragCancel: onHorizontalDragCancel,
      onForcePressStart: onForcePressStart,
      onForcePressPeak: onForcePressPeak,
      onForcePressUpdate: onForcePressUpdate,
      onForcePressEnd: onForcePressEnd,
      onPanDown: onPanDown,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      onPanCancel: onPanCancel,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onScaleEnd: onScaleEnd,
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      dragStartBehavior: dragStartBehavior,
    );
  }

  void _onTapDown(TapDownDetails details) {
    if ( activeOpacity != 1.0 ) {
      _controller.reverse();
    }
    if (onTapDown != null) {
      onTapDown(details);
    }
  }

  void _onTapUp(TapUpDetails details) {
    if ( activeOpacity != 1.0 ) {
      _controller.forward();
    }
    if (onTapUp != null) {
      onTapUp(details);
    }
  }

  void _onTapCancel() {
    if ( activeOpacity != 1.0 ) {
      _controller.forward();
    }
    if (onTapCancel != null) {
      onTapCancel();
    }
  }
}
