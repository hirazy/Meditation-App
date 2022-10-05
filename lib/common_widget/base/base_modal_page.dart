import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'base_page_mixin.dart';

abstract class BaseModalPage extends ConsumerStatefulWidget {
  const BaseModalPage({Key? key}) : super(key: key);
}

abstract class BaseModalPageState<Page extends BaseModalPage>
    extends ConsumerState<Page> with BasePageMixin {
  final logger = Logger();

  double? get modalHeight => null;

  @override
  void initState() {
    super.initState();
    onInitState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @mustCallSuper
  void onInitState() {
    logger.d('Init State: $runtimeType');
  }

  @mustCallSuper
  void onDispose() {
    super.dispose();
    logger.d('Dispose: $runtimeType');
  }

  @override
  Widget build(BuildContext context) => Container(
        height: modalHeight ??
            MediaQuery.of(context).size.height -
                MediaQueryData.fromWindow(window).padding.top,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: buildPage(context),
      );
}
