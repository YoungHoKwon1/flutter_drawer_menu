import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../a_main/a1.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//AppBar
class MenuAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<MenuAppBar> createState() => _MenuAppBarState();

  //
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
}

class _MenuAppBarState extends State<MenuAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0, // appbar 입체감 조절
      automaticallyImplyLeading: false,
      actions: [
        Builder(builder: (context) {
          //우측 아이콘에 drawer 적용
          return IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: SvgPicture.asset('./assets/icons/icon_menu.svg'));
        })
      ],
    );
  }
}

//Drawer
class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  static final autoLoginStorage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      //right side drawer
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30)
            ),

            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xFFFAE19F),
                  Color(0xFFFFC565),
                ]
            )
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Row(children: [
              Container(//profile
                  color: Colors.white,// 사이즈확인용
                  margin: EdgeInsets.fromLTRB(34, 47, 0, 0),
                  child: SvgPicture.asset('assets/icons/icon_setting.svg',
                      width: 80, height: 79.54)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(//email
                    margin: EdgeInsets.fromLTRB(20, 77, 0, 0),
                    child:
                    Text('Loveit@gmail.com', style: TextStyle(fontSize: 14)),
                  ),

                  Container(//name
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text('아이좋아 홍길동 선생님', style: TextStyle(fontSize: 14)),
                  )
                ],
              )
            ]),
            Container(
              margin: EdgeInsets.fromLTRB(31.5, 47.98, 0, 0),
              child: Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () => print('find'), //검색
                          icon: SvgPicture.asset(
                              './assets/icons/icon_find_mobile.svg', width: 55.32, height: 51.71)),
                      Container(
                          margin: EdgeInsets.only(top: 8.77),
                          child: Text('검색', style: TextStyle(fontSize: 16)))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 45.03),
                    child: Column(
                      children: [
                        IconButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () => print('setting'),
                            icon: SvgPicture.asset(
                                './assets/icons/icon_setting.svg', width: 40, height: 40)),
                        Container(
                            margin: EdgeInsets.only(top: 8.77),
                            child: Text('설정', style: TextStyle(fontSize: 16)))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 53.35),
                    child: Column(
                      children: [
                        IconButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                            //   autoLoginStorage.delete(key: "login");
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (context) => A1()));
                             },
                            icon: SvgPicture.asset(
                                './assets/icons/icon_logout_mobile.svg',width: 38.61, height: 40)),
                        Container(
                            margin: EdgeInsets.only(top: 8.77),
                            child: Text('로그아웃', style: TextStyle(fontSize: 16)))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 46.0,
            ),
            ListTile(
              title: Text('아이생활'),
              onTap: () => ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                      title: Text('asdf'),
                      onTap: () => print('asdf')
                  ),

                ],
              ),
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
    );
  }
}

/*endDrawer: Drawer( //right side drawer
        backgroundColor: Colors.amber[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
            // pubspec.yaml 파일에 assets 주석에 이미지 추가하기
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  // 현재 계정 이미지 set
                  child: SvgPicture.asset('./assets/icons/icon_profile.svg'),
                  backgroundColor: Colors.white,
                ),
                accountEmail: Text('Loveit@email.com', style: TextStyle(color: Colors.black)),
                accountName: Text('아이좋아 홍길동 선생님', style: TextStyle(color: Colors.black)),
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                )
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
                      autoLoginStorage.delete(key: "login");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => A1())
                      );
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
      ),*/
