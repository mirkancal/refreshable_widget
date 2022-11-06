import 'package:flutter/material.dart';

/// typedef for builder method
typedef RefreshableWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

/// typedef for refresh function
typedef RefreshCall<T> = Future<T> Function();

/// Widget that refreshes itself
class RefreshableWidget<T> extends StatefulWidget {
  /// constructor
  const RefreshableWidget({
    super.key,
    required this.builder,
    required this.refreshCall,
    this.initialValue,
    Duration? refreshRate,
    Widget? loadingWidget,
    Widget? errorWidget,
  })  : refreshRate = refreshRate ?? const Duration(seconds: 20),
        loadingWidget =
            loadingWidget ?? const Center(child: CircularProgressIndicator()),
        errorWidget = errorWidget ?? const Text('An error occurred');

  /// method that builds
  final RefreshableWidgetBuilder<T> builder;

  /// method that provides update logic
  final RefreshCall<T> refreshCall;

  /// how often you want to update the widget
  final Duration refreshRate;

  /// initial value
  final T? initialValue;

  /// loading widget
  final Widget loadingWidget;

  /// error widget
  final Widget errorWidget;

  @override
  State<RefreshableWidget<T>> createState() => _RefreshableWidgetState<T>();
}

class _RefreshableWidgetState<T> extends State<RefreshableWidget<T>> {
  T? initialValue;
  late Stream<T> stream;
  T? cached;

  @override
  void initState() {
    if (widget.initialValue != null) {
      initialValue = widget.initialValue!;
    }
    stream = Stream<T?>.periodic(widget.refreshRate).asyncMap((_) async {
      try {
        final data = await widget.refreshCall();
        cached = data;
        return data;
      } catch (e) {
        if (cached != null) {
          return cached as T;
        }
        rethrow;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: initialValue,
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return widget.errorWidget;
        }
        if (snapshot.hasData) {
          return widget.builder(context, snapshot.data as T);
        } else {
          return widget.loadingWidget;
        }
      },
    );
  }
}
