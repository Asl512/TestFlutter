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
  TypedReducer<Widget,GetPostsWidgetAction>(_getPostWidgetReducer),
]);

Reducer<Widget> _userReducer = combineReducers([
  TypedReducer<Widget,GetUserWidgetAction>(_getUserWidgetReducer),
]);

Widget _getPostWidgetReducer(Widget posts, GetPostsWidgetAction action) => action.widget;

Widget _getUserWidgetReducer(Widget user, GetUserWidgetAction action) => action.widget;
