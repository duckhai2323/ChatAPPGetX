import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasechat/comcom/store/storage.dart';
import 'package:get/get.dart';

class UserData {
  final String? id;
  final String? name;
  final String? email;
  final String? photourl;
  final String? location;
  final String? fcmtoken;
  final Timestamp? addtime;

  UserData({this.id, this.name, this.email, this.photourl, this.location,
      this.fcmtoken, this.addtime});

  factory UserData.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
   final data = snapshot.data();
    return UserData(
      id:data?['id'],
      name:data?['name'],
      email:data?['email'],
      photourl:data?['photourl'],
      location:data?['location'],
      fcmtoken:data?['fcmtoken'],
      addtime:data?['addtime'],
    );
  }

  Map<String,dynamic> toFirestore(){
    return{
      if(id!=null) "id" :id,
      if(name!=null) "name" :name,
      if(email!=null) "email" :email,
      if(photourl!=null) "photourl" :photourl,
      if(location!=null) "location" :location,
      if(fcmtoken!=null) "fcmtoken" :fcmtoken,
      if(addtime!=null) "addtime" :addtime,
    };
  }
}

class UserLoginResponseEnity{
  String? accessToken;
  String? displayName;
  String? email;
  String? photoUrl;
  UserLoginResponseEnity({
      this.accessToken,
      this.displayName,
      this.email,
      this.photoUrl});

  factory UserLoginResponseEnity.fromJson(Map<String,dynamic>json) =>
      UserLoginResponseEnity(
        accessToken:json["access_token"],
        displayName:json["display_name"],
        email:json["email"],
        photoUrl:json["photoUrl"],
      );

  Map<String,dynamic> toJson()=>{
    "access_token" :accessToken,
    "display_name":displayName,
    "email":email,
    "photoUrl":photoUrl,
  };
}

class UserStore extends GetxController{
  static const STORAGE_USER_TOKEN_KEY = "userkey";
  static const STORAGE_USER_PROFILE_KEY = "profilekey";
  static UserStore get to => Get.find();
  final _isLogin = false.obs;
  String token = '';
  final _profile = UserLoginResponseEnity().obs;

  bool get isLogin => _isLogin.value;
  UserLoginResponseEnity get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit(){
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    var profileOffline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    if(profileOffline.isNotEmpty){
      _isLogin.value = true;
      _profile(UserLoginResponseEnity.fromJson(jsonDecode(profileOffline)));
    }
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
  }

  Future<String> getProfile() async {
    if(token.isEmpty) return "";
    return StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
  }

  Future<void> saveProfile(UserLoginResponseEnity profile) async{
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
    setToken(profile.accessToken!);
  }

  Future<void> onLogout() async {
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    await StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
    _isLogin.value = false;
  }
}