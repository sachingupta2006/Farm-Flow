import 'dart:io';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:farmfeeders/Utils/colors.dart';
import 'package:farmfeeders/common/custom_appbar.dart';
import 'package:farmfeeders/common/custom_button_curve.dart';
import 'package:farmfeeders/Utils/sized_box.dart';
import 'package:farmfeeders/Utils/texts.dart';
import 'package:farmfeeders/common/CommonTextFormField.dart';
import 'package:farmfeeders/view/NotificationSettings.dart';
// import 'package:farmfeeders/view/Settings.dart';
import 'package:farmfeeders/view/videoplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../Utils/networkPlayer.dart';

String longVideo =
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

String video480 =
    "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_10mb.mp4";

String video240 =
    "https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_10mb.mp4";
    
class EditVideos extends StatefulWidget {
  const EditVideos({super.key});

  @override
  State<EditVideos> createState() => _EditVideosState();
}

class _EditVideosState extends State<EditVideos> {
  TextEditingController phoneController = TextEditingController();
  // late CustomVideoPlayerWebController _customVideoPlayerWebController;
  // late CustomVideoPlayerController _customVideoPlayerController;
  // late VideoPlayerController _videoPlayerController,
  //     _videoPlayerController2,
  //     _videoPlayerController3;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings();

  final CustomVideoPlayerWebSettings _customVideoPlayerWebSettings =
      CustomVideoPlayerWebSettings(
    src: longVideo,
  );

  late VideoPlayerController videoController;

  bool state = false;
  XFile? file;
  // video

  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool videoControllerSet = false;

  setVideoPlayerController() async {
        videoController = await VideoPlayerController.file(File(file!.path))
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => videoController.pause());

      print("videoController $videoController");

