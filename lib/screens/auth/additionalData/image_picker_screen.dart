import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icon.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/models/response_model.dart';
import 'package:start_up_project/screens/auth/additionalData/loading_screen.dart';
import 'package:start_up_project/screens/auth/additionalData/weight_picker_screen.dart';
import 'package:start_up_project/utils/colors.dart';
import 'package:start_up_project/widgets/showAwesomeSnackBar.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../controllers/auth_controller.dart';


class ImagePickerScreen extends StatefulWidget {
  ImagePickerScreen({Key? key,required this.profileModel}) : super(key: key);
  NormalUserModel profileModel=NormalUserModel();


  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

bool valid=false;

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  UploadTask? uploadTask;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final ImagePicker picker = ImagePicker();
  File? _image;
  Future pickImage() async {
final image=await ImagePicker().pickImage(source: ImageSource.gallery);
  if(image==null) return;

  final imageTemporary=File(image.path);

  setState(() {
    this._image=imageTemporary;
  });

  }
  ini() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final allInfo = deviceInfo.data;
    print(allInfo['product']);
    print(deviceInfo);
  }
  @override
  Widget build(BuildContext context) {
    print(widget.profileModel.toJson().toString());
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.transparent,

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 1.sw,
            height: 1.sh,
            child:Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Text("Select your image .",

                        textAlign: TextAlign.center,
                        style: GoogleFonts.farro(
                            fontWeight: FontWeight.w400,
                            fontSize: 0.03.sh
                        ),),
                      SizedBox(height: 0.01.sh,),

                      SizedBox(height: 0.05.sh,),
                      GestureDetector(
                        onTap: () async {
                        pickImage();
                         },
                        child: CircleAvatar(
                          backgroundImage:_image!=null?FileImage(_image!):null ,

                          radius: 0.2.sw,
                          child:_image!=null?Container(): Icon(Iconsax.camera),
                        ),
                      )

                    ],
                  ),),
                Expanded(
                    flex: 1,
                    child: Container(


                    )
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () async {
                      if (_image!=null) {
                       /* Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreen(profileModel: widget.profileModel,
                          profileAdditionalInformationModel: widget.profileAdditionalInformationModel,
                        file: _image,
                        ),));*/
                     /*  var Im= await Get.find<AuthController>().uploadProfileImage(_image!,"94970085");
                        print(Im.message);*/
                    /*    var Im= await Get.find<AuthController>().uploadProfileImage(_image!,"94970082");
                        print(Im.message);*/
                        /*uploadFile(_image!,"94970082");*/
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreen(profileModel: widget.profileModel,
                          file: _image,
                        ),));

                      }else{

                        showAwesomeSnackBar(context, "No image selected","please select your profile image", Colors.purple, Colors.pink);
                      }
                    },
                    child: Container(

                      width: 0.9.sw,
                      height: 0.08.sh,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(child: Text("Next",style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.03.sh
                      ),)),
                    ),
                  ),
                )

              ],
            )

        ),
      ),

    );
  }
  Future uploadFile(File file, String name) async {
    if (file == null) return;
    final fileName = name;
    final destination = 'profileImages/';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('${fileName}/');
     uploadTask= ref.putFile(file!);
     final snapshot =await uploadTask!.whenComplete(() {

     });
     final urlDownload=await snapshot.ref.getDownloadURL();
     ResponseModel response= ResponseModel();
     response.message=urlDownload;
     response.errorCode="200";

     print("Download Link :$urlDownload");


    } catch (e) {
      print('error occurred');
    }
  }
}
