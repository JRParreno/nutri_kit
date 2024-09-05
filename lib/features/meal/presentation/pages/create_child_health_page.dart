import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/core/enum/gender.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/child_health_list/child_health_list_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/create_child_health_form/create_child_health_form_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/widgets/user_child_list/stepper_text_field.dart';
import 'package:nutri_kit/router/index.dart';
import 'package:quickalert/quickalert.dart';

class CreateChildHealthPage extends StatefulWidget {
  const CreateChildHealthPage({super.key});

  @override
  State<CreateChildHealthPage> createState() => _CreateChildHealthPageState();
}

class _CreateChildHealthPageState extends State<CreateChildHealthPage> {
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  int _index = 0;
  Gender _gender = Gender.male;
  final _heightCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _fullNameCtrl = TextEditingController();
  final _birthdateCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _heightCtrl.text = '82';
    _weightCtrl.text = '10';
    _fullNameCtrl.text = 'juan';
    _birthdateCtrl.text = '09/04/2022';
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
      appBar: AppBar(
        title: const Text(
          'Create Child Health Form',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
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

            context.replaceNamed(
              AppRoutes.chidlMealPlanDetailPage.name,
              pathParameters: {
                "mealPlanId": state.userMealPlanCreationEntity.mealplanId,
                "userMealPlanId":
                    state.userMealPlanCreationEntity.usermealplanId,
                "isCreated": "true",
              },
            );
            return;
          }

          if (state is CreateChildHealthFormFailure) {
            onFormError(state.message);
          }
        },
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Stepper(
              physics: const NeverScrollableScrollPhysics(),
              controlsBuilder: (context, details) {
                return Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: details.onStepContinue,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Rounded corners
                        ),
                      ),
                      child: Text(
                        _index == getSteps().length - 1 ? "Submit" : "Next",
                        style: const TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Gap(20),
                    if (_index == getSteps().length - 1)
                      TextButton(
                        onPressed: details.onStepCancel,
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red, // Background color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8), // Padding
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                        child: const Text(
                          "Previous",
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
                );
              },
              currentStep: _index,
              onStepCancel: () {
                setState(() {
                  _index -= 1;
                });
              },
              onStepContinue: () {
                if (_index == 5) {
                  handleSubmitForm();
                  return;
                }

                if ((_index == 0 || _index == 5 || _index == 6) ||
                    _validate()) {
                  setState(() {
                    _index += 1;
                  });
                }
              },
              onStepTapped: (int index) {
                setState(() {
                  _index = index;
                });
              },
              steps: getSteps(),
            ),
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() {
    final greyColor = Colors.black.withOpacity(0.5);

    return <Step>[
      Step(
        state: _index > 0 ? StepState.complete : StepState.indexed,
        stepStyle: StepStyle(
          color: greyColor,
        ),
        title: Text(
          'Gender',
          style: TextStyle(
            color: greyColor,
          ),
        ),
        content: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              RadioListTile<Gender>(
                title: Text(
                  'Male',
                  style: TextStyle(
                    color: greyColor,
                  ),
                ),
                enableFeedback: false,
                activeColor: greyColor,
                value: Gender.male,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value ?? Gender.male;
                  });
                },
              ),
              RadioListTile<Gender>(
                enableFeedback: false,
                activeColor: greyColor,
                title: Text(
                  'Female',
                  style: TextStyle(
                    color: greyColor,
                  ),
                ),
                value: Gender.female,
                groupValue: _gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value ?? Gender.female;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      Step(
        state: _index > 1 ? StepState.complete : StepState.indexed,
        stepStyle: StepStyle(
          color: greyColor,
        ),
        title: Text(
          'Height',
          style: TextStyle(
            color: greyColor,
          ),
        ),
        content: Form(
          key: _formKeys[0],
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: StepperTextField(
              keyboardType: TextInputType.number,
              controller: _heightCtrl,
              hintText: 'Height in CM',
            ),
          ),
        ),
      ),
      Step(
        state: _index > 2 ? StepState.complete : StepState.indexed,
        stepStyle: StepStyle(
          color: greyColor,
        ),
        title: Text(
          'Weight',
          style: TextStyle(
            color: greyColor,
          ),
        ),
        content: Form(
          key: _formKeys[1],
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: StepperTextField(
              keyboardType: TextInputType.number,
              controller: _weightCtrl,
              hintText: 'Weight in Kg',
            ),
          ),
        ),
      ),
      Step(
        state: _index > 3 ? StepState.complete : StepState.indexed,
        stepStyle: StepStyle(
          color: greyColor,
        ),
        title: Text(
          'Birthdate',
          style: TextStyle(
            color: greyColor,
          ),
        ),
        content: Form(
          key: _formKeys[2],
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: handleOnTapBirthdate,
              child: StepperTextField(
                enabled: false,
                keyboardType: TextInputType.number,
                controller: _birthdateCtrl,
                hintText: 'MM/DD/YYYY',
              ),
            ),
          ),
        ),
      ),
      Step(
        state: _index > 4 ? StepState.complete : StepState.indexed,
        stepStyle: StepStyle(
          color: greyColor,
        ),
        title: Text(
          "Child's Name",
          style: TextStyle(
            color: greyColor,
          ),
        ),
        content: Form(
          key: _formKeys[3],
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: StepperTextField(
              controller: _fullNameCtrl,
              hintText: 'Full name',
            ),
          ),
        ),
      ),
      Step(
        state: _index > 5 ? StepState.complete : StepState.indexed,
        stepStyle: StepStyle(
          color: greyColor,
        ),
        title: Text(
          "Complete",
          style: TextStyle(
            color: greyColor,
          ),
        ),
        content: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gender: ${_gender.name.toUpperCase()}',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 17,
                ),
              ),
              Text(
                'Height: ${_heightCtrl.text}cm',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 17,
                ),
              ),
              Text(
                'Weight: ${_weightCtrl.text}kg',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 17,
                ),
              ),
              Text(
                'Birthdate: ${_birthdateCtrl.text}',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 17,
                ),
              ),
              Text(
                "Child's Name: ${_fullNameCtrl.text}",
                style: TextStyle(
                  color: greyColor,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  bool _validate() {
    // this method is called on null
    if (_index > 0 && _index <= 4) {
      final form = _formKeys[_index - 1].currentState;
      if (form!.validate()) {
        return true;
      }
    }

    return false;
  }

  void handleOnTapBirthdate() async {
    final birthdate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
    );

    if (birthdate != null) {
      _birthdateCtrl.text = DateFormat.yMd().format(birthdate);
    }
  }

  void onFormError(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: message,
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
            gender: _gender.name,
          ),
        );
  }
}
