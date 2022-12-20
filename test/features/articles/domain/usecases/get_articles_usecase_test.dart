import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/app/article/domain/repositories/article_repository.dart';
import 'package:mi_learning/app/article/domain/usecases/get_articles_use_case.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_articles_usecase_test.mocks.dart';

@GenerateMocks([ArticleRepository])
void main() {
  late GetArticlesUseCase getArticlesUseCase;
  late MockArticleRepository repository;

  setUp(() {
    repository = MockArticleRepository();
    getArticlesUseCase = GetArticlesUseCase(repository);
  });

  final List<Article> articles = [
    Article(
      id: 'id',
      author: 'author',
      title: 'title',
      thumbnail: 'thumbnail',
      createdAt: DateTime.now(),
      url: 'url',
      category: Category(id: 'id', title: 'title', background: 'background'),
    )
  ];

  test('should forward the call to repository', () async {
    // arrange
    when(repository.getArticles())
        .thenAnswer((realInvocation) async => Right(articles));
    // act
    await getArticlesUseCase.call(NoParams());
    //assert
    verify(repository.getArticles()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return Right of articles when calling get articles', () async {
    // arrange
    when(repository.getArticles())
        .thenAnswer((realInvocation) async => Right(articles));
    // act
    final result = await getArticlesUseCase.call(NoParams());
    //assert

    expect(result.isRight(), true);
    expect(result.foldRight([], (r, previous) => articles), articles);
  });
}
