import 'package:flutter/material.dart';

mixin BasePageMixin {
  bool get resizeToAvoidBottomInset => false;

  bool get tapOutsideHideKeyboard => false;

  Color? get backgroundColor => null;

  Future<bool> onWillPop() async => true;

  Widget body(BuildContext context);

  PreferredSizeWidget? buildAppBar(BuildContext context);

  Widget? buildBottomNavigationBar(BuildContext context);

  Widget? buildBottomSheet(BuildContext context);

  Widget? buildDrawer(BuildContext context);

  Widget? buildEndDrawer(BuildContext context);

  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: onWillPop,
          child: GestureDetector(
            onTap: () {
              if (tapOutsideHideKeyboard) {
                hideKeyboard(context);
              }
            },
            child: tapOutsideHideKeyboard
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: body(context),
                  )
                : body(context),
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
      bottomSheet: buildBottomSheet(context),
      drawer: buildDrawer(context),
      endDrawer: buildEndDrawer(context),
    );
  }

  void hideKeyboard(BuildContext context) {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  Color getBackgroundColor(BuildContext context) {
    return backgroundColor ?? Colors.white;
  }
}
