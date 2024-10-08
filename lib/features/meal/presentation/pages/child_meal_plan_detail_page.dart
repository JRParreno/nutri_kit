// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/core/common/widgets/loader.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/child_health_list/child_health_list_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/blocs/meal_plan_detail/meal_plan_detail_bloc.dart';
import 'package:nutri_kit/features/meal/presentation/widgets/meal_plan/index.dart';
import 'package:nutri_kit/gen/colors.gen.dart';
import 'package:quickalert/quickalert.dart';

class ChildMealPlanDetailPage extends StatefulWidget {
  const ChildMealPlanDetailPage({
    super.key,
    required this.userMealPlanId,
    required this.mealPlanId,
    this.isCreated = false,
    this.healthStatusInfos,
  });

  final String userMealPlanId;
  final String mealPlanId;
  final bool isCreated;
  final List<String>? healthStatusInfos;

  @override
  State<ChildMealPlanDetailPage> createState() =>
      _ChildMealPlanDetaiPageState();
}

class _ChildMealPlanDetaiPageState extends State<ChildMealPlanDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<MealPlanDetailBloc>().add(
          GetMealPlanDetailEvent(
            mealPlanId: widget.mealPlanId,
            userMealPlanId: widget.userMealPlanId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary,
      appBar: AppBar(
        title: const Text(
          'Meal Plan',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: handleOnTapDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: BlocConsumer<MealPlanDetailBloc, MealPlanDetailState>(
        listener: blocListener,
        builder: (context, state) {
          if (state is MealPlanDetailFailure) {
            return const Center(
              child: Text(
                'Something went wrong in our server, please try again later.',
              ),
            );
          }

          if (state is MealPlanDetailSuccess) {
            return MealPlanBody(
              data: state,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  void onPageError(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: message,
      );
    });
  }

  void onPageSuccess(String message) {
    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.warning,
        title: 'Health Status',
        text: message,
      );
    });
  }

  void blocListener(BuildContext context, MealPlanDetailState state) {
    if (state is MealPlanDetailLoading) {
      LoadingScreen.instance().show(context: context);
    }

    if (state is MealPlanDetailSuccess ||
        state is MealPlanDetailFailure ||
        state is MealPlanDetailDelete) {
      Future.delayed(const Duration(milliseconds: 500), () {
        LoadingScreen.instance().hide();
      });
    }

    if (state is MealPlanDetailSuccess && widget.isCreated) {
      if (!state.isUpdatingValue) {
        String message = 'Your child is ';
        final healthStatusInfos = widget.healthStatusInfos;
        if (healthStatusInfos != null && healthStatusInfos.length > 1) {
          message += '${healthStatusInfos[0]} and ${healthStatusInfos[1]}';
        } else {
          message += state.userMealPlanDetailEntity.userMealPlan.healthStatus;
        }

        if (message.contains('obese') || message.contains('overweight')) {
          message +=
              '\nNote: Your child is overweight or obese. Consult a Nutritionist or Dietitian for proper guidance.';
        }
        onPageSuccess(message);
      }
    }

    if (state is MealPlanDetailDelete) {
      onDeleteSuccess(state.message);
    }

    if (state is MealPlanDetailFailure) {
      onPageError(state.message);
    }
  }

  void handleOnTapDelete() {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
        text: 'You want to delete this child health progress?',
        confirmBtnText: 'Yes',
        cancelBtnText: 'No',
        confirmBtnColor: Colors.red,
        onConfirmBtnTap: () {
          context.pop();
          Future.delayed(const Duration(milliseconds: 300), () {
            context.read<MealPlanDetailBloc>().add(
                  DeleteUserMealPlanEvent(
                    int.parse(widget.userMealPlanId),
                  ),
                );
          });
        });
  }

  void onDeleteSuccess(String message) {
    context.read<ChildHealthListBloc>().add(OnGetChildHealthListEvent());

    Future.delayed(const Duration(milliseconds: 600), () {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Delete Child',
        text: message,
        onConfirmBtnTap: () {
          context.pop();
          Future.delayed(const Duration(milliseconds: 300), () {
            context.pop();
          });
        },
      );
    });
  }
}
