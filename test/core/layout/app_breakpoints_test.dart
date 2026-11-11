import 'package:flutter_test/flutter_test.dart';
import 'package:queue_flow/core/layout/app_breakpoints.dart';

void main() {
  test('classifies widths at the mobile, tablet, and desktop breakpoints', () {
    expect(AppBreakpoints.forWidth(430), AppLayoutSize.mobile);
    expect(AppBreakpoints.forWidth(600), AppLayoutSize.tablet);
    expect(AppBreakpoints.forWidth(1024), AppLayoutSize.tablet);
    expect(AppBreakpoints.forWidth(1025), AppLayoutSize.desktop);
  });
}
