import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@Deprecated('Use extension for the sizes instead from size.extension')
class AppSize {
  // Common spacing constants
  static const double xs = 2.0;
  static const double sm = 4.0;
  static const double xsm = 6.0;
  static const double md = 8.0;
  static const double lg = 10.0;
  static const double l = 12.0;
  static const double xlm = 14.0;
  static const double xl = 16.0;

  // Empty widgets to reduce boilerplate
  static const emptyWidget = SizedBox.shrink();
  static const emptyWidgetWide = SizedBox(width: double.infinity);
  static const emptySliver = SliverToBoxAdapter();

  // Margins
  // Horizontal margins using SizedBox for consistent spacing
  static final horizontalMargin2 = SizedBox(width: 2.0.w);
  static final horizontalMargin4 = SizedBox(width: 4.0.w);
  static final horizontalMargin6 = SizedBox(width: 6.0.w);
  static final horizontalMargin8 = SizedBox(width: 8.0.w);
  static final horizontalMargin10 = SizedBox(width: 10.0.w);
  static final horizontalMargin12 = SizedBox(width: 12.0.w);
  static final horizontalMargin14 = SizedBox(width: 14.0.w);
  static final horizontalMargin16 = SizedBox(width: 16.0.w);
  static final horizontalMargin18 = SizedBox(width: 18.0.w);
  static final horizontalMargin20 = SizedBox(width: 20.0.w);
  static final horizontalMargin22 = SizedBox(width: 22.0.w);
  static final horizontalMargin24 = SizedBox(width: 24.0.w);
  static final horizontalMargin26 = SizedBox(width: 26.0.w);
  static final horizontalMargin28 = SizedBox(width: 28.0.w);
  static final horizontalMargin30 = SizedBox(width: 30.0.w);
  static final horizontalMargin32 = SizedBox(width: 32.0.w);
  static final horizontalMargin34 = SizedBox(width: 34.0.w);
  static final horizontalMargin36 = SizedBox(width: 36.0.w);
  static final horizontalMargin38 = SizedBox(width: 38.0.w);
  static final horizontalMargin40 = SizedBox(width: 40.0.w);
  static final horizontalMargin42 = SizedBox(width: 42.0.w);
  static final horizontalMargin44 = SizedBox(width: 44.0.w);
  static final horizontalMargin46 = SizedBox(width: 46.0.w);
  static final horizontalMargin48 = SizedBox(width: 48.0.w);
  static final horizontalMargin50 = SizedBox(width: 50.0.w);
  static final verticalMargin2 = SizedBox(height: 2.0.h);
  static final verticalMargin4 = SizedBox(height: 4.0.h);
  static final verticalMargin6 = SizedBox(height: 6.0.h);
  static final verticalMargin8 = SizedBox(height: 8.0.h);
  static final verticalMargin10 = SizedBox(height: 10.0.h);
  static final verticalMargin12 = SizedBox(height: 12.0.h);
  static final verticalMargin14 = SizedBox(height: 14.0.h);
  static final verticalMargin16 = SizedBox(height: 16.0.h);
  static final verticalMargin18 = SizedBox(height: 18.0.h);
  static final verticalMargin20 = SizedBox(height: 20.0.h);
  static final verticalMargin22 = SizedBox(height: 22.0.h);
  static final verticalMargin24 = SizedBox(height: 24.0.h);
  static final verticalMargin26 = SizedBox(height: 26.0.h);
  static final verticalMargin28 = SizedBox(height: 28.0.h);
  static final verticalMargin30 = SizedBox(height: 30.0.h);
  static final verticalMargin32 = SizedBox(height: 32.0.h);
  static final verticalMargin34 = SizedBox(height: 34.0.h);
  static final verticalMargin36 = SizedBox(height: 36.0.h);
  static final verticalMargin38 = SizedBox(height: 38.0.h);
  static final verticalMargin40 = SizedBox(height: 40.0.h);
  static final verticalMargin42 = SizedBox(height: 42.0.h);
  static final verticalMargin44 = SizedBox(height: 44.0.h);
  static final verticalMargin46 = SizedBox(height: 46.0.h);
  static final verticalMargin48 = SizedBox(height: 48.0.h);
  static final verticalMargin50 = SizedBox(height: 50.0.h);

  // Sliver Margins
  // Sliver margins for sliver widgets spacing
  static final sliverMainAxisHorizontalMargin2 = SliverToBoxAdapter(
    child: SizedBox(width: 2.0.w),
  );
  static final sliverMainAxisHorizontalMargin4 = SliverToBoxAdapter(
    child: SizedBox(width: 4.0.w),
  );
  static final sliverMainAxisHorizontalMargin6 = SliverToBoxAdapter(
    child: SizedBox(width: 6.0.w),
  );
  static final sliverMainAxisHorizontalMargin8 = SliverToBoxAdapter(
    child: SizedBox(width: 8.0.w),
  );
  static final sliverMainAxisHorizontalMargin10 = SliverToBoxAdapter(
    child: SizedBox(width: 10.0.w),
  );
  static final sliverMainAxisHorizontalMargin12 = SliverToBoxAdapter(
    child: SizedBox(width: 12.0.w),
  );
  static final sliverMainAxisHorizontalMargin14 = SliverToBoxAdapter(
    child: SizedBox(width: 14.0.w),
  );
  static final sliverMainAxisHorizontalMargin16 = SliverToBoxAdapter(
    child: SizedBox(width: 16.0.w),
  );
  static final sliverMainAxisHorizontalMargin18 = SliverToBoxAdapter(
    child: SizedBox(width: 18.0.w),
  );
  static final sliverMainAxisHorizontalMargin20 = SliverToBoxAdapter(
    child: SizedBox(width: 20.0.w),
  );
  static final sliverMainAxisHorizontalMargin22 = SliverToBoxAdapter(
    child: SizedBox(width: 22.0.w),
  );
  static final sliverMainAxisHorizontalMargin24 = SliverToBoxAdapter(
    child: SizedBox(width: 24.0.w),
  );
  static final sliverMainAxisHorizontalMargin26 = SliverToBoxAdapter(
    child: SizedBox(width: 26.0.w),
  );
  static final sliverMainAxisHorizontalMargin28 = SliverToBoxAdapter(
    child: SizedBox(width: 28.0.w),
  );
  static final sliverMainAxisHorizontalMargin30 = SliverToBoxAdapter(
    child: SizedBox(width: 30.0.w),
  );
  static final sliverMainAxisHorizontalMargin32 = SliverToBoxAdapter(
    child: SizedBox(width: 32.0.w),
  );
  static final sliverMainAxisHorizontalMargin34 = SliverToBoxAdapter(
    child: SizedBox(width: 34.0.w),
  );
  static final sliverMainAxisHorizontalMargin36 = SliverToBoxAdapter(
    child: SizedBox(width: 36.0.w),
  );
  static final sliverMainAxisHorizontalMargin38 = SliverToBoxAdapter(
    child: SizedBox(width: 38.0.w),
  );
  static final sliverMainAxisHorizontalMargin40 = SliverToBoxAdapter(
    child: SizedBox(width: 40.0.w),
  );
  static final sliverMainAxisHorizontalMargin42 = SliverToBoxAdapter(
    child: SizedBox(width: 42.0.w),
  );
  static final sliverMainAxisHorizontalMargin44 = SliverToBoxAdapter(
    child: SizedBox(width: 44.0.w),
  );
  static final sliverMainAxisHorizontalMargin46 = SliverToBoxAdapter(
    child: SizedBox(width: 46.0.w),
  );
  static final sliverMainAxisHorizontalMargin48 = SliverToBoxAdapter(
    child: SizedBox(width: 48.0.w),
  );
  static final sliverMainAxisHorizontalMargin50 = SliverToBoxAdapter(
    child: SizedBox(width: 50.0.w),
  );

