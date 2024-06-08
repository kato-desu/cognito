
import 'package:flutter/material.dart';
import 'apprication/config/auth.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';


void main() {
  


  runApp(const MyApp());



}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {


  String _text = '';




 

//}


/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              final post = _posts[index];
              return ListTile(
                leading: badges.Badge(
                            child: Icon(Icons.account_circle)),
                title: Text(post['title']),
                //subtitle: Text(post['id']),
              );
            },
          ),
        ),
      ),
    );
  }
*/
  String userEmail = 'okakatsunamayo@gmail.com';
  String userPassword = 'Ringo_11223344';
  //String userName = 'yume';

	// ユーザ属性リストの生成
  final userAttributes = [
  AttributeArg(name: 'name', value: 'Bob'),
  //AttributeArg(name: 'last_name', value: 'Wong'),
  ];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child:Column(
            children: [
              ElevatedButton(
                child: const Text("新規登録"),
                onPressed: () async {
                  try {
                    CognitoUserPoolData cognitoUserPoolData = await cognitoUserPool.signUp(
                      'okakatsunamayo@gmail.com',
                      'Ringo_11223344',
                      userAttributes: userAttributes,
                    );
                  } on CognitoClientException catch (e) {
                    print(e);
                  }
                }
              ),

              ElevatedButton(
                onPressed: () async{
                  CognitoUser cognitoUser = CognitoUser(userEmail, cognitoUserPool);
                  final authenticationDetails = AuthenticationDetails(username: userEmail, password: userPassword);
                  try {
                    final cognitoUserSession = await cognitoUser.authenticateUser(authenticationDetails);
                    // 以下の3つは必要に応じて使ってください.
                    final refreshToken = cognitoUserSession?.getRefreshToken()?.token;
                    final idToken = cognitoUserSession?.getIdToken().jwtToken;
                    final accessToken = cognitoUserSession?.getAccessToken().jwtToken;
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text("ログイン"),
              ),
            ],
          ),
        )
      ),
    );
  }
  
}