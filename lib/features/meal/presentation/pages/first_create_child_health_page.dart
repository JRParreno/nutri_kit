import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/core/enum/gender.dart';
import 'package:nutri_kit/features/home/presentation/pages/pinggang_pinoy_pdf_viewer_page.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/child_health_list/child_health_list_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/create_child_health_form/create_child_health_form_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/pages/body/index.dart';
import 'package:nutri_kit/gen/assets.gen.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:nutri_kit/router/index.dart';
import 'package:quickalert/quickalert.dart';

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
  bool isEnabledNext = false;

  @override
  void initState() {
    super.initState();
    _fullNameCtrl.addListener(() {
      EasyDebounce.debounce(
          'nickname-on-change', // <-- An ID for this particular debouncer
          const Duration(milliseconds: 500), // <-- The debounce duration
          () {
        perScreenFormValidation();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _heightCtrl.dispose();
    _weightCtrl.dispose();
    _fullNameCtrl.dispose();
    _birthdateCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      body: BlocListener<CreateChildHealthFormBloc, CreateChildHealthFormState>(
        listener: (context, state) {
          if (state is CreateChildHealthFormLoading) {
            LoadingScreen.instance().show(context: context);
          }

          if (state is CreateChildHealthFormFailure ||
              state is CreateChildHealthFormSuccess) {
            Future.delayed(const Duration(milliseconds: 500), () {
              LoadingScreen.instance().hide();
            });
          }

          if (state is CreateChildHealthFormSuccess) {
            context
                .read<ChildHealthListBloc>()
                .add(OnGetChildHealthListEvent());

            context.pushReplacementNamed(
              AppRoutes.chidlMealPlanDetailPage.name,
              pathParameters: {
                "mealPlanId": state.userMealPlanCreationEntity.mealplanId,
                "userMealPlanId":
                    state.userMealPlanCreationEntity.usermealplanId,
                "isCreated": "true",
              },
              extra: state.userMealPlanCreationEntity.healthStatusInfos,
            );
            return;
          }

          if (state is CreateChildHealthFormFailure) {
            onFormError(state.message);
          }
        },
        child: SafeArea(
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
                            initialHeight: _heightCtrl.text.isNotEmpty
                                ? double.parse(_heightCtrl.value.text)
                                : null,
                            initialWeight: _weightCtrl.text.isNotEmpty
                                ? int.parse(_weightCtrl.value.text)
                                : null,
                            heightValue: (value) {
                              EasyDebounce.debounce(
                                  'heigh-on-change', // <-- An ID for this particular debouncer
                                  const Duration(
                                      milliseconds:
                                          500), // <-- The debounce duration
                                  () {
                                _heightCtrl.text = value.toString();
                                perScreenFormValidation();
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
                                perScreenFormValidation();
                              });
                            },
                          ),
                        ],
                        if (_index == 2) ...[
                          BirthdateForm(
                            controller: _birthdateCtrl,
                            onSelectedBirthdate: (String value) {
                              _birthdateCtrl.text = value;
                              perScreenFormValidation();
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
                    onPressed: isEnabledNext
                        ? _index == 3
                            ? handleSubmitForm
                            : () {
                                setState(() {
                                  _index += 1;
                                });
                                perScreenFormValidation();
                              }
                        : null,
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
                        perScreenFormValidation();
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
      ),
    );
  }

  void handleOnSelectGender(String value) {
    setState(() {
      _gender = value == Gender.male.name ? Gender.male : Gender.female;
    });
    perScreenFormValidation();
  }

  void perScreenFormValidation() {
    switch (_index) {
      case 0:
        setState(() {
          isEnabledNext = _gender != null;
        });
        break;
      case 1:
        setState(() {
          isEnabledNext =
              _heightCtrl.text.isNotEmpty && _weightCtrl.text.isNotEmpty;
        });
        break;
      case 2:
        setState(() {
          isEnabledNext = _birthdateCtrl.text.isNotEmpty;
        });
        break;
      case 3:
        setState(() {
          isEnabledNext = _fullNameCtrl.text.isNotEmpty;
        });
        break;
      default:
    }
  }

  void onFormError(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: message,
        onConfirmBtnTap:
            message.toLowerCase() == 'Child is healthy'.toLowerCase()
                ? () {
                    context.pop();
                    Future.delayed(const Duration(milliseconds: 300), () {
                      context.replaceNamed(
                        AppRoutes.homePDFViewer.name,
                        extra: PDFParams(
                            title: 'Kids', assetPath: Assets.pdfs.homeKids),
                      );
                    });
                  }
                : null,
      );
    });
  }

  void handleSubmitForm() {
    context.read<CreateChildHealthFormBloc>().add(
          CreateChildHealthFormSubmitEvent(
            name: _fullNameCtrl.text,
            weight: _weightCtrl.text,
            height: _heightCtrl.text,
            birthdate: _birthdateCtrl.text,
            gender: _gender!.name,
          ),
        );
  }
}
