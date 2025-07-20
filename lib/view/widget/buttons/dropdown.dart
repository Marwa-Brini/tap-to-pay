import 'package:flutter/material.dart';
import 'package:inst_pay/core/style/text_styles.dart';

class LanguageInput extends StatefulWidget {
  final String? value;
  final bool? enabled;
  const LanguageInput({super.key, this.value, this.enabled});

  @override
  State<LanguageInput> createState() => _LanguageInputState();
}

class _LanguageInputState extends State<LanguageInput> {
  String type = '';

  @override
  void initState() {
    type = widget.value ?? 'English';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButton<String>(
            hint: const Text("Language"),
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
                  'English',
                  'Français',
                  'العربية',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: AppTextStyle.blackTextStyle),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
