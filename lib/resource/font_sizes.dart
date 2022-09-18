enum FontSizes {
  font13,
  font14,
  font15,
  font16,
}

extension FontSizeExtension on FontSizes {
  double get fontSize {
    switch (this) {
      case FontSizes.font13:
        return 13;
      case FontSizes.font14:
        return 14;
      case FontSizes.font15:
        return 15;
      case FontSizes.font16:
        return 16;
    }
  }
}