  static final sliverMainAxisVerticalMargin2 = SliverToBoxAdapter(
    child: SizedBox(height: 2.0.h),
  );
  static final sliverMainAxisVerticalMargin4 = SliverToBoxAdapter(
    child: SizedBox(height: 4.0.h),
  );
  static final sliverMainAxisVerticalMargin6 = SliverToBoxAdapter(
    child: SizedBox(height: 6.0.h),
  );
  static final sliverMainAxisVerticalMargin8 = SliverToBoxAdapter(
    child: SizedBox(height: 8.0.h),
  );
  static final sliverMainAxisVerticalMargin10 = SliverToBoxAdapter(
    child: SizedBox(height: 10.0.h),
  );
  static final sliverMainAxisVerticalMargin12 = SliverToBoxAdapter(
    child: SizedBox(height: 12.0.h),
  );
  static final sliverMainAxisVerticalMargin14 = SliverToBoxAdapter(
    child: SizedBox(height: 14.0.h),
  );
  static final sliverMainAxisVerticalMargin16 = SliverToBoxAdapter(
    child: SizedBox(height: 16.0.h),
  );
  static final sliverMainAxisVerticalMargin18 = SliverToBoxAdapter(
    child: SizedBox(height: 18.0.h),
  );
  static final sliverMainAxisVerticalMargin20 = SliverToBoxAdapter(
    child: SizedBox(height: 20.0.h),
  );
  static final sliverMainAxisVerticalMargin22 = SliverToBoxAdapter(
    child: SizedBox(height: 22.0.h),
  );
  static final sliverMainAxisVerticalMargin24 = SliverToBoxAdapter(
    child: SizedBox(height: 24.0.h),
  );
  static final sliverMainAxisVerticalMargin26 = SliverToBoxAdapter(
    child: SizedBox(height: 26.0.h),
  );
  static final sliverMainAxisVerticalMargin28 = SliverToBoxAdapter(
    child: SizedBox(height: 28.0.h),
  );
  static final sliverMainAxisVerticalMargin30 = SliverToBoxAdapter(
    child: SizedBox(height: 30.0.h),
  );
  static final sliverMainAxisVerticalMargin32 = SliverToBoxAdapter(
    child: SizedBox(height: 32.0.h),
  );
  static final sliverMainAxisVerticalMargin34 = SliverToBoxAdapter(
    child: SizedBox(height: 34.0.h),
  );
  static final sliverMainAxisVerticalMargin36 = SliverToBoxAdapter(
    child: SizedBox(height: 36.0.h),
  );
  static final sliverMainAxisVerticalMargin38 = SliverToBoxAdapter(
    child: SizedBox(height: 38.0.h),
  );
  static final sliverMainAxisVerticalMargin40 = SliverToBoxAdapter(
    child: SizedBox(height: 40.0.h),
  );
  static final sliverMainAxisVerticalMargin42 = SliverToBoxAdapter(
    child: SizedBox(height: 42.0.h),
  );
  static final sliverMainAxisVerticalMargin44 = SliverToBoxAdapter(
    child: SizedBox(height: 44.0.h),
  );
  static final sliverMainAxisVerticalMargin46 = SliverToBoxAdapter(
    child: SizedBox(height: 46.0.h),
  );
  static final sliverMainAxisVerticalMargin48 = SliverToBoxAdapter(
    child: SizedBox(height: 48.0.h),
  );
  static final sliverMainAxisVerticalMargin50 = SliverToBoxAdapter(
    child: SizedBox(height: 50.0.h),
  );

