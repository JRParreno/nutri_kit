import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nutri_kit/core/enum/gender.dart';
import 'package:nutri_kit/features/meal/presentation/pages/body/index.dart';
import 'package:nutri_kit/gen/colors.gen.dart';

class FirstCreateChildHealthPage extends StatefulWidget {
  const FirstCreateChildHealthPage({super.key});

  @override
  State<FirstCreateChildHealthPage> createState() =>
      _FirstCreateChildHealthPageState();
}

class _FirstCreateChildHealthPageState
    extends State<FirstCreateChildHealthPage> {
  int _index = 0;
  Gender? _gender;
  final _heightCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _fullNameCtrl = TextEditingController();
  final _birthdateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_index == 0) ...[
                        GenderForm(
                          onSelect: (value) => handleOnSelectGender(value),
                          selectedGender: _gender?.name,
                        ),
                      ],
                      if (_index == 1) ...[
                        WeightHeightForm(
                          heightValue: (value) {
                            EasyDebounce.debounce(
                                'heigh-on-change', // <-- An ID for this particular debouncer
                                const Duration(
                                    milliseconds:
                                        500), // <-- The debounce duration
                                () {
                              _heightCtrl.text = value.toString();
                            });
                          },
                          weightValue: (int value) {
                            EasyDebounce.debounce(
                                'weight-on-change', // <-- An ID for this particular debouncer
                                const Duration(
                                    milliseconds:
                                        500), // <-- The debounce duration
                                () {
                              _weightCtrl.text = value.toString();
                            });
                          },
                        ),
                      ],
                      if (_index == 2) ...[
                        BirthdateForm(
                          controller: _birthdateCtrl,
                          onSelectedBirthdate: (String value) {
                            _birthdateCtrl.text = value;
                          },
                        ),
                      ],
                      if (_index == 3) ...[
                        NicknameForm(
                          controller: _fullNameCtrl,
                        ),
                      ],
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _index += 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color(0xFF1DD0BB),
                    textStyle: const TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    _index == 3 ? 'Submit' : 'Next',
                    style: const TextStyle(
                      fontFamily: 'Signika',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Gap(15),
                if (_index > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _index -= 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: ColorName.detailBg,
                      textStyle: const TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontFamily: 'Signika',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                const Gap(100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleOnSelectGender(String value) {
    setState(() {
      _gender = value == Gender.male.name ? Gender.male : Gender.female;
    });
  }
}
