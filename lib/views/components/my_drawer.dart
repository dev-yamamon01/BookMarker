import 'package:bookmarker/views/components/webview_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:bookmarker/views/components/webview_full_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: MyColors.background,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
              ),
              padding: EdgeInsets.only(
                top: 60.h,
                bottom: 15.h,
                right: 16.w,
                left: 16.w
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Book Marker',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: MyColors.primary
                    ),
                  ),
                  SvgPicture.asset('assets/bookmark.svg', width: 60.w, height: 60.h)],
              )
          ),
          ListTile(
            leading: Icon(Icons.question_answer_outlined,size: 20.sp,),
            title: Text("問い合わせ",style: TextStyle(fontSize: 15.sp)),
            onTap: () {
              context.pushNamed('contactUs');
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_support,size: 20.sp,),
            title: Text("このアプリについて",style: TextStyle(fontSize: 15.sp),),
            onTap: () {
              context.pushNamed('aboutApp');
            },
          )
        ],
      ),
    );
  }
}
