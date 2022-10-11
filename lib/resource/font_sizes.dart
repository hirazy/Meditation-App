enum FontSizes {
  font12,
  font13,
  font14,
  font15,
  font16,
  font17,
  font18,
  font19,
  font20,
  font22,
  font24,
  font25,
}

extension FontSizeExtension on FontSizes {
  double get fontSize {
    switch (this) {
      case FontSizes.font12:
        return 12;
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
      case FontSizes.font24:
        return 24;
      case FontSizes.font25:
        return 25;
    }
  }
}
