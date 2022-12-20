import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_learning/app/article/data/datasources/article_remote_data_source.dart';
import 'package:mi_learning/app/article/data/repositories/article_repository_impl.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'article_repository_impl_test.mocks.dart';

@GenerateMocks([ArticleRemoteDataSource])
void main() {
  late ArticleRepositoryImpl repository;
  late MockArticleRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockArticleRemoteDataSource();
    repository = ArticleRepositoryImpl(remoteDataSource);
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

  test('should forward the call to remote data source', () async {
    // arrange
    when(remoteDataSource.getArticles())
        .thenAnswer((realInvocation) async => Right(articles));
    // act

    await repository.getArticles();
    //assert
    verify(remoteDataSource.getArticles()).called(1);
    verifyNoMoreInteractions(remoteDataSource);
  });

  test(
      'should return right of articles when remote data source return articles',
      () async {
    // arrange
    when(remoteDataSource.getArticles())
        .thenAnswer((realInvocation) async => Right(articles));
    // act

    final result = await repository.getArticles();
    //assert
    expect(result.isRight(), true);
    expect(result.foldRight([], (r, previous) => articles), articles);
  });
}
