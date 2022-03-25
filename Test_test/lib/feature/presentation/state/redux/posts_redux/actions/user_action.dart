import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:test_test/core/error/failure.dart';
import 'package:test_test/feature/data/repositories/user_data_repository.dart';
import 'package:test_test/feature/domin/entities/user/user_entity.dart';
import 'package:test_test/feature/presentation/widgets/user_widgets/loading_user_widget.dart';
import 'package:test_test/feature/presentation/widgets/user_widgets/not_user_widget.dart';
import 'package:test_test/feature/presentation/widgets/user_widgets/reload_user_widget.dart';
import 'package:test_test/feature/presentation/widgets/user_widgets/user_widget.dart';

class GetUserWidgetAction{
  final Widget widget;
  GetUserWidgetAction({required this.widget});
}

ThunkAction GetUserThunkAction(int id){
 return (Store store)async{
   store.dispatch(GetUserWidgetAction(widget: loadingWidget()));

   dynamic response = await UserDataRepository(id: id).getUser();

   if(response is Right<Failure, UserEntity?>){
     if(response.right == null){
       store.dispatch(GetUserWidgetAction(widget: emptyUser()));
     }else{
       store.dispatch(GetUserWidgetAction(widget: getUserWidgets(response.right)));
     }
   }else{
     store.dispatch(GetUserWidgetAction(widget: errorWidgets()));
   }
 };
}

Widget loadingWidget(){
  return const LoadingUserWidget();
}

Widget getUserWidgets(UserEntity? user){
  return UserWidget(
      margin: EdgeInsets.only(top: 10),
      user: user
  );
}

Widget errorWidgets(){
  return const UserReloadWidget();
}

Widget emptyUser(){
  return const NotUserWidget();
}