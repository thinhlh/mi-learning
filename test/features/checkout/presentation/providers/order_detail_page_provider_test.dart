import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/checkout_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_basic_user_info_use_case.dart';
import 'package:mi_learning/app/order_detail/presentation/providers/order_detail_page_provider.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'order_detail_page_provider_test.mocks.dart';

@GenerateMocks([CheckoutUseCase, GetBasicUserInfoUseCase])
void main() {
  late MockGetBasicUserInfoUseCase getBasicUserInfoUseCase;
  late MockCheckoutUseCase checkoutUseCase;
  late OrderDetailPageProvider provider;

  setUp(() {
    getBasicUserInfoUseCase = MockGetBasicUserInfoUseCase();
    checkoutUseCase = MockCheckoutUseCase();
    provider = OrderDetailPageProvider(
      getBasicUserInfoUseCase,
      checkoutUseCase,
    );
  });

  const String courseId = 'courseId';
  final CheckoutParam params = CheckoutParam(courseId);

  group('Checkout', () {
    test('should forward the call to use case', () async {
      // arrange
      when(checkoutUseCase(params))
          .thenAnswer((realInvocation) async => const Right(true));
      // act

      await provider.checkout(params);
      //assert

      verify(checkoutUseCase(params)).called(1);
      verifyNoMoreInteractions(checkoutUseCase);
    });

    test('should return Right of true when checkout success', () async {
      // arrange
      when(checkoutUseCase(params))
          .thenAnswer((realInvocation) async => const Right(true));
      // act

      final result = await provider.checkout(params);
      //assert

      expect(result.isRight(), true);
      expect(result.foldRight(true, (r, previous) => true), true);
    });

    test('should return failure when checkout failed', () async {
      // arrange
      when(checkoutUseCase(params))
          .thenAnswer((realInvocation) async => Left(Failure()));
      // act
      final result = await provider.checkout(params);
      //assert

      expect(result.isLeft(), true);
    });
  });
}
