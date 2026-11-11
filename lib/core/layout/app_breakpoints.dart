enum AppLayoutSize { mobile, tablet, desktop }

class AppBreakpoints {
  static const double tabletMinWidth = 600;
  static const double desktopMinWidth = 1025;

  static AppLayoutSize forWidth(double width) {
    if (width < tabletMinWidth) {
      return AppLayoutSize.mobile;
    }
    if (width < desktopMinWidth) {
      return AppLayoutSize.tablet;
    }
    return AppLayoutSize.desktop;
  }
}
