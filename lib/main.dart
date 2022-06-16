import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appbar',
      home: MyPage(),
    );
  }
}

// MyPage
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0, // appbar 입체감 조절
        automaticallyImplyLeading: false,
        actions: [
          Builder(builder: (context) { //우측 아이콘에 drawer 적용
            return IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: SvgPicture.asset('./assets/icons/icon_menu.svg'));
          })
        ],
      ),
      endDrawer: Drawer( //right side drawer
        backgroundColor: Colors.blueAccent,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color> [
              const Color(0xFFFAE19F),
              const Color(0xFFFFC565),
            ]
          )),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
              // pubspec.yaml 파일에 assets 주석에 이미지 추가하기
              // UserAccountsDrawerHeader(
              //     currentAccountPicture: CircleAvatar(
              //       // 현재 계정 이미지 set
              //       child: SvgPicture.asset('./assets/icons/icon_profile.svg'),
              //       backgroundColor: Colors.white,
              //     ),
              //     accountEmail: Text('Loveit@email.com', style: TextStyle(color: Colors.black)),
              //     accountName: Text('아이좋아 홍길동 선생님', style: TextStyle(color: Colors.black)),
              //     decoration: BoxDecoration(
              //       color: Colors.red,
              //     )
              // ),
              Row(
                children: [
                  // Image(image: SvgPicture.asset('assets/icons/icon_profile.svg'),
                  //   width: 80,
                  // height: 79.54,)
                  SvgPicture.asset('assets/icons/icon_profile', width: 80, height: 79.54),
                  Column(
                    children: [
                      Text('Loveit@gmail.com'),
                      Text('아이좋아 홍길동 선생님')
                    ],
                  )
                ]
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(onPressed: () => print('find'),//검색
                          icon: SvgPicture.asset('./assets/icons/icon_find_mobile.svg')),
                      Text('검색')
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: () => print('setting'),
                          icon: SvgPicture.asset('./assets/icons/icon_setting.svg')),
                      Text('설정')
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: () {
                      },
                          icon: SvgPicture.asset('./assets/icons/icon_logout_mobile.svg')),

                      Text('로그아웃')
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 30.0,
              ),

              ListTile(
                title: Text('아이생활'),
                onTap: () => Scaffold(),
                trailing: Icon(Icons.arrow_drop_down),
              ),

              ListTile(
                title: Text('아이놀이'),
                onTap: () {
                  print('아이놀이');
                },
                trailing: Icon(Icons.arrow_drop_down),
              ),
              ListTile(
                title: Text('계정관리'),
                onTap: () {
                  print('계정관리');
                },
                trailing: Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