  static const sliverCrossAxisHorizontalMargin2 = SliverCrossAxisMargin(
    extent: 2.0,
  );
  static const sliverCrossAxisHorizontalMargin4 = SliverCrossAxisMargin(
    extent: 4.0,
  );
  static const sliverCrossAxisHorizontalMargin6 = SliverCrossAxisMargin(
    extent: 6.0,
  );
  static const sliverCrossAxisHorizontalMargin8 = SliverCrossAxisMargin(
    extent: 8.0,
  );
  static const sliverCrossAxisHorizontalMargin10 = SliverCrossAxisMargin(
    extent: 10.0,
  );
  static const sliverCrossAxisHorizontalMargin12 = SliverCrossAxisMargin(
    extent: 12.0,
  );
  static const sliverCrossAxisHorizontalMargin14 = SliverCrossAxisMargin(
    extent: 14.0,
  );
  static const sliverCrossAxisHorizontalMargin16 = SliverCrossAxisMargin(
    extent: 16.0,
  );
  static const sliverCrossAxisHorizontalMargin18 = SliverCrossAxisMargin(
    extent: 18.0,
  );
  static const sliverCrossAxisHorizontalMargin20 = SliverCrossAxisMargin(
    extent: 20.0,
  );
  static const sliverCrossAxisHorizontalMargin22 = SliverCrossAxisMargin(
    extent: 22.0,
  );
  static const sliverCrossAxisHorizontalMargin24 = SliverCrossAxisMargin(
    extent: 24.0,
  );
  static const sliverCrossAxisHorizontalMargin26 = SliverCrossAxisMargin(
    extent: 26.0,
  );
  static const sliverCrossAxisHorizontalMargin28 = SliverCrossAxisMargin(
    extent: 28.0,
  );
  static const sliverCrossAxisHorizontalMargin30 = SliverCrossAxisMargin(
    extent: 30.0,
  );
  static const sliverCrossAxisHorizontalMargin32 = SliverCrossAxisMargin(
    extent: 32.0,
  );
  static const sliverCrossAxisHorizontalMargin34 = SliverCrossAxisMargin(
    extent: 34.0,
  );
  static const sliverCrossAxisHorizontalMargin36 = SliverCrossAxisMargin(
    extent: 36.0,
  );
  static const sliverCrossAxisHorizontalMargin38 = SliverCrossAxisMargin(
    extent: 38.0,
  );
  static const sliverCrossAxisHorizontalMargin40 = SliverCrossAxisMargin(
    extent: 40.0,
  );
  static const sliverCrossAxisHorizontalMargin42 = SliverCrossAxisMargin(
    extent: 42.0,
  );
  static const sliverCrossAxisHorizontalMargin44 = SliverCrossAxisMargin(
    extent: 44.0,
  );
  static const sliverCrossAxisHorizontalMargin46 = SliverCrossAxisMargin(
    extent: 46.0,
  );
  static const sliverCrossAxisHorizontalMargin48 = SliverCrossAxisMargin(
    extent: 48.0,
  );
  static const sliverCrossAxisHorizontalMargin50 = SliverCrossAxisMargin(
    extent: 50.0,
  );

  static const sliverCrossAxisVerticalMargin2 = SliverCrossAxisMargin(
    extent: 2.0,
  );
  static const sliverCrossAxisVerticalMargin4 = SliverCrossAxisMargin(
    extent: 4.0,
  );
  static const sliverCrossAxisVerticalMargin6 = SliverCrossAxisMargin(
    extent: 6.0,
  );
  static const sliverCrossAxisVerticalMargin8 = SliverCrossAxisMargin(
    extent: 8.0,
  );
  static const sliverCrossAxisVerticalMargin10 = SliverCrossAxisMargin(
    extent: 10.0,
  );
  static const sliverCrossAxisVerticalMargin12 = SliverCrossAxisMargin(
    extent: 12.0,
  );
  static const sliverCrossAxisVerticalMargin14 = SliverCrossAxisMargin(
    extent: 14.0,
  );
  static const sliverCrossAxisVerticalMargin16 = SliverCrossAxisMargin(
    extent: 16.0,
  );
  static const sliverCrossAxisVerticalMargin18 = SliverCrossAxisMargin(
    extent: 18.0,
  );
  static const sliverCrossAxisVerticalMargin20 = SliverCrossAxisMargin(
    extent: 20.0,
  );
  static const sliverCrossAxisVerticalMargin22 = SliverCrossAxisMargin(
    extent: 22.0,
  );
  static const sliverCrossAxisVerticalMargin24 = SliverCrossAxisMargin(
    extent: 24.0,
  );
  static const sliverCrossAxisVerticalMargin26 = SliverCrossAxisMargin(
    extent: 26.0,
  );
  static const sliverCrossAxisVerticalMargin28 = SliverCrossAxisMargin(
    extent: 28.0,
  );
  static const sliverCrossAxisVerticalMargin30 = SliverCrossAxisMargin(
    extent: 30.0,
  );
  static const sliverCrossAxisVerticalMargin32 = SliverCrossAxisMargin(
    extent: 32.0,
  );
  static const sliverCrossAxisVerticalMargin34 = SliverCrossAxisMargin(
    extent: 34.0,
  );
  static const sliverCrossAxisVerticalMargin36 = SliverCrossAxisMargin(
    extent: 36.0,
  );
  static const sliverCrossAxisVerticalMargin38 = SliverCrossAxisMargin(
    extent: 38.0,
  );
  static const sliverCrossAxisVerticalMargin40 = SliverCrossAxisMargin(
    extent: 40.0,
  );
  static const sliverCrossAxisVerticalMargin42 = SliverCrossAxisMargin(
    extent: 42.0,
  );
  static const sliverCrossAxisVerticalMargin44 = SliverCrossAxisMargin(
    extent: 44.0,
  );
  static const sliverCrossAxisVerticalMargin46 = SliverCrossAxisMargin(
    extent: 46.0,
  );
  static const sliverCrossAxisVerticalMargin48 = SliverCrossAxisMargin(
    extent: 48.0,
  );
  static const sliverCrossAxisVerticalMargin50 = SliverCrossAxisMargin(
    extent: 50.0,
  );

  // Paddings
  // Paddings for consistent use of EdgeInsets throughout the app
  static const emptyPadding = EdgeInsets.zero;

