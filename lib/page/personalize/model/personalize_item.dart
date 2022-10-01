import '../../../data/model/api/personalize.dart';

class PersonalizeItem {
  PersonalizeItem({
    required this.isSelected,
    required this.item,
  });

  bool isSelected;
  final Personalize item;
}
