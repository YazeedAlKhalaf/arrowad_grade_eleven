import "package:flash/flash.dart";
import "package:flutter/material.dart";

class FlashHelper {
  static TextStyle _titleStyle(BuildContext context, [Color? color]) {
    final ThemeData theme = Theme.of(context);
    return (theme.dialogTheme.titleTextStyle ?? theme.textTheme.titleLarge)
            ?.copyWith(color: color) ??
        const TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w700,
        );
  }

  static TextStyle _contentStyle(BuildContext context, [Color? color]) {
    final ThemeData theme = Theme.of(context);
    return (theme.dialogTheme.contentTextStyle ?? theme.textTheme.bodyMedium)
            ?.copyWith(color: color) ??
        const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
        );
  }

  static Future<T?> successBar<T>(
    BuildContext context, {
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (
        BuildContext context,
        FlashController<T> controller,
      ) {
        return Flash<T>(
          controller: controller,
          dismissDirections: [
            FlashDismissDirection.endToStart,
            FlashDismissDirection.startToEnd,
          ],
          child: FlashBar(
            controller: controller,
            title: title == null
                ? null
                : Text(
                    title,
                    style: _titleStyle(
                      context,
                      Colors.white,
                    ),
                  ),
            content: Text(
              message,
              style: _contentStyle(
                context,
                Colors.white,
              ),
            ),
            icon: Icon(
              Icons.check_circle,
              color: Colors.blue[300],
            ),
            indicatorColor: Colors.blue[300],
          ),
        );
      },
    );
  }

  static Future<T?> errorBar<T>(
    BuildContext context, {
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (
        BuildContext context,
        FlashController<T> controller,
      ) {
        return Flash<T>(
          controller: controller,
          dismissDirections: [
            FlashDismissDirection.endToStart,
            FlashDismissDirection.startToEnd,
          ],
          child: FlashBar(
            controller: controller,
            title: title == null
                ? null
                : Text(
                    title,
                    style: _titleStyle(
                      context,
                      Colors.white,
                    ),
                  ),
            content: Text(
              message,
              style: _contentStyle(
                context,
                Colors.white,
              ),
            ),
            icon: Icon(
              Icons.warning,
              color: Colors.red[300],
            ),
            indicatorColor: Colors.red[300],
          ),
        );
      },
    );
  }

  static Future<T?> infoBar<T>(
    BuildContext context, {
    String? title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (
        BuildContext context,
        FlashController<T> controller,
      ) {
        return Flash<T>(
          controller: controller,
          dismissDirections: [
            FlashDismissDirection.endToStart,
            FlashDismissDirection.startToEnd,
          ],
          child: FlashBar(
            controller: controller,
            title: title == null
                ? null
                : Text(
                    title,
                    style: _titleStyle(
                      context,
                      Colors.white,
                    ),
                  ),
            content: Text(
              message,
              style: _contentStyle(
                context,
                Colors.white,
              ),
            ),
            icon: Icon(
              Icons.info_outline,
              color: Colors.green[300],
            ),
            indicatorColor: Colors.green[300],
          ),
        );
      },
    );
  }
}
