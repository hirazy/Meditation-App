enum FontSizes {
  font13,
  font14,
  font15,
  font16,
  font17,
  font18,
  font19,
  font20,
  font22,
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
      case FontSizes.font17:
        return 17;
      case FontSizes.font18:
        return 18;
      case FontSizes.font19:
        return 19;
      case FontSizes.font20:
        return 20;
      case FontSizes.font22:
        return 22;
    }
  }
}
