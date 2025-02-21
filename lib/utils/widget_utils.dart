import 'package:document_fill_demo/common_controller/toggle_controller.dart';
import 'package:document_fill_demo/constants/assets_constants.dart';
import 'package:document_fill_demo/constants/color_constants.dart';
import 'package:document_fill_demo/constants/constant_list.dart';
import 'package:document_fill_demo/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RmiWidgetHelper {
  static Widget rmiColumn(
      {MainAxisAlignment? mainAxisAlignment,
      CrossAxisAlignment? crossAxisAlignment,
      MainAxisSize? mainAxisSize,
      required List<Widget> childrens}) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: childrens,
      ),
    );
  }

  static Widget rmiRow({
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    required List<Widget> childrens,
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: childrens,
      // mainAxisSize: mainAxisSize ?? MainAxisSize.min,
    );
  }

  static Widget rmiContainer(
      {required Widget child,
      EdgeInsets? padding,
      BoxDecoration? decoration,
      Color? color,
      Alignment? alignment}) {
    return Container(
      padding: padding ?? EdgeInsets.all(5),
      decoration: decoration ??
          BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color ?? ColorConstants.backgroundWhite),
      alignment: alignment ?? AlignmentDirectional.centerStart,
      child: child,
    );
  }

  static Widget rmiIconButton(
      {double? height,
      double? width,
      required Widget icon,
      Color? color,
      required VoidCallback onPressed}) {
    return IconButton(
      icon: icon,
      color: color,
      onPressed: onPressed,
    );
  }

  static Widget appButton(
      {required VoidCallback onPressed,
      required BuildContext context,
      required String buttonLabel,
      ShapeBorder? shape,
      required Color? color,
      bool? disabled,
      required bool isLoading,
      double? height,
      double? elevation,
      EdgeInsets? padding,
      TextStyle? buttonLabelStyle,
      double? width}) {
    return MaterialButton(
      onPressed: isLoading != true ? onPressed : () {},
      shape: shape ?? const StadiumBorder(),
      color: disabled == true ? color?.withOpacity(0.3) : color,
      height: height ?? 45.0,
      minWidth: width ?? 150,
      elevation: elevation ?? 0.0,
      padding: padding ?? EdgeInsets.zero,
      child: Center(
        child: isLoading == true
            ? const Padding(
                padding: EdgeInsets.all(5.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                buttonLabel ?? '',
                style: buttonLabelStyle ??
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: AppFontSize.fontSizeM,
                        color: ColorConstants.backgroundWhite),
              ),
      ),
    );
  }

  static Widget rmiTextButton({
    key,
    required onPressed,
    onLongPress,
    onHover,
    onFocusChange,
    ButtonStyle? style,
    focusNode,
    autofocus = false,
    clipBehavior,
    statesController,
    isSemanticButton,
    required Widget child,
    iconAlignment,
    BuildContext? context,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: style ??
          ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              ColorConstants.backgroundWhite,
            ),
            alignment: Alignment.center,
            elevation: WidgetStatePropertyAll(1),
          ),
      focusNode: focusNode,
      clipBehavior: clipBehavior,
      statesController: statesController,
      child: child,
    );
  }

  static Widget rmiTextField({
    required String labelText,
    String? hintText,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool obscureText = false,
    IconData? prefixIcon,
    Icon? suffixIcon,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    TextStyle? style,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      style: GoogleFonts.plusJakartaSans(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.plusJakartaSans(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        hintText: hintText,
        floatingLabelStyle: GoogleFonts.plusJakartaSans(
          color: Color.fromRGBO(78, 77, 77, 1),
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color.fromRGBO(141, 188, 211, 1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color.fromRGBO(141, 188, 211, 1)),
          gapPadding: 8.0,
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(Icons.arrow_forward_ios) : null,
      ),
    );
  }

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      bodySmall: TextStyle(fontSize: 14, color: Colors.black54),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      bodySmall: TextStyle(fontSize: 14, color: Colors.white70),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static SizedBox verticalSpacer(double? spacing) {
    return SizedBox(height: spacing ?? 10);
  }

  static SizedBox horizontalSpacer(double? spacing) {
    return SizedBox(width: spacing ?? 10);
  }

  static SizedBox customElevatedButton(
      {double? height,
      double? width,
      required String text,
      required VoidCallback onPressed,
      Color? color,
      Color? textColor,
      TextStyle? textStyle,
      EdgeInsetsGeometry? padding,
      Widget? child,
      BorderRadius? borderRadius,
      Alignment? alignment,
      required bool isEnabled,
      required BuildContext context}) {
    return SizedBox(
      height: height ?? 45.0,
      width: width ?? SizeConfig.screenWidth(context) - 45,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          alignment: alignment ?? Alignment.center,
          backgroundColor:
              isEnabled == true ? color : Color.fromRGBO(78, 77, 77, 1),
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10.0),
          ),
        ),
        child: child ?? rmiText(
            text: text,
            color: isEnabled == true ? textColor : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  static TextField appTextField({
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    bool? obscured,
    TextInputType? keyboardType,
    TextEditingController? controller,
    bool? enabled,
    FocusNode? focusNode,
    String? errorMessage,
    String? hintText,
    double? cursorHeight,
    String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? prefixText,
    TextCapitalization? textCapitalization,
    List<TextInputFormatter>? inputFormatter,
    required BuildContext context,
    required ValueChanged<String> onChanged,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onEditingComplete,
    VoidCallback? onTap,
    int? maxLines,
  }) {
    return TextField(
      cursorHeight: cursorHeight ?? 12,
      obscureText: obscured ?? false,
      onEditingComplete: onEditingComplete ?? () {},
      onSubmitted: onSubmitted,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType ?? TextInputType.text,
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      inputFormatters: inputFormatter ?? [],
      style: labelStyle ?? Theme.of(context).textTheme.titleMedium,
      controller: controller,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        enabled: enabled ?? true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: labelText ?? '',
        floatingLabelStyle: Theme.of(context).textTheme.labelLarge!,
        border: OutlineInputBorder(
          // Add your desired border style here
          borderRadius: BorderRadius.circular(12), // Rounded corners
          borderSide: BorderSide(
            color: Colors.blue, // Border color
            width: 2.0, // Border thickness
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color.fromRGBO(141, 188, 211, 1)),
          gapPadding: 8.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color.fromRGBO(141, 188, 211, 1)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red, // Border color for errors
            width: 2.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade400, // Border color when disabled
            width: 1.5,
          ),
        ),
        hintText: hintText ?? "",
        errorText: errorMessage,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        labelStyle: labelStyle ?? Theme.of(context).textTheme.titleSmall,
        hintStyle: hintStyle ??
            Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.withOpacity(0.8),
                ),
        errorStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.red, fontSize: 10),
      ),
      enabled: enabled ?? true,
      focusNode: focusNode,
      onChanged: onChanged,
      onTap: onTap,
    );
  }

  static Widget rmiDropDown1({
    required String value,
    required String errorMessage,
    required bool error,
    required ValueChanged<String?> onDropDownChanged,
    required List<String> items,
    Widget? hint,

    // Fix: Ensure correct type
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: ColorConstants.dropdownBorder,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              icon: SvgPicture.asset(AssetsConstants.dropDown),
              focusColor: Colors.transparent,
              isExpanded: true,
              underline: const SizedBox(),
              hint: hint ?? RmiWidgetHelper.rmiText(text: 'ID PROOF*'),
              value: (value.isNotEmpty && proofs.contains(value) ||
                      party.contains(value))
                  ? value
                  : null,
              items: items.map((proof) {
                return DropdownMenuItem<String>(
                  value: proof,
                  child: RmiWidgetHelper.rmiText(
                    text: proof,
                    color: ColorConstants.fontDarkGrey,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }).toList(),
              onChanged: onDropDownChanged,
            )),
        const SizedBox(width: 10),
        if (error)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: RmiWidgetHelper.rmiText(
              color: Colors.red,
              text: errorMessage,
              fontSize: 12,
            ),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }

  static Widget rmiDropDown2({
    required BuildContext context,
    required dynamic controller,
  }) {
    return Obx(
      () => Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(141, 188, 211, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          icon: SvgPicture.asset(AssetsConstants.dropDown),
          focusColor: Colors.transparent,
          underline: const SizedBox(),
          value: controller.selectedParty.value.isEmpty
              ? null
              : controller.selectedParty.value,
          hint: RmiWidgetHelper.rmiText(
            text: 'Party Type*',
            color: ColorConstants.fontLightGrey,
            fontWeight: FontWeight.w600,
          ),
          items: party.map((party) {
            return DropdownMenuItem<String>(
              value: party,
              child: RmiWidgetHelper.rmiText(
                text: party,
                color: ColorConstants.fontDarkGrey,
                fontWeight: FontWeight.w600,
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              controller.selectedParty.value = value;
              // controller.validateParty();
            }
          },
        ),
      ),
    );
  }

  static Widget rmiText({
    required String text,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      text,
      style: style ??
          GoogleFonts.plusJakartaSans(
              color: color ?? ColorConstants.fontBlack,
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? rmiFontWeight.headline),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: false,
    );
  }

  static Widget rmiMaterial({
    required Widget child,
    type,
    clipBehavior,
    shape,
  }) {
    return Material(
      type: type ?? MaterialType.card,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      shape: shape ??
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Color.fromRGBO(141, 188, 211, 1),
              )),
      child: child,
    );
  }

  static Widget rmiAnimatedContainer(
      {BuildContext? context,
      // required bool isVisible,
      required Widget child,
      duration = const Duration(milliseconds: 300),
      EdgeInsets? padding,
      Color? color,
      borderRadius = 10.0,
      Decoration? decoration}) {
    return AnimatedContainer(
      duration: duration,
      padding: padding ?? EdgeInsets.all(10),
      width: double.infinity,
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color ?? ColorConstants.backgroundWhite,
          ),
      child: child,
    );
  }

  static PreferredSizeWidget rmiAppBar({
    required String title,
    String? subtitle,
    List<Widget>? actions,
    bool centerTitle = true,
    Color? backgroundColor,
    Widget? leading,
    PreferredSizeWidget? bottom,
    double elevation = 4.0,
    bool automaticallyImplyLeading = false,
  }) {
    return AppBar(
      toolbarHeight: 62,
      clipBehavior: Clip.antiAlias,
      titleSpacing: 10,
      automaticallyImplyLeading: automaticallyImplyLeading,
      bottom: bottom,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: centerTitle
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RmiWidgetHelper.rmiText(
                  text: title,
                  color: ColorConstants.fontBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
              if (subtitle != null)
                RmiWidgetHelper.rmiText(
                    text: subtitle,
                    color: ColorConstants.fontBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
            ],
          ),
        ],
      ),
      actions: actions ??
          [
            RmiWidgetHelper.rmiIconButton(
              icon: SvgPicture.asset(AssetsConstants.notificationIcon),
              height: 27,
              width: 18,
              color: ColorConstants.fontBlack,
              onPressed: () {},
            ),
            RmiWidgetHelper.rmiIconButton(
              icon: SvgPicture.asset(AssetsConstants.hamBurgerIcon),
              height: 20,
              width: 20,
              color: ColorConstants.fontBlack,
              onPressed: () {},
            ),
          ],
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? ColorConstants.appBarColor,
      leading: leading ??
          RmiWidgetHelper.rmiIconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
      elevation: elevation,
    );
  }

  static Widget rmiDashedBorderContainer({
    BuildContext? context,
    Widget? child,
    double? strokeWidth,
    double? dashWidth,
    double? dashSpace,
    Color? borderColor,
    double? borderRadius,
    EdgeInsets? padding,
  }) {
    return CustomPaint(
      painter: DashedBorderPainter(
        dashWidth: 8.0,
        dashSpace: 4.0,
        strokeWidth: 1.0,
        borderColor: Color.fromRGBO(141, 188, 211, 1),
        borderRadius: 7.0,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(10),
        child: child,
      ),
    );
  }

  static Widget buildToggleSection({
    required CustomToggleController controller,
    required List<String> labels,
    required ValueChanged<int> onValueChanged,
    required BuildContext context,
    double? height,
    double? width,
    EdgeInsets? padding,
    Decoration? decoration,
  }) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.29,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: decoration ??
          BoxDecoration(
            color: Color.fromRGBO(242, 244, 245, 1),
            borderRadius: BorderRadius.circular(6),
          ),
      child: rmiToggleButton(
        labels: labels,
        controller: controller,
        onValueChanged: onValueChanged,
      ),
    );
  }

  static Widget rmiToggleButton({
    required labels,
    required CustomToggleController controller,
    required ValueChanged<int> onValueChanged,
  }) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          labels.length,
          (index) => GestureDetector(
            onTap: () {
              controller.updateSelectedValue(index);
              onValueChanged(index);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                color: controller.selectedValue.value == index
                    ? Colors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: controller.selectedValue.value == index
                      ? Colors.blue
                      : Colors.transparent,
                ),
              ),
              child: RmiWidgetHelper.rmiText(
                text: labels[index],
                color: controller.selectedValue.value == index
                    ? Color(0xFF4E4D4D)
                    : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final Color borderColor;
  final double borderRadius;

  DashedBorderPainter({
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
    required this.borderColor,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        ),
      );

    final dashPath = Path();
    double distance = 0.0;

    for (final metric in path.computeMetrics()) {
      while (distance < metric.length) {
        final start = metric.getTangentForOffset(distance)?.position;
        final end = metric.getTangentForOffset(distance + dashWidth)?.position;

        if (start != null && end != null) {
          dashPath.moveTo(start.dx, start.dy);
          dashPath.lineTo(end.dx, end.dy);
        }

        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