      // videoControllerSet = true;
      setState(() {
        videoControllerSet = true;
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // videoController = VideoPlayerController.file(File(file!.path))
    //   ..addListener(() => setState(() {}))
    //   ..setLooping(true)
    //   ..initialize().then((_) => videoController.pause());

       videoController = VideoPlayerController.network(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => videoController.pause());

      print("videoController $videoController");

    // _videoPlayerController = VideoPlayerController.network(
    //   longVideo,
    // )..initialize().then((value) => setState(() {}));
    // _videoPlayerController2 = VideoPlayerController.network(video240);
    // _videoPlayerController3 = VideoPlayerController.network(video480);
    // _customVideoPlayerController = CustomVideoPlayerController(
    //   context: context,
    //   videoPlayerController: _videoPlayerController,
    //   customVideoPlayerSettings: _customVideoPlayerSettings,
    //   additionalVideoSources: {
    //     "240p": _videoPlayerController2,
    //     "480p": _videoPlayerController3,
    //     "720p": _videoPlayerController,
    //   },
    // );

    // _customVideoPlayerWebController = CustomVideoPlayerWebController(
    //   webVideoPlayerSettings: _customVideoPlayerWebSettings,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: customAppBar(text: "Add Videos"),

        // backgroundColor: Color(0xFFF5F8FA),
        elevation: 0,
        // shadowColor: Colors.black,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  
                  // Lottie.asset(
                  //   "assets/lotties/EditVideos.json",
                  //   width: 200.w,
                  //   height: 200.w,
                  // ),

                  // Container(
                  //   height: 230.h,
                  //   color: AppColors.greyMed,
                  // ),

                  // SizedBox(
                  //   width: 270.w,
                  //   child: textBlack16W5000(
                  //     "Please enter your phone number to receive a verification code.",
                  //   ),
                  // ),


                  // sizedBoxHeight(35.h),
                  file == null 
                  ? InkWell(
                    onTap: (){
                      builduploadprofile(true);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 185.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.buttoncolour,
                          width: 2.h
                        ),
                        borderRadius: BorderRadius.circular(27.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                        color: AppColors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/upload.svg",
                            height: 48.h,
                            width: 48.h,
                          ),
                  
                          sizedBoxHeight(18.h),
                  
                          SizedBox(
                            width: 255.w,
                            child: textBlack18W700Center("Browse to choose a video")
                          )
                        ],
                      ),
                    ),
                  ) :  
                  // InkWell(
                  //   onTap: (){
                  //     Get.to(()=> NewVideoplayer(file: file,) );
                  //   },
                  //   child: Text("preview")
                  // ),
                  Builder(
                    builder: (context) {
                      // setVideoPlayerController();
                      if(videoControllerSet == false){
                        setVideoPlayerController();
                      }
                          // videoController = VideoPlayerController.file(File(file!.path))
                          // ..addListener(() => setState(() {}))
                          // ..setLooping(true)
                          // ..initialize().then((_) => videoController.pause());

                      return Container(
                        height: 300.h,
                        // width: 200.w,
                        child: videoControllerSet
                          ? NetworkPlayerWidget(videoController: videoController,)
                          : Text("Loading")
                          // CircularProgressIndicator()
                      );
                    }
                  ),

                  // Container(
                  //   height: 300.h,
                  //   // width: 200.w,
                  //   child: NetworkPlayerWidget(videoController: videoController,)
                  // ),

                  sizedBoxHeight(20.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: textBlack16W5000("Title"),
                  ),

                  sizedBoxHeight(8.h),

                  CustomTextFormField(
                    hintText: "Animal Husbandry And Management",
                    validatorText: "Enter your Phone Number"
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: textBlack16W5000("Subtitle"),
                  ),

                  sizedBoxHeight(8.h),

                  CustomTextFormField(
                    hintText: "Animal Husbandry And Management",
                    validatorText: "Enter your Phone Number"
                  ),

                  sizedBoxHeight(25.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textBlack25W7000("Access"),

                      SvgPicture.asset("assets/images/access_done.svg",
                        height: 25.h,
                        width: 25.h,
                      )
                    ],
                  ),

                  Divider(
                    color: AppColors.grey4D4D4D,
                    thickness: 0.5.h,
                  ),

                  CustomListTile(
                    title: "Harry Holind",
                    statecontroller: state,
                    addVideoPage: true,
                    //sizefactor: MediaQuery.of(context).size.width * 0.4,
                  ),

                  CustomListTile(
                    title: "Mary Amelia",
                    statecontroller: state,
                    addVideoPage: true,
                    //sizefactor: MediaQuery.of(context).size.width * 0.4,
                  ),

                  CustomListTile(
                    title: "Ann Poppy",
                    statecontroller: state,
                    addVideoPage: true,
                    //sizefactor: MediaQuery.of(context).size.width * 0.4,
                  ),

          

                  

                  // sizedBoxHeight(130.h),

                  // customButtonCurve(
                  //     text: "Next",
                  //     onTap: () {
                  //       Get.toNamed("/verifyNumber");
                  //     }),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  builduploadprofile(bool uploadVideo) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      builder: (context) {
        return Container(
          height: 100.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (uploadVideo) {
                          _onImageButtonPressed(ImageSource.camera);
                          Get.back();
                        } else {
                          getImage(ImageSource.camera);
                          Get.back();
                        }
                        // getImage(ImageSource.camera);
                        // Get.back();
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 30.sp,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(fontSize: 15.sp),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (uploadVideo) {
                          _onImageButtonPressed(ImageSource.gallery);
                          Get.back();
                        } else {
                          getImage(ImageSource.gallery);
                          Get.back();
                        }
                        // getImage(ImageSource.gallery);
                        // Get.back();
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 30.sp,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(fontSize: 15.sp),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    // if (_controller != null) {
    //   await _controller!.setVolume(0.0);
    // }
    // if (isVideo) {
    file = await _picker.pickVideo(
        source: source, maxDuration: const Duration(seconds: 10));
    setState(() {});
    // await _playVideo(file);
    // Get.to(()=> FilePlayerWidget(file: file));
    // FilePlayerWidget(file: file);
    // }
  }

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      // final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }


}
