import 'package:dio/dio.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/interceptor/api_interceptor.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/meal/data/models/index.dart';

abstract interface class MealRemoteDataSource {
  Future<UserMealPlanResponseModel> getChildList({
    String? next,
    String? previous,
  });
  Future<UserMealPlanCreationModel> createChildHealthForm({
    required String birthdate,
    required String height,
    required String weight,
    required String gender,
    required String name,
  });
  Future<UserMealPlanDetailModel> getChildMealPlanDetail({
    required String userMealPlanId,
    required String mealPlanId,
  });

  Future<String> updateDayMealCompletionComplete({
    required int id,
    required bool isCompleted,
  });
  Future<String> deleteUserMealPlan(int id);
}

class MealRemoteDataSourceImpl implements MealRemoteDataSource {
  final apiInstance = ApiInterceptor.apiInstance();
  final baseUrl = EnvService.get('API_URL');

  @override
  Future<UserMealPlanResponseModel> getChildList({
    String? next,
    String? previous,
  }) async {
    String url = '$baseUrl/api/meal/plan/child/list';

    try {
      final response = await apiInstance.get(next ?? previous ?? url);
      return UserMealPlanResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserMealPlanCreationModel> createChildHealthForm({
    required String birthdate,
    required String height,
    required String weight,
    required String gender,
    required String name,
  }) async {
    String url = '$baseUrl/api/meal/plan/child/register';

    try {
      final data = {
        "height": height,
        "birthdate": birthdate,
        "weight": weight,
        "gender": gender,
        "name": name,
      };

      final response = await apiInstance.post(url, data: data);
      return UserMealPlanCreationModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserMealPlanDetailModel> getChildMealPlanDetail({
    required String userMealPlanId,
    required String mealPlanId,
  }) async {
    String url =
        '$baseUrl/api/meal/plan/child/detail/$userMealPlanId/meal-plan/$mealPlanId/';

    try {
      final response = await apiInstance.get(url);
      return UserMealPlanDetailModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> updateDayMealCompletionComplete(
      {required int id, required bool isCompleted}) async {
    String url = '$baseUrl/api/meal/plan/child/complete/$id';

    try {
      final data = {"completed": isCompleted};
      await apiInstance.patch(url, data: data);
      return "Successfully completed!";
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> deleteUserMealPlan(int id) async {
    String url = '$baseUrl/api/meal/plan/child/delete/$id';

    try {
      await apiInstance.delete(url);
      return "Successfully deleted!";
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
