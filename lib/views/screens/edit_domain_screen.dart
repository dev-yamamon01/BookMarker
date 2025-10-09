import 'package:bookmarker/view_models/genre/genre_view_model.dart';
import 'package:bookmarker/views/screens/update_domain_screen.dart';
import 'package:flutter/material.dart';
import 'package:bookmarker/data/services/database.dart';
import 'package:bookmarker/views/screens/update_genre_screen.dart';
import 'package:bookmarker/utils/my_utils.dart';
import 'package:bookmarker/utils/my_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


final AppDatabase db = AppDatabase();

class EditDomainScreen extends ConsumerWidget {

  const EditDomainScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("ドメイン一括編集")),
      body: StreamBuilder<List<Domain>>(
        stream: db.select(db.domains).watch(), // 常に最新のデータを取得
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(color: MyColors.primary,));
          }

          final domains = snapshot.data!;

          return ListView.builder(
            itemCount: domains.length,
            padding: EdgeInsets.only(top: 10.h),
            itemBuilder: (context, index) {
              final domain = domains[index];
              return ListTile(
                title: Text(domain.domainName,style: TextStyle(fontSize: 15.sp),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        width: 20.w, // 横幅を制限
                        height: 20.h, // 高さを制限
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return UpdateDomainScreen(
                                    domain: domain,
                                  );
                                });
                          },
                          icon: Icon(Icons.edit,size: 20.sp,),
                          padding: EdgeInsets.zero,
                        )
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
