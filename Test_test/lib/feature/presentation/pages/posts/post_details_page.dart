import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:test_test/common/colors.dart';
import 'package:test_test/feature/domin/entities/post_entity.dart';
import 'package:test_test/feature/presentation/state/provider/post_provider.dart';
import 'package:test_test/feature/presentation/state/redux/posts_redux/actions/user_action.dart';
import 'package:test_test/feature/presentation/state/redux/posts_redux/posts_state.dart';
import 'package:test_test/feature/presentation/widgets/shadow_container_widget.dart';

import '../../../../common/icons.dart';
import '../../../../common/textStyle.dart';
import '../notifications/notifications_page.dart';


class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostEntity? _postEntity = context.watch<PostProvider>().getPost;
    final Store<PostsState> store = StoreProvider.of<PostsState>(context);
    store.dispatch(GetUserThunkAction((_postEntity?.id)??1));
    return Scaffold(
      backgroundColor: mainColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            floating: true,
            leadingWidth:MediaQuery.of(context).size.width*0.07,
            iconTheme:IconThemeData(color: secondaryColor),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                          margin:const EdgeInsets.only(bottom: 10),
                          child: Text((_postEntity?.title)??"NonTitle", style: SFProDisplay(size: 23,style: Bold))
                      ),

                      ShadowContainer(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text((_postEntity?.body)??"NonBody",style: SFProDisplay(color: Color(0xFF575757),style: Medium,size: 14)),
                        )
                      ),

                      StoreConnector<PostsState,PostsState>(
                          converter: (store) =>store.state,
                          builder: (context, store) => store.widgetUser
                      )

                    ],
                  ),
                )
              ]
          ))
        ],
      ),
    );
  }
}
