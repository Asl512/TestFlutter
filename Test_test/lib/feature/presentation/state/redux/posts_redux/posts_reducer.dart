import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:test_test/feature/presentation/state/redux/posts_redux/actions/user_action.dart';
import 'package:test_test/feature/presentation/state/redux/posts_redux/posts_state.dart';
import 'package:test_test/feature/presentation/state/redux/posts_redux/actions/posts_action.dart';

PostsState postReducer(PostsState state, dynamic action){
  return PostsState(
    widgetPosts: _postReducer(state.widgetPosts,action),
    widgetUser: _userReducer(state.widgetUser,action),
  );
}

Reducer<Widget> _postReducer = combineReducers([
  TypedReducer<Widget,GetPostsWidgetAction>(_getPostWidgetAction),
]);

Reducer<Widget> _userReducer = combineReducers([
  TypedReducer<Widget,GetUserWidgetAction>(_getUserWidgetAction),
]);

Widget _getPostWidgetAction(Widget posts, GetPostsWidgetAction action) => action.widget;

Widget _getUserWidgetAction(Widget user, GetUserWidgetAction action) => action.widget;
