import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common_widget/alert_dialog/loading_dialog.dart';
import 'data/provider/app_navigator_provider.dart';
import 'data/provider/loading_state_provider.dart';
import 'main/app_flavor.dart';
import 'navigation/app_route.dart';
import 'navigation/app_router.dart';
import 'resource/app_color.dart';
import 'resource/app_theme.dart';

class App extends ConsumerStatefulWidget {
  const App({
    required this.appFlavor,
    Key? key,
  }) : super(key: key);

  final AppFlavor appFlavor;

  @override
  AppState createState() => AppState();
}

class AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();

    print('App InitState');
  }

  @override
  Widget build(BuildContext context) {
    final loadingState = ref.watch(loadingStateProvider);

    return Builder(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: AppTheme.appTheme(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1,
              ),
              child:(BotToastInit())(context, child),
            );
          },
          home: Stack(
            children: [
              _buildContent(
                loadingState,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent(LoadingState loadingState) {
    return WillPopScope(
      onWillPop: () async {
        if (!loadingState.isLoading) {
          await ref
              .read(appNavigatorProvider)
              .navigatorKey
              .currentState
              ?.maybePop();
        }

        return false;
      },
      child: Navigator(
        key: ref.read(appNavigatorProvider).navigatorKey,
        initialRoute: AppRoute.homeTab,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }

  Widget _buildLoading(LoadingState loadingState) {
    return WillPopScope(
      onWillPop: Platform.isIOS && !loadingState.isLoading
          ? null
          : () async => !loadingState.isLoading,
      child: Visibility(
        visible: loadingState.isLoading,
        child: Scaffold(
          backgroundColor: loadingState.isShowLoadingDialog
              ? context.colors.black.withOpacity(0.5)
              : Colors.transparent,
          body: loadingState.isShowLoadingDialog
              ? Center(
                  child: LoadingDialog(
                    message: loadingState.message,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: AppBar(
        elevation: 0,
      ),
    );
  }
}