  static final horizontalPadding2 = EdgeInsets.symmetric(horizontal: 2.0.w);
  static final horizontalPadding4 = EdgeInsets.symmetric(horizontal: 4.0.w);
  static final horizontalPadding6 = EdgeInsets.symmetric(horizontal: 6.0.w);
  static final horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8.0.w);
  static final horizontalPadding10 = EdgeInsets.symmetric(horizontal: 10.0.w);
  static final horizontalPadding12 = EdgeInsets.symmetric(horizontal: 12.0.w);
  static final horizontalPadding14 = EdgeInsets.symmetric(horizontal: 14.0.w);
  static final horizontalPadding16 = EdgeInsets.symmetric(horizontal: 16.0.w);
  static final horizontalPadding18 = EdgeInsets.symmetric(horizontal: 18.0.w);
  static final horizontalPadding20 = EdgeInsets.symmetric(horizontal: 20.0.w);
  static final horizontalPadding22 = EdgeInsets.symmetric(horizontal: 22.0.w);
  static final horizontalPadding24 = EdgeInsets.symmetric(horizontal: 24.0.w);
  static final horizontalPadding26 = EdgeInsets.symmetric(horizontal: 26.0.w);
  static final horizontalPadding28 = EdgeInsets.symmetric(horizontal: 28.0.w);
  static final horizontalPadding30 = EdgeInsets.symmetric(horizontal: 30.0.w);
  static final horizontalPadding32 = EdgeInsets.symmetric(horizontal: 32.0.w);
  static final horizontalPadding34 = EdgeInsets.symmetric(horizontal: 34.0.w);
  static final horizontalPadding36 = EdgeInsets.symmetric(horizontal: 36.0.w);
  static final horizontalPadding38 = EdgeInsets.symmetric(horizontal: 38.0.w);
  static final horizontalPadding40 = EdgeInsets.symmetric(horizontal: 40.0.w);
  static final horizontalPadding42 = EdgeInsets.symmetric(horizontal: 42.0.w);
  static final horizontalPadding44 = EdgeInsets.symmetric(horizontal: 44.0.w);
  static final horizontalPadding46 = EdgeInsets.symmetric(horizontal: 46.0.w);
  static final horizontalPadding48 = EdgeInsets.symmetric(horizontal: 48.0.w);
  static final horizontalPadding50 = EdgeInsets.symmetric(horizontal: 50.0.w);

  static final verticalPadding2 = EdgeInsets.symmetric(vertical: 2.0.h);
  static final verticalPadding4 = EdgeInsets.symmetric(vertical: 4.0.h);
  static final verticalPadding6 = EdgeInsets.symmetric(vertical: 6.0.h);
  static final verticalPadding8 = EdgeInsets.symmetric(vertical: 8.0.h);
  static final verticalPadding10 = EdgeInsets.symmetric(vertical: 10.0.h);
  static final verticalPadding12 = EdgeInsets.symmetric(vertical: 12.0.h);
  static final verticalPadding14 = EdgeInsets.symmetric(vertical: 14.0.h);
  static final verticalPadding16 = EdgeInsets.symmetric(vertical: 16.0.h);
  static final verticalPadding18 = EdgeInsets.symmetric(vertical: 18.0.h);
  static final verticalPadding20 = EdgeInsets.symmetric(vertical: 20.0.h);
  static final verticalPadding22 = EdgeInsets.symmetric(vertical: 22.0.h);
  static final verticalPadding24 = EdgeInsets.symmetric(vertical: 24.0.h);
  static final verticalPadding26 = EdgeInsets.symmetric(vertical: 26.0.h);
  static final verticalPadding28 = EdgeInsets.symmetric(vertical: 28.0.h);
  static final verticalPadding30 = EdgeInsets.symmetric(vertical: 30.0.h);
  static final verticalPadding32 = EdgeInsets.symmetric(vertical: 32.0.h);
  static final verticalPadding34 = EdgeInsets.symmetric(vertical: 34.0.h);
  static final verticalPadding36 = EdgeInsets.symmetric(vertical: 36.0.h);
  static final verticalPadding38 = EdgeInsets.symmetric(vertical: 38.0.h);
  static final verticalPadding40 = EdgeInsets.symmetric(vertical: 40.0.h);
  static final verticalPadding42 = EdgeInsets.symmetric(vertical: 42.0.h);
  static final verticalPadding44 = EdgeInsets.symmetric(vertical: 44.0.h);
  static final verticalPadding46 = EdgeInsets.symmetric(vertical: 46.0.h);
  static final verticalPadding48 = EdgeInsets.symmetric(vertical: 48.0.h);
  static final verticalPadding50 = EdgeInsets.symmetric(vertical: 50.0.h);

  static const allPadding2 = EdgeInsets.all(2.0);
  static const allPadding4 = EdgeInsets.all(4.0);
  static const allPadding6 = EdgeInsets.all(6.0);
  static const allPadding8 = EdgeInsets.all(8.0);
  static const allPadding10 = EdgeInsets.all(10.0);
  static const allPadding12 = EdgeInsets.all(12.0);
  static const allPadding14 = EdgeInsets.all(14.0);
  static const allPadding16 = EdgeInsets.all(16.0);
  static const allPadding18 = EdgeInsets.all(18.0);
  static const allPadding20 = EdgeInsets.all(20.0);
  static const allPadding22 = EdgeInsets.all(22.0);
  static const allPadding24 = EdgeInsets.all(24.0);
  static const allPadding26 = EdgeInsets.all(26.0);
  static const allPadding28 = EdgeInsets.all(28.0);
  static const allPadding30 = EdgeInsets.all(30.0);
  static const allPadding32 = EdgeInsets.all(32.0);
  static const allPadding34 = EdgeInsets.all(34.0);
  static const allPadding36 = EdgeInsets.all(36.0);
  static const allPadding38 = EdgeInsets.all(38.0);
  static const allPadding40 = EdgeInsets.all(40.0);
  static const allPadding42 = EdgeInsets.all(42.0);
  static const allPadding44 = EdgeInsets.all(44.0);
  static const allPadding46 = EdgeInsets.all(46.0);
  static const allPadding48 = EdgeInsets.all(48.0);
  static const allPadding50 = EdgeInsets.all(50.0);

  static const topPadding2 = EdgeInsets.only(top: 2.0);
  static const topPadding4 = EdgeInsets.only(top: 4.0);
  static const topPadding6 = EdgeInsets.only(top: 6.0);
  static const topPadding8 = EdgeInsets.only(top: 8.0);
  static const topPadding10 = EdgeInsets.only(top: 10.0);
  static const topPadding12 = EdgeInsets.only(top: 12.0);
  static const topPadding14 = EdgeInsets.only(top: 14.0);
  static const topPadding16 = EdgeInsets.only(top: 16.0);
  static const topPadding18 = EdgeInsets.only(top: 18.0);
  static const topPadding20 = EdgeInsets.only(top: 20.0);
  static const topPadding22 = EdgeInsets.only(top: 22.0);
  static const topPadding24 = EdgeInsets.only(top: 24.0);
  static const topPadding26 = EdgeInsets.only(top: 26.0);
  static const topPadding28 = EdgeInsets.only(top: 28.0);
  static const topPadding30 = EdgeInsets.only(top: 30.0);
  static const topPadding32 = EdgeInsets.only(top: 32.0);
  static const topPadding34 = EdgeInsets.only(top: 34.0);
  static const topPadding36 = EdgeInsets.only(top: 36.0);
  static const topPadding38 = EdgeInsets.only(top: 38.0);
  static const topPadding40 = EdgeInsets.only(top: 40.0);
  static const topPadding42 = EdgeInsets.only(top: 42.0);
  static const topPadding44 = EdgeInsets.only(top: 44.0);
  static const topPadding46 = EdgeInsets.only(top: 46.0);
  static const topPadding48 = EdgeInsets.only(top: 48.0);
  static const topPadding50 = EdgeInsets.only(top: 50.0);

  static const bottomPadding2 = EdgeInsets.only(bottom: 2.0);
  static const bottomPadding4 = EdgeInsets.only(bottom: 4.0);
  static const bottomPadding6 = EdgeInsets.only(bottom: 6.0);
  static const bottomPadding8 = EdgeInsets.only(bottom: 8.0);
  static const bottomPadding10 = EdgeInsets.only(bottom: 10.0);
  static const bottomPadding12 = EdgeInsets.only(bottom: 12.0);
  static const bottomPadding14 = EdgeInsets.only(bottom: 14.0);
  static const bottomPadding16 = EdgeInsets.only(bottom: 16.0);
  static const bottomPadding18 = EdgeInsets.only(bottom: 18.0);
  static const bottomPadding20 = EdgeInsets.only(bottom: 20.0);
  static const bottomPadding22 = EdgeInsets.only(bottom: 22.0);
  static const bottomPadding24 = EdgeInsets.only(bottom: 24.0);
  static const bottomPadding26 = EdgeInsets.only(bottom: 26.0);
  static const bottomPadding28 = EdgeInsets.only(bottom: 28.0);
  static const bottomPadding30 = EdgeInsets.only(bottom: 30.0);
  static const bottomPadding32 = EdgeInsets.only(bottom: 32.0);
  static const bottomPadding34 = EdgeInsets.only(bottom: 34.0);
  static const bottomPadding36 = EdgeInsets.only(bottom: 36.0);
  static const bottomPadding38 = EdgeInsets.only(bottom: 38.0);
  static const bottomPadding40 = EdgeInsets.only(bottom: 40.0);
  static const bottomPadding42 = EdgeInsets.only(bottom: 42.0);
  static const bottomPadding44 = EdgeInsets.only(bottom: 44.0);
  static const bottomPadding46 = EdgeInsets.only(bottom: 46.0);
  static const bottomPadding48 = EdgeInsets.only(bottom: 48.0);
  static const bottomPadding50 = EdgeInsets.only(bottom: 50.0);

  static const leftPadding2 = EdgeInsets.only(left: 2.0);
  static const leftPadding4 = EdgeInsets.only(left: 4.0);
  static const leftPadding6 = EdgeInsets.only(left: 6.0);
  static const leftPadding8 = EdgeInsets.only(left: 8.0);
  static const leftPadding10 = EdgeInsets.only(left: 10.0);
  static const leftPadding12 = EdgeInsets.only(left: 12.0);
  static const leftPadding14 = EdgeInsets.only(left: 14.0);
  static const leftPadding16 = EdgeInsets.only(left: 16.0);
  static const leftPadding18 = EdgeInsets.only(left: 18.0);
  static const leftPadding20 = EdgeInsets.only(left: 20.0);
  static const leftPadding22 = EdgeInsets.only(left: 22.0);
  static const leftPadding24 = EdgeInsets.only(left: 24.0);
  static const leftPadding26 = EdgeInsets.only(left: 26.0);
  static const leftPadding28 = EdgeInsets.only(left: 28.0);
  static const leftPadding30 = EdgeInsets.only(left: 30.0);
  static const leftPadding32 = EdgeInsets.only(left: 32.0);
  static const leftPadding34 = EdgeInsets.only(left: 34.0);
  static const leftPadding36 = EdgeInsets.only(left: 36.0);
  static const leftPadding38 = EdgeInsets.only(left: 38.0);
  static const leftPadding40 = EdgeInsets.only(left: 40.0);
  static const leftPadding42 = EdgeInsets.only(left: 42.0);
  static const leftPadding44 = EdgeInsets.only(left: 44.0);
  static const leftPadding46 = EdgeInsets.only(left: 46.0);
  static const leftPadding48 = EdgeInsets.only(left: 48.0);
  static const leftPadding50 = EdgeInsets.only(left: 50.0);

  static const rightPadding2 = EdgeInsets.only(right: 2.0);
  static const rightPadding4 = EdgeInsets.only(right: 4.0);
  static const rightPadding6 = EdgeInsets.only(right: 6.0);
  static const rightPadding8 = EdgeInsets.only(right: 8.0);
  static const rightPadding10 = EdgeInsets.only(right: 10.0);
  static const rightPadding12 = EdgeInsets.only(right: 12.0);
  static const rightPadding14 = EdgeInsets.only(right: 14.0);
  static const rightPadding16 = EdgeInsets.only(right: 16.0);
  static const rightPadding18 = EdgeInsets.only(right: 18.0);
  static const rightPadding20 = EdgeInsets.only(right: 20.0);
  static const rightPadding22 = EdgeInsets.only(right: 22.0);
  static const rightPadding24 = EdgeInsets.only(right: 24.0);
  static const rightPadding26 = EdgeInsets.only(right: 26.0);
  static const rightPadding28 = EdgeInsets.only(right: 28.0);
  static const rightPadding30 = EdgeInsets.only(right: 30.0);
  static const rightPadding32 = EdgeInsets.only(right: 32.0);
  static const rightPadding34 = EdgeInsets.only(right: 34.0);
  static const rightPadding36 = EdgeInsets.only(right: 36.0);
  static const rightPadding38 = EdgeInsets.only(right: 38.0);
  static const rightPadding40 = EdgeInsets.only(right: 40.0);
  static const rightPadding42 = EdgeInsets.only(right: 42.0);
  static const rightPadding44 = EdgeInsets.only(right: 44.0);
  static const rightPadding46 = EdgeInsets.only(right: 46.0);
  static const rightPadding48 = EdgeInsets.only(right: 48.0);
  static const rightPadding50 = EdgeInsets.only(right: 50.0);

  static const startPadding2 = EdgeInsetsDirectional.only(start: 2.0);
  static const startPadding4 = EdgeInsetsDirectional.only(start: 4.0);
  static const startPadding6 = EdgeInsetsDirectional.only(start: 6.0);
  static const startPadding8 = EdgeInsetsDirectional.only(start: 8.0);
  static const startPadding10 = EdgeInsetsDirectional.only(start: 10.0);
  static const startPadding12 = EdgeInsetsDirectional.only(start: 12.0);
  static const startPadding14 = EdgeInsetsDirectional.only(start: 14.0);
  static const startPadding16 = EdgeInsetsDirectional.only(start: 16.0);
  static const startPadding18 = EdgeInsetsDirectional.only(start: 18.0);
  static const startPadding20 = EdgeInsetsDirectional.only(start: 20.0);
  static const startPadding22 = EdgeInsetsDirectional.only(start: 22.0);
  static const startPadding24 = EdgeInsetsDirectional.only(start: 24.0);
  static const startPadding26 = EdgeInsetsDirectional.only(start: 26.0);
  static const startPadding28 = EdgeInsetsDirectional.only(start: 28.0);
  static const startPadding30 = EdgeInsetsDirectional.only(start: 30.0);
  static const startPadding32 = EdgeInsetsDirectional.only(start: 32.0);
  static const startPadding34 = EdgeInsetsDirectional.only(start: 34.0);
  static const startPadding36 = EdgeInsetsDirectional.only(start: 36.0);
  static const startPadding38 = EdgeInsetsDirectional.only(start: 38.0);
  static const startPadding40 = EdgeInsetsDirectional.only(start: 40.0);
  static const startPadding42 = EdgeInsetsDirectional.only(start: 42.0);
  static const startPadding44 = EdgeInsetsDirectional.only(start: 44.0);
  static const startPadding46 = EdgeInsetsDirectional.only(start: 46.0);
  static const startPadding48 = EdgeInsetsDirectional.only(start: 48.0);
  static const startPadding50 = EdgeInsetsDirectional.only(start: 50.0);

  static const endPadding2 = EdgeInsetsDirectional.only(end: 2.0);
  static const endPadding4 = EdgeInsetsDirectional.only(end: 4.0);
  static const endPadding6 = EdgeInsetsDirectional.only(end: 6.0);
  static const endPadding8 = EdgeInsetsDirectional.only(end: 8.0);
  static const endPadding10 = EdgeInsetsDirectional.only(end: 10.0);
  static const endPadding12 = EdgeInsetsDirectional.only(end: 12.0);
  static const endPadding14 = EdgeInsetsDirectional.only(end: 14.0);
  static const endPadding16 = EdgeInsetsDirectional.only(end: 16.0);
  static const endPadding18 = EdgeInsetsDirectional.only(end: 18.0);
  static const endPadding20 = EdgeInsetsDirectional.only(end: 20.0);
  static const endPadding22 = EdgeInsetsDirectional.only(end: 22.0);
  static const endPadding24 = EdgeInsetsDirectional.only(end: 24.0);
  static const endPadding26 = EdgeInsetsDirectional.only(end: 26.0);
  static const endPadding28 = EdgeInsetsDirectional.only(end: 28.0);
  static const endPadding30 = EdgeInsetsDirectional.only(end: 30.0);
  static const endPadding32 = EdgeInsetsDirectional.only(end: 32.0);
  static const endPadding34 = EdgeInsetsDirectional.only(end: 34.0);
  static const endPadding36 = EdgeInsetsDirectional.only(end: 36.0);
  static const endPadding38 = EdgeInsetsDirectional.only(end: 38.0);
  static const endPadding40 = EdgeInsetsDirectional.only(end: 40.0);
  static const endPadding42 = EdgeInsetsDirectional.only(end: 42.0);
  static const endPadding44 = EdgeInsetsDirectional.only(end: 44.0);
  static const endPadding46 = EdgeInsetsDirectional.only(end: 46.0);
  static const endPadding48 = EdgeInsetsDirectional.only(end: 48.0);
  static const endPadding50 = EdgeInsetsDirectional.only(end: 50.0);

  // Radius values for rounded corners
  static const verticalTopRadius2 = BorderRadius.vertical(
    top: Radius.circular(2.0),
  );
  static const verticalTopRadius4 = BorderRadius.vertical(
    top: Radius.circular(4.0),
  );
  static const verticalTopRadius6 = BorderRadius.vertical(
    top: Radius.circular(6.0),
  );
  static const verticalTopRadius8 = BorderRadius.vertical(
    top: Radius.circular(8.0),
  );
  static const verticalTopRadius10 = BorderRadius.vertical(
    top: Radius.circular(10.0),
  );
  static const verticalTopRadius12 = BorderRadius.vertical(
    top: Radius.circular(12.0),
  );
  static const verticalTopRadius14 = BorderRadius.vertical(
    top: Radius.circular(14.0),
  );
  static const verticalTopRadius16 = BorderRadius.vertical(
    top: Radius.circular(16.0),
  );
  static const verticalTopRadius18 = BorderRadius.vertical(
    top: Radius.circular(18.0),
  );
  static const verticalTopRadius20 = BorderRadius.vertical(
    top: Radius.circular(20.0),
  );
  static const verticalTopRadius22 = BorderRadius.vertical(
    top: Radius.circular(22.0),
  );
  static const verticalTopRadius24 = BorderRadius.vertical(
    top: Radius.circular(24.0),
  );
  static const verticalTopRadius26 = BorderRadius.vertical(
    top: Radius.circular(26.0),
  );
  static const verticalTopRadius28 = BorderRadius.vertical(
    top: Radius.circular(28.0),
  );
  static const verticalTopRadius30 = BorderRadius.vertical(
    top: Radius.circular(30.0),
  );
  static const verticalTopRadius32 = BorderRadius.vertical(
    top: Radius.circular(32.0),
  );
  static const verticalTopRadius34 = BorderRadius.vertical(
    top: Radius.circular(34.0),
  );
  static const verticalTopRadius36 = BorderRadius.vertical(
    top: Radius.circular(36.0),
  );
  static const verticalTopRadius38 = BorderRadius.vertical(
    top: Radius.circular(38.0),
  );
  static const verticalTopRadius40 = BorderRadius.vertical(
    top: Radius.circular(40.0),
  );
  static const verticalTopRadius42 = BorderRadius.vertical(
    top: Radius.circular(42.0),
  );
  static const verticalTopRadius44 = BorderRadius.vertical(
    top: Radius.circular(44.0),
  );
  static const verticalTopRadius46 = BorderRadius.vertical(
    top: Radius.circular(46.0),
  );
  static const verticalTopRadius48 = BorderRadius.vertical(
    top: Radius.circular(48.0),
  );
  static const verticalTopRadius50 = BorderRadius.vertical(
    top: Radius.circular(50.0),
  );

  static const verticalBottomRadius2 = BorderRadius.vertical(
    bottom: Radius.circular(2.0),
  );
  static const verticalBottomRadius4 = BorderRadius.vertical(
    bottom: Radius.circular(4.0),
  );
  static const verticalBottomRadius6 = BorderRadius.vertical(
    bottom: Radius.circular(6.0),
  );
  static const verticalBottomRadius8 = BorderRadius.vertical(
    bottom: Radius.circular(8.0),
  );
  static const verticalBottomRadius10 = BorderRadius.vertical(
    bottom: Radius.circular(10.0),
  );
  static const verticalBottomRadius12 = BorderRadius.vertical(
    bottom: Radius.circular(12.0),
  );
  static const verticalBottomRadius14 = BorderRadius.vertical(
    bottom: Radius.circular(14.0),
  );
  static const verticalBottomRadius16 = BorderRadius.vertical(
    bottom: Radius.circular(16.0),
  );
  static const verticalBottomRadius18 = BorderRadius.vertical(
    bottom: Radius.circular(18.0),
  );
  static const verticalBottomRadius20 = BorderRadius.vertical(
    bottom: Radius.circular(20.0),
  );
  static const verticalBottomRadius22 = BorderRadius.vertical(
    bottom: Radius.circular(22.0),
  );
  static const verticalBottomRadius24 = BorderRadius.vertical(
    bottom: Radius.circular(24.0),
  );
  static const verticalBottomRadius26 = BorderRadius.vertical(
    bottom: Radius.circular(26.0),
  );
  static const verticalBottomRadius28 = BorderRadius.vertical(
    bottom: Radius.circular(28.0),
  );
  static const verticalBottomRadius30 = BorderRadius.vertical(
    bottom: Radius.circular(30.0),
  );
  static const verticalBottomRadius32 = BorderRadius.vertical(
    bottom: Radius.circular(32.0),
  );
  static const verticalBottomRadius34 = BorderRadius.vertical(
    bottom: Radius.circular(34.0),
  );
  static const verticalBottomRadius36 = BorderRadius.vertical(
    bottom: Radius.circular(36.0),
  );
  static const verticalBottomRadius38 = BorderRadius.vertical(
    bottom: Radius.circular(38.0),
  );
  static const verticalBottomRadius40 = BorderRadius.vertical(
    bottom: Radius.circular(40.0),
  );
  static const verticalBottomRadius42 = BorderRadius.vertical(
    bottom: Radius.circular(42.0),
  );
  static const verticalBottomRadius44 = BorderRadius.vertical(
    bottom: Radius.circular(44.0),
  );
  static const verticalBottomRadius46 = BorderRadius.vertical(
    bottom: Radius.circular(46.0),
  );
  static const verticalBottomRadius48 = BorderRadius.vertical(
    bottom: Radius.circular(48.0),
  );
  static const verticalBottomRadius50 = BorderRadius.vertical(
    bottom: Radius.circular(50.0),
  );

  static const horizontalLeftRadius2 = BorderRadius.horizontal(
    left: Radius.circular(2.0),
  );
  static const horizontalLeftRadius4 = BorderRadius.horizontal(
    left: Radius.circular(4.0),
  );
  static const horizontalLeftRadius6 = BorderRadius.horizontal(
    left: Radius.circular(6.0),
  );
  static const horizontalLeftRadius8 = BorderRadius.horizontal(
    left: Radius.circular(8.0),
  );
  static const horizontalLeftRadius10 = BorderRadius.horizontal(
    left: Radius.circular(10.0),
  );
  static const horizontalLeftRadius12 = BorderRadius.horizontal(
    left: Radius.circular(12.0),
  );
  static const horizontalLeftRadius14 = BorderRadius.horizontal(
    left: Radius.circular(14.0),
  );
  static const horizontalLeftRadius16 = BorderRadius.horizontal(
    left: Radius.circular(16.0),
  );
  static const horizontalLeftRadius18 = BorderRadius.horizontal(
    left: Radius.circular(18.0),
  );
  static const horizontalLeftRadius20 = BorderRadius.horizontal(
    left: Radius.circular(20.0),
  );
  static const horizontalLeftRadius22 = BorderRadius.horizontal(
    left: Radius.circular(22.0),
  );
  static const horizontalLeftRadius24 = BorderRadius.horizontal(
    left: Radius.circular(24.0),
  );
  static const horizontalLeftRadius26 = BorderRadius.horizontal(
    left: Radius.circular(26.0),
  );
  static const horizontalLeftRadius28 = BorderRadius.horizontal(
    left: Radius.circular(28.0),
  );
  static const horizontalLeftRadius30 = BorderRadius.horizontal(
    left: Radius.circular(30.0),
  );
  static const horizontalLeftRadius32 = BorderRadius.horizontal(
    left: Radius.circular(32.0),
  );
  static const horizontalLeftRadius34 = BorderRadius.horizontal(
    left: Radius.circular(34.0),
  );
  static const horizontalLeftRadius36 = BorderRadius.horizontal(
    left: Radius.circular(36.0),
  );
  static const horizontalLeftRadius38 = BorderRadius.horizontal(
    left: Radius.circular(38.0),
  );
  static const horizontalLeftRadius40 = BorderRadius.horizontal(
    left: Radius.circular(40.0),
  );
  static const horizontalLeftRadius42 = BorderRadius.horizontal(
    left: Radius.circular(42.0),
  );
  static const horizontalLeftRadius44 = BorderRadius.horizontal(
    left: Radius.circular(44.0),
  );
  static const horizontalLeftRadius46 = BorderRadius.horizontal(
    left: Radius.circular(46.0),
  );
  static const horizontalLeftRadius48 = BorderRadius.horizontal(
    left: Radius.circular(48.0),
  );
  static const horizontalLeftRadius50 = BorderRadius.horizontal(
    left: Radius.circular(50.0),
  );

  static const horizontalRightRadius2 = BorderRadius.horizontal(
    right: Radius.circular(2.0),
  );
  static const horizontalRightRadius4 = BorderRadius.horizontal(
    right: Radius.circular(4.0),
  );
  static const horizontalRightRadius6 = BorderRadius.horizontal(
    right: Radius.circular(6.0),
  );
  static const horizontalRightRadius8 = BorderRadius.horizontal(
    right: Radius.circular(8.0),
  );
  static const horizontalRightRadius10 = BorderRadius.horizontal(
    right: Radius.circular(10.0),
  );
  static const horizontalRightRadius12 = BorderRadius.horizontal(
    right: Radius.circular(12.0),
  );
  static const horizontalRightRadius14 = BorderRadius.horizontal(
    right: Radius.circular(14.0),
  );
  static const horizontalRightRadius16 = BorderRadius.horizontal(
    right: Radius.circular(16.0),
  );
  static const horizontalRightRadius18 = BorderRadius.horizontal(
    right: Radius.circular(18.0),
  );
  static const horizontalRightRadius20 = BorderRadius.horizontal(
    right: Radius.circular(20.0),
  );
  static const horizontalRightRadius22 = BorderRadius.horizontal(
    right: Radius.circular(22.0),
  );
  static const horizontalRightRadius24 = BorderRadius.horizontal(
    right: Radius.circular(24.0),
  );
  static const horizontalRightRadius26 = BorderRadius.horizontal(
    right: Radius.circular(26.0),
  );
  static const horizontalRightRadius28 = BorderRadius.horizontal(
    right: Radius.circular(28.0),
  );
  static const horizontalRightRadius30 = BorderRadius.horizontal(
    right: Radius.circular(30.0),
  );
  static const horizontalRightRadius32 = BorderRadius.horizontal(
    right: Radius.circular(32.0),
  );
  static const horizontalRightRadius34 = BorderRadius.horizontal(
    right: Radius.circular(34.0),
  );
  static const horizontalRightRadius36 = BorderRadius.horizontal(
    right: Radius.circular(36.0),
  );
  static const horizontalRightRadius38 = BorderRadius.horizontal(
    right: Radius.circular(38.0),
  );
  static const horizontalRightRadius40 = BorderRadius.horizontal(
    right: Radius.circular(40.0),
  );
  static const horizontalRightRadius42 = BorderRadius.horizontal(
    right: Radius.circular(42.0),
  );
  static const horizontalRightRadius44 = BorderRadius.horizontal(
    right: Radius.circular(44.0),
  );
  static const horizontalRightRadius46 = BorderRadius.horizontal(
    right: Radius.circular(46.0),
  );
  static const horizontalRightRadius48 = BorderRadius.horizontal(
    right: Radius.circular(48.0),
  );
  static const horizontalRightRadius50 = BorderRadius.horizontal(
    right: Radius.circular(50.0),
  );

  static const allRadius2 = BorderRadius.all(Radius.circular(2.0));
  static const allRadius4 = BorderRadius.all(Radius.circular(4.0));
  static const allRadius6 = BorderRadius.all(Radius.circular(6.0));
  static const allRadius8 = BorderRadius.all(Radius.circular(8.0));
  static const allRadius10 = BorderRadius.all(Radius.circular(10.0));
  static const allRadius12 = BorderRadius.all(Radius.circular(12.0));
  static const allRadius14 = BorderRadius.all(Radius.circular(14.0));
  static const allRadius16 = BorderRadius.all(Radius.circular(16.0));
  static const allRadius18 = BorderRadius.all(Radius.circular(18.0));
  static const allRadius20 = BorderRadius.all(Radius.circular(20.0));
  static const allRadius22 = BorderRadius.all(Radius.circular(22.0));
  static const allRadius24 = BorderRadius.all(Radius.circular(24.0));
  static const allRadius26 = BorderRadius.all(Radius.circular(26.0));
  static const allRadius28 = BorderRadius.all(Radius.circular(28.0));
  static const allRadius30 = BorderRadius.all(Radius.circular(30.0));
  static const allRadius32 = BorderRadius.all(Radius.circular(32.0));
  static const allRadius34 = BorderRadius.all(Radius.circular(34.0));
  static const allRadius36 = BorderRadius.all(Radius.circular(36.0));
  static const allRadius38 = BorderRadius.all(Radius.circular(38.0));
  static const allRadius40 = BorderRadius.all(Radius.circular(40.0));
  static const allRadius42 = BorderRadius.all(Radius.circular(42.0));
  static const allRadius44 = BorderRadius.all(Radius.circular(44.0));
  static const allRadius46 = BorderRadius.all(Radius.circular(46.0));
  static const allRadius48 = BorderRadius.all(Radius.circular(48.0));
  static const allRadius50 = BorderRadius.all(Radius.circular(50.0));

  static var allMargin16;
}

