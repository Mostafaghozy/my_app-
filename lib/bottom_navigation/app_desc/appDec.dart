import 'package:flutter/material.dart';

class AppDesc extends StatelessWidget {
  const AppDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(
        "App Desc",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,

    ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "سهولة الاستخدام: يتميز التطبيق بواجهة مستخدم بسيطة وسهلة الاستخدام، مما يسمح للمستخدمين بالتنقل بين الأقسام المختلفة والعثور على المنتجات التي يبحثون عنها بكل سهولة.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "يضم التطبيق مجموعة واسعة من المنتجات القيمه  من مختلف الفئات، مما يتيح للمستخدمين الاختيار من بين آلاف الخيارات",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "كيفية استخدام التطبيق",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              " يبدأ المستخدم بتسجيل حساب جديد عبر إدخال معلوماته الشخصية، مثل البريد الإلكتروني وكلمة المرور",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("يمكن للمستخدم تصفح المنتجات عبر الأقسام المختلفة",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          /*TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("POP")),*/
        ],
      ),
    );
  }
}
