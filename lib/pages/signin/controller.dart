import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasechat/comcom/entities/user.dart';
import 'package:firebasechat/comcom/routes/names.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

GoogleSignIn _googleSigin = GoogleSignIn(
  scopes: <String>[
    'openid'
  ]
);

class SignInController extends GetxController{
  SignInController();
  final db = FirebaseFirestore.instance;
  Future<void> handleSignIn() async {
    try{
      var user = await _googleSigin.signIn();
      if(user!=null){

        /*final gAuthentication = await user.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: gAuthentication.idToken,
          accessToken: gAuthentication.accessToken
        );

        await FirebaseAuth.instance.signInWithCredential(credential);*/


        String displayName = user.displayName??user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl??"";
        UserLoginResponseEnity userProfile = UserLoginResponseEnity();
        userProfile.email = email;
        userProfile.accessToken = id;
        userProfile.displayName = displayName;
        userProfile.photoUrl = photoUrl;

        UserStore.to.saveProfile(userProfile);
        var userbase = await db.collection('users').withConverter(
          fromFirestore: UserData.fromFirestore,
          toFirestore: (UserData userdata, options)=>userdata.toFirestore(),
        ).where("id",isEqualTo: id).get();
        if(userbase.docs.isEmpty){
          final data = UserData (
            id:id,
            name:displayName,
            email:email,
            photourl: photoUrl,
            location:"",
            fcmtoken:"",
            addtime:Timestamp.now()
          );

            await db.collection('users').withConverter(
            fromFirestore: UserData.fromFirestore,
            toFirestore: (UserData userdata, options)=>userdata.toFirestore(),
          ).add(data);
        }
        Fluttertoast.showToast(msg: "login cuccess");
        //await _googleSigin.signOut();
        Get.offAndToNamed(AppRoutes.Application);
      }
    } catch(e){
      Fluttertoast.showToast(msg: "login error");
      print(e);
    }
  }

  @override
  void onReady(){
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user){
      if(user == null){
        print("user is currently logged out");
      }else {
        print("user is logged in");
      }
    });
  }
}