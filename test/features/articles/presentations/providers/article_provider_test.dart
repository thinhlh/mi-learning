import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/app/article/domain/usecases/get_articles_use_case.dart';
import 'package:mi_learning/app/article/presentation/providers/article_page_provider.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'article_provider_test.mocks.dart';

@GenerateMocks([GetArticlesUseCase])
void main() {
  late MockGetArticlesUseCase usecase;
  late ArticlePageProvider provider;

  setUp(() {
    usecase = MockGetArticlesUseCase();
    provider = ArticlePageProvider(usecase);
  });

  final List<Article> articles = [
    Article(
      id: 'id',
      author: 'author',
      title: 'title',
      thumbnail: 'thumbnail',
      createdAt: DateTime.now(),
      url: 'url',
      category: Category(
        id: 'id',
        title: 'title',
        background: 'background',
      ),
    )
  ];

  test('should forward the call to use case', () async {
    // arrange
    when(usecase.call(NoParams()))
        .thenAnswer((realInvocation) async => Right(articles));
    // act

    await provider.getArticles();
    //assert

    verify(usecase.call(NoParams())).called(1);
    verifyNoMoreInteractions(usecase);
  });

  test('should return Right of articles when usecase return articles',
      () async {
    // arrange
    when(usecase.call(NoParams()))
        .thenAnswer((realInvocation) async => Right(articles));
    // act

    final result = await provider.getArticles();
    //assert

    expect(result.isRight(), true);
    expect(result.foldRight([], (r, previous) => articles), articles);
  });
}
