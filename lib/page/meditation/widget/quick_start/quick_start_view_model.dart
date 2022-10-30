import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'quick_start_state.dart';

class QuickStartViewModel extends StateNotifier<QuickStartState> {
  QuickStartViewModel() : super(QuickStartState.initial());
}
