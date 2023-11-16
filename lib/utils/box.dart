import 'package:flutter/widgets.dart';

extension BoxExtension on num {
  Widget get widthBox => SizedBox(
        width: toDouble(),
      );

  Widget get heightBox => SizedBox(
        height: toDouble(),
      );

  Widget get squareBox => SizedBox(
        height: toDouble(),
        width: toDouble(),
      );
}
