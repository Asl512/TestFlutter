import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:test_test/core/error/failure.dart';
import 'package:test_test/feature/data/repositories/posts_data_repository.dart';
import 'package:test_test/feature/domin/entities/post_entity.dart';
import 'package:test_test/feature/presentation/widgets/page_reload_widget.dart';
import 'package:test_test/feature/presentation/widgets/loading_widget.dart';
import 'package:test_test/feature/presentation/widgets/post_tab_widget.dart';

class GetPostsWidgetAction{
  final Widget widget;
  GetPostsWidgetAction({required this.widget});
}

ThunkAction GetPostsThunkAction() => (Store store)async{
  store.dispatch(GetPostsWidgetAction(widget: loadingWidget()));

  dynamic response = await PostsDataRepository().getAllPosts();

  if(response is Right<Failure, List<PostEntity>>){
    store.dispatch(GetPostsWidgetAction(widget: getPostsWidgets(response.right)));
  }else{
    store.dispatch(GetPostsWidgetAction(widget: errorWidgets(response.left.error)));
  }
};

Widget loadingWidget(){
  return const LoadingWidget();
}

Widget getPostsWidgets(List<PostEntity> posts){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
        children: posts.map((post) => PostTabWidget(post)).toList()
    ),
  );
}

Widget errorWidgets(String error){
  return PageReloadWidget(error);
}