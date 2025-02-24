import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UnitIconWidget extends StatelessWidget {
  final String unitSize;
  final String unitType;

  const UnitIconWidget({
    super.key,
    required this.unitSize,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 50,
          height: 10,
          child:
              unitSize.isEmpty
                  ? null
                  : SvgPicture.asset(
                    'assets/images/orbat_icons/unit_sizes/$unitSize.svg',

                  ),
        ),
        SizedBox(
          width: 50,
          height: 38,
          child:
              unitType.isEmpty
                  ? const SizedBox()
                  : SvgPicture.asset(
                    'assets/images/orbat_icons/unit_types/$unitType.svg',
                  ),
        ),
      ],
    );
  }
}