/// Extension on SizedBox to allow merging of margins using `+` and `-` operators.
extension MergeMargins on SizedBox {
  /// Adds the width and height of two [SizedBox] widgets.
  ///
  /// The resulting [SizedBox] will have the combined width and height
  /// of both [SizedBox] widgets, with the second [SizedBox] retaining its child.
  ///
  /// Example:
  /// ```dart
  /// SizedBox box1 = SizedBox(width: 10.0, height: 10.0.w);
  /// SizedBox box2 = SizedBox(width: 5.0, height: 5.0.w);
  /// SizedBox result = box1 + box2;
  /// // result will have width = 15.0, height = 15.0
  /// ```
  SizedBox operator +(SizedBox other) {
    return SizedBox(
      width: (width ?? 0.0) + (other.width ?? 0.0),
      height: (height ?? 0.0) + (other.height ?? 0.0),
      child: other.child,
    );
  }

  /// Subtracts the width and height of the second [SizedBox] from the first.
  ///
  /// The resulting [SizedBox] will have the subtracted width and height
  /// of the two [SizedBox] widgets, with the second [SizedBox] retaining its child.
  ///
  /// Example:
  /// ```dart
  /// SizedBox box1 = SizedBox(width: 10.0, height: 10.0.w);
  /// SizedBox box2 = SizedBox(width: 5.0, height: 5.0.w);  finalizedBox box2 = SizedBox(width: 5.0, height: 5.0.w);
  /// SizedBox result = box1 - box2;
  /// // result will have width = 5.0, height = 5.0
  /// ```
  SizedBox operator -(SizedBox other) {
    return SizedBox(
      width: (width ?? 0.0) - (other.width ?? 0.0),
      height: (height ?? 0.0) - (other.height ?? 0.0),
      child: other.child,
    );
  }
}

/// A custom sliver cross-axis margin widget used to add space
/// in the cross-axis direction within a sliver layout.
class SliverCrossAxisMargin extends StatelessWidget {
  const SliverCrossAxisMargin({required this.extent, super.key});

  /// The extent of the margin in the cross-axis direction.
  final double extent;

  @override
  Widget build(BuildContext context) {
    return SliverConstrainedCrossAxis(
      maxExtent: extent,
      sliver: AppSize.emptySliver,
    );
  }
}
