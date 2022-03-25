import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_test/feature/domin/entities/post_entity.dart';
import 'package:test_test/feature/presentation/state/provider/post_provider.dart';
import 'package:test_test/feature/presentation/widgets/shadow_container_widget.dart';
import '../../../common/textStyle.dart';

class PostTabWidget extends StatelessWidget {
  final PostEntity postEntity;
  const PostTabWidget(this.postEntity,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
        child: TextButton(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width/1.4,
                  child: Text(postEntity.title, style: SFProDisplay(size: 15)),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFFD57800),
                  size: 20,
                )
              ],
            ),
          ),
          onPressed:(){
            context.read<PostProvider>().changePost(postEntity);
            Navigator.pushNamed(context, "/post_details");
          }
        )
    );
  }
}
