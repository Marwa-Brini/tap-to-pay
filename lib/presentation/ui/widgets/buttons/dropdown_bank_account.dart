import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:inst_pay/core/style/text_styles.dart';
import 'package:inst_pay/core/utils/svg.dart';

class RibDropDown extends StatefulWidget {
  final String? value;
  final bool? enabled;
  const RibDropDown({super.key, this.value, this.enabled});

  @override
  State<RibDropDown> createState() => _RibDropDownState();
}

class _RibDropDownState extends State<RibDropDown> {
  String type = '';

  @override
  void initState() {
    type = widget.value ?? '6548374587298745';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      ),
      child: ButtonTheme(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        child: DropdownButton<String>(
          isExpanded: true,
          value: type,
          elevation: 16,
          underline: DropdownButtonHideUnderline(child: Container()),
          onChanged: (String? newValue) {
            setState(() {
              type = newValue!;
            });
          },
          items:
              <String>[
                '4354345445567',
                '3549860983475632',
                '6548374587298745',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: SvgPicture.string(APPSVG.bankIcon),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('RIB', style: AppTextStyle.smallGreyTextStyle),
                          Text(value, style: AppTextStyle.blackTextStyle),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
