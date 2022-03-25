import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:test_test/common/colors.dart';
import 'package:test_test/common/icons.dart';
import 'package:test_test/feature/presentation/pages/notifications/notifications_page.dart';
import 'package:test_test/feature/presentation/pages/posts/post_details_page.dart';
import 'package:test_test/feature/presentation/state/provider/post_provider.dart';
import 'package:test_test/feature/presentation/state/redux/posts_redux/actions/posts_action.dart';
import 'package:test_test/feature/presentation/state/redux/posts_redux/posts_state.dart';
import 'package:test_test/feature/presentation/state/redux/posts_redux/posts_reducer.dart';
import 'package:test_test/feature/presentation/widgets/page_reload_widget.dart';
import 'package:test_test/feature/presentation/widgets/user_widgets/reload_user_widget.dart';
import '../../../../common/textStyle.dart';


class PostsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Store<PostsState> store = Store(
        postReducer,
        middleware: [thunkMiddleware],
        initialState: PostsState(
            widgetPosts: const PageReloadWidget('Redux error'),
            widgetUser: const UserReloadWidget()
           )
    );
    return ChangeNotifierProvider<PostProvider>(
      create: (context)=> PostProvider(),
      child: StoreProvider(
        store: store,
        child: MaterialApp(
          initialRoute: "/body",
          routes:
          {
            '/body': (context) =>  const Body(),
            '/post_details': (context) =>  PostDetailsPage(),
          },
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<PostsState> store = StoreProvider.of<PostsState>(context);
    store.dispatch(GetPostsThunkAction());

    return Scaffold(
      backgroundColor: mainColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            floating: true,
            backgroundColor: mainColor,
            title: Text("Posts",style:SFProDisplay(style: Bold,size: 23)),
            actions: [
              IconButton(
                onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsPage())),
                icon: iconNotification,
              )
            ],
          ),

          SliverList(delegate:SliverChildListDelegate(
              [
                StoreConnector<PostsState,PostsState>(
                    converter: (store) =>store.state,
                    builder: (context, store) => store.widgetPosts
                )
              ]
          ))
        ],
      ),
    );
  }
}