import 'package:flutter/material.dart';
import '../components/novum_scaffold.dart';
import '../components/article_list_builder.dart';
import '../components/article_list_skeleton.dart';
import '../../models/article_collection_model.dart';
import '../../blocs/article_collection_bloc.dart';

class Browse extends StatelessWidget {

  Browse({
    this.title,
    this.category,
    this.tag,
  });

  final String title;
  final String category;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return NovumScaffold(
      title: title,
      body: StreamBuilder(
        stream: bloc.articles,
        builder: (BuildContext context, AsyncSnapshot<ArticleCollectionModel> snapshot) {
          if (snapshot.hasData) {
            return ArticleListBuilder(snapshot.data.articles);
          }
          bloc.fetchArticles(category: category ?? '');
          return ArticleListSkeleton();
        },
      ),
    );
  }

}