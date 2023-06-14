import 'package:flutter/cupertino.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../../core/class/call.dart';


class MyCall extends StatelessWidget {
  const MyCall({Key? key, required this.callID }) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: MyConst.appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: MyConst.appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: MyConst.userId,
      userName: MyConst.userName,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
    );
  }
}
