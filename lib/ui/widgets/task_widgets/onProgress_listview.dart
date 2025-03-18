import 'package:flutter/material.dart';

import 'onProgress_widget.dart';

class OnprogressListview extends StatelessWidget {
  const OnprogressListview({super.key, required this.isHorizontal});
  final bool isHorizontal;
  @override
  Widget build(BuildContext context) {
    return  isHorizontal ?   SizedBox(
      height: 220,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.white, Colors.transparent],
            stops: [0.6, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child:  ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return  const OnprogressTask();
            }
        ),
      ),
    ) :   SliverList(
        delegate:
               SliverChildBuilderDelegate((context, index){
       return const OnprogressTask();
    },
    childCount: 7
               )

    );

  }
}
