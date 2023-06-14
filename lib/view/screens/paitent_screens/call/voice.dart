import 'package:flutter/cupertino.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../../core/class/call.dart';

class VoiceCall extends StatelessWidget {
  const VoiceCall({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: MyConst.appId,
      appSign: MyConst.appSign,
      userID: MyConst.userId,
      userName: MyConst.userName,
      callID: callID,

      // Modify your custom configurations here.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..turnOnCameraWhenJoining = false
        ..turnOnMicrophoneWhenJoining = false
        ..useSpeakerWhenJoining = true,
    );
  }
}
