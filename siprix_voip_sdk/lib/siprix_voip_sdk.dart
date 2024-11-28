import 'package:siprix_voip_sdk_platform_interface/siprix_voip_sdk_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'subscriptions_model.dart';
import 'accounts_model.dart';
import 'network_model.dart';
import 'calls_model.dart';

////////////////////////////////////////////////////////////////////////////
//Events arguments

class AccRegStateArg {
  int accId=0;
  RegState regState=RegState.success;
  String response="";

  bool fromMap(Map<dynamic, dynamic> argsMap) {
    int argsCounter=0;
    int stateVal=0;
    argsMap.forEach((key, value) {
      if((key == SiprixVoipSdkPlatform.kArgAccId)&&(value is int))    { accId    = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kRegState)&&(value is int))    { stateVal = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kResponse)&&(value is String)) { response = value; argsCounter+=1; }
    });

    switch (stateVal) {
      case SiprixVoipSdk.kRegStateSuccess: regState = RegState.success;
      case SiprixVoipSdk.kRegStateFailed:  regState = RegState.failed;
      case SiprixVoipSdk.kRegStateRemoved: regState = RegState.removed;
    }
    return (argsCounter==3);
  }
}

class SubscriptionStateArg {
  int subscrId=0;
  SubscriptionState state=SubscriptionState.created;
  String response="";

  bool fromMap(Map<dynamic, dynamic> argsMap) {
    int argsCounter=0;
    int stateVal=0;
    argsMap.forEach((key, value) {
      if((key == SiprixVoipSdkPlatform.kArgSubscrId)&&(value is int)) { subscrId = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kSubscrState)&&(value is int)) { stateVal = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kResponse)&&(value is String)) { response = value; argsCounter+=1; }
    });

    switch (stateVal) {
      case SiprixVoipSdk.kSubscrStateCreated:   state = SubscriptionState.created;
      case SiprixVoipSdk.kSubscrStateUpdated:   state = SubscriptionState.updated;
      case SiprixVoipSdk.kSubscrStateDestroyed: state = SubscriptionState.destroyed;
    }
    return (argsCounter==3);
  }
}

class NetworkStateArg {  
  String name="";
  NetState state=NetState.lost;
  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;
    int stateVal=0; 
    argsMap.forEach((key, value) {
      if((key == SiprixVoipSdkPlatform.kArgName)&&(value is String)) { name     = value; argsCounter+=1; }
      if((key == SiprixVoipSdkPlatform.kNetState)&&(value is int))   { stateVal = value; argsCounter+=1; }
    });

    switch (stateVal) {
      case SiprixVoipSdk.kNetStateLost:      state = NetState.lost;
      case SiprixVoipSdk.kNetStateRestored:  state = NetState.restored;
      case SiprixVoipSdk.kNetStateSwitched:  state = NetState.switched;
    }

    return (argsCounter==2);
  }
}

class PlayerStateArg {
  int playerId=0;
  PlayerState state=PlayerState.failed;

  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;    
    argsMap.forEach((key, value) {
      if((key == SiprixVoipSdkPlatform.kArgPlayerId)&&(value is int))    { playerId = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kPlayerState)&&(value is int))    { state = PlayerState.from(value); argsCounter+=1; }       
    });

    return (argsCounter==2);
  }
}


class CallProceedingArg {
  int callId=0;
  String response="";
  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;
    argsMap.forEach((key, value) {
      if((key == SiprixVoipSdkPlatform.kArgCallId)&&(value is int))   { callId   = value; argsCounter+=1; } else      
      if((key == SiprixVoipSdkPlatform.kResponse)&&(value is String)) { response = value; argsCounter+=1; }
    });
    return (argsCounter==2);
  }
}

class CallIncomingArg {
  int accId=0;
  int callId=0;
  String from="";
  String to="";
  bool withVideo = false;
  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;
    argsMap.forEach((key, value) {
      if((key == SiprixVoipSdkPlatform.kArgAccId)&&(value is int))      { accId     = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kArgCallId)&&(value is int))     { callId    = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kArgWithVideo)&&(value is bool)) { withVideo = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kFrom)&&(value is String))       { from      = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kTo)&&(value is String))         { to        = value; argsCounter+=1; }
    });
    return (argsCounter==5);
  }
}

class CallAcceptNotifArg {  
  int callId=0;
  bool withVideo = false;
  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;
    argsMap.forEach((key, value) {      
      if((key == SiprixVoipSdkPlatform.kArgCallId)&&(value is int))     { callId = value;    argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kArgWithVideo)&&(value is bool)) { withVideo = value; argsCounter+=1; } 
    });
    return (argsCounter==2);
  }
}

class CallConnectedArg {  
  int callId=0;
  String from="";
  String to="";
  bool withVideo = false;
  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;
    argsMap.forEach((key, value) {      
      if((key == SiprixVoipSdkPlatform.kArgWithVideo)&&(value is bool)) { withVideo = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kArgCallId)&&(value is int))     { callId = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kFrom)&&(value is String))       { from   = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kTo)&&(value is String))         { to     = value; argsCounter+=1; }
    });
    return (argsCounter==4);
  }
}

class CallTerminatedArg {  
  int callId=0;
  int statusCode=0;
  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;
    argsMap.forEach((key, value) {      
      if((key == SiprixVoipSdkPlatform.kArgCallId)&&(value is int))     { callId     = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kArgStatusCode)&&(value is int)) { statusCode = value; argsCounter+=1; } 
    });
    return (argsCounter==2);
  }
}

class CallDtmfReceivedArg {  
  int callId=0;
  int tone=0;
  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;
    argsMap.forEach((key, value) {      
      if((key == SiprixVoipSdkPlatform.kArgCallId)&&(value is int)) { callId = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kArgTone)&&(value is int))   { tone   = value; argsCounter+=1; }
    });
    return (argsCounter==2);
  }
}

class CallTransferredArg {  
  int callId=0;
  int statusCode=0;
  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;
    argsMap.forEach((key, value) {      
      if((key == SiprixVoipSdkPlatform.kArgCallId)&&(value is int))     { callId = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kArgStatusCode)&&(value is int)) { statusCode = value; argsCounter+=1; } 
    });
    return (argsCounter==2);
  }
}

class CallRedirectedArg {  
  int origCallId=0;
  int relatedCallId=0;
  String referTo="";
  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;
    argsMap.forEach((key, value) {      
      if((key == SiprixVoipSdkPlatform.kArgFromCallId)&&(value is int)) { origCallId = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kArgToCallId)&&(value is int))   { relatedCallId = value; argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kArgToExt)&&(value is String))   { referTo = value; argsCounter+=1; } 
    });
    return (argsCounter==3);
  }
}


class CallHeldArg {  
  int callId=0;
  HoldState state = HoldState.none;
  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;
    
    argsMap.forEach((key, value) {      
      if((key == SiprixVoipSdkPlatform.kArgCallId)&&(value is int)) { callId = value;               argsCounter+=1; } else
      if((key == SiprixVoipSdkPlatform.kHoldState)&&(value is int)) { state  = HoldState.from(value); argsCounter+=1; }
    });
    return (argsCounter==2);
  }
}


class CallSwitchedArg {  
  int callId=0;  
  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;
    argsMap.forEach((key, value) {      
      if((key == SiprixVoipSdkPlatform.kArgCallId)&&(value is int)) { callId = value; argsCounter+=1; }      
    });
    return (argsCounter==1);
  }
}


class MediaDevice {
  MediaDevice(this.index);
  String  name="";
  String  guid="";
  int index = 0;

  bool fromMap(Map<dynamic, dynamic> argsMap) {    
    int argsCounter=0;    
    argsMap.forEach((key, value) {      
      if((key == SiprixVoipSdkPlatform.kArgDvcName)&&(value is String)) { name = value; argsCounter+=1; }
      if((key == SiprixVoipSdkPlatform.kArgDvcGuid)&&(value is String)) { guid = value; argsCounter+=1; }
    });
    return (argsCounter==2);
  }
}


////////////////////////////////////////////////////////////////////////////
//Listeners

class AccStateListener {
  AccStateListener({this.regStateChanged});
  void Function(int accId, RegState state, String response)? regStateChanged;
}

class SubscrStateListener {
  SubscrStateListener({this.subscrStateChanged});
  void Function(int subscrId, SubscriptionState state, String response)? subscrStateChanged;
}

class NetStateListener {
  NetStateListener({this.networkStateChanged});  
  void Function(String name, NetState state)? networkStateChanged;
}

class CallStateListener {
  CallStateListener({this.proceeding, this.incoming, this.acceptNotif,
    this.connected, this.terminated, this.dtmfReceived,
    this.transferred, this.redirected, this.held, this.switched, 
    this.playerStateChanged});

  void Function(int playerId, PlayerState s)? playerStateChanged;
  void Function(int callId, String response)?  proceeding;
  void Function(int callId, int accId, bool withVideo, String from, String to)? incoming;
  void Function(int callId, bool withVideo)? acceptNotif;  
  void Function(int callId, String from, String to, bool withVideo)? connected;
  void Function(int callId, int statusCode)? terminated;
  void Function(int callId, int statusCode)? transferred;
  void Function(int origCallId, int relatedCallId, String referTo)? redirected;
  void Function(int callId, int tone)? dtmfReceived;
  void Function(int callId, HoldState)? held;
  void Function(int callId)? switched;
}

class DevicesStateListener {
  DevicesStateListener({this.devicesChanged});
  void Function()?  devicesChanged;
}

class TrialModeListener {
  TrialModeListener({this.notified});
  void Function()?  notified;
}

abstract interface class ILogsModel {
  void print(String s);
}

abstract interface class IAccountsModel {
  String getUri(int accId);
  int getAccId(String uri);
  bool hasSecureMedia(int accId);
}


//////////////////////////////////////////////////////////////////////////////////////////
//SiprixVoipSdk - root implementation

class SiprixVoipSdk {
  //Constants
  static const int kLogLevelStack   = 0;
  static const int kLogLevelDebug   = 1;
  static const int kLogLevelInfo    = 2;
  static const int kLogLevelWarning = 3;
  static const int kLogLevelError   = 4;
  static const int kLogLevelNone    = 5;

  static const int kSipTransportUdp = 0;
  static const int kSipTransportTcp = 1;
  static const int kSipTransportTls = 2;

  static const int kSecureMediaDisabled = 0;
  static const int kSecureMediaSdesSrtp = 1;  
  static const int kSecureMediaDtlsSrtp = 2;

  static const int kRegStateSuccess = 0;
  static const int kRegStateFailed  = 1;
  static const int kRegStateRemoved = 2;

  static const int kSubscrStateCreated = 0;
  static const int kSubscrStateUpdated = 1;
  static const int kSubscrStateDestroyed = 2;

  static const int kNetStateLost     = 0;
  static const int kNetStateRestored = 1;
  static const int kNetStateSwitched = 2;

  static const int kPlayerStateStarted = 0;
  static const int kPlayerStateStopped = 1;
  static const int kPlayerStateFailed  = 2;

  static const int kAudioCodecOpus  = 65;
  static const int kAudioCodecISAC16= 66;
  static const int kAudioCodecISAC32= 67;
  static const int kAudioCodecG722  = 68;
  static const int kAudioCodecILBC  = 69;
  static const int kAudioCodecPCMU  = 70;
  static const int kAudioCodecPCMA  = 71;  
  static const int kAudioCodecDTMF  = 72;
  static const int kAudioCodecCN    = 73;

  static const int kVideoCodecH264  = 80;
  static const int kVideoCodecVP8   = 81;
  static const int kVideoCodecVP9   = 82;
  static const int kVideoCodecAV1   = 83;

  static const int kDtmfMethodRtp  = 0;
  static const int kDtmfMethodInfo = 1;

  static const int kHoldStateNone   = 0;
  static const int kHoldStateLocal  = 1;
  static const int kHoldStateRemote = 2;
  static const int kHoldStateLocalAndRemote = 3;

  static const int eOK = 0;
  static const int eDuplicateAccount=-1021;
  static const int eSubscrAlreadyExist=-1083;
  
  static const int kLocalVideoCallId=0;
 
  ////////////////////////////////////////////////////////////////////////////////////////
  //Channel and instance implementation
  
  static final SiprixVoipSdk _instance = SiprixVoipSdk._internal();
  static  SiprixVoipSdk get instance => _instance;
  factory SiprixVoipSdk() { return _instance; }

  SiprixVoipSdk._internal();

  static SiprixVoipSdkPlatform get _platform => SiprixVoipSdkPlatform.instance;

  NetStateListener? netListener;
  AccStateListener? accListener;
  SubscrStateListener? subscrListener;
  CallStateListener? callListener;
  DevicesStateListener? dvcListener;
  TrialModeListener? trialListener;
  
  ////////////////////////////////////////////////////////////////////////////////////////
  //Siprix module methods implementation

  void initialize(InitData iniData, ILogsModel? logsModel) async {    
    _platform.setEventsHandler(_eventsHandler);
    try {
      await _platform.initialize(iniData);
      String verStr = await version() ?? "???";
      //int verCode = await versionCode() ?? 0;
      logsModel?.print('Siprix module initialized successfully');
      logsModel?.print('Version: $verStr');
    } on PlatformException catch (err) {
      logsModel?.print('Can\'t initialize Siprix module Err: ${err.code} ${err.message}');
    }
  }

  void unInitialize(ILogsModel? logsModel) async {    
    try {
      await _platform.unInitialize();
      logsModel?.print('Siprix module uninitialized');
    } on PlatformException catch (err) {
      logsModel?.print('Can\'t uninitilize Siprix module Err: ${err.code} ${err.message}');
    }
  }

  Future<String?> homeFolder() async {
    return _platform.homeFolder();
  }

  Future<String?> version() async {
    return _platform.version();
  }

  Future<int?> versionCode() async {
    return _platform.versionCode();
  } 

  ////////////////////////////////////////////////////////////////////////////////////////
  //Siprix Account methods implementation

  Future<int?> addAccount(AccountModel newAccount) {
    return _platform.addAccount(newAccount);
  }

  Future<void> updateAccount(AccountModel updAccount) {
    return _platform.updateAccount(updAccount);
  }

  Future<void> deleteAccount(int accId) {
    return _platform.deleteAccount(accId);
  }

  Future<void> unRegisterAccount(int accId) {
    return _platform.unRegisterAccount(accId);
  }

  Future<void> registerAccount(int accId, int expireTime) {
    return _platform.registerAccount(accId, expireTime);
  }

  Future<String?> genAccInstId() {
    return _platform.genAccInstId();
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  //Siprix Calls methods implementation 

  Future<int?> invite(CallDestination destData) {
    return _platform.invite(destData);
  }

  Future<void> reject(int callId, int statusCode) {
    return _platform.reject(callId, statusCode);
  }

  Future<void> accept(int callId, bool withVideo) {
    return _platform.accept(callId, withVideo);
  }

  Future<void> sendDtmf(int callId, String tones, int durationMs, int intertoneGapMs, [int method = kDtmfMethodRtp]) {
    return _platform.sendDtmf(callId, tones, durationMs, intertoneGapMs, method);
  }

  Future<void> bye(int callId) {
    return _platform.bye(callId);
  }

  Future<void> hold(int callId) {
    return _platform.hold(callId);
  }

  Future<int?> getHoldState(int callId) {
    return _platform.getHoldState(callId);
  }

  Future<String?> getSipHeader(int callId, String headerName) {
    return _platform.getSipHeader(callId, headerName);
  }

  Future<void> muteMic(int callId, bool mute) {
    return _platform.muteMic(callId, mute);
  }

  Future<void> muteCam(int callId, bool mute) {
    return _platform.muteCam(callId, mute);
  }

  Future<int?> playFile(int callId, String pathToMp3File, bool loop) {
    return _platform.playFile(callId, pathToMp3File, loop);
  }

  Future<void> stopPlayFile(int playerId) {
    return _platform.stopPlayFile(playerId);
  }
    
  Future<void> recordFile(int callId, String pathToMp3File) {
    return _platform.recordFile(callId, pathToMp3File);
  }

  Future<void> stopRecordFile(int callId) {
    return _platform.stopRecordFile(callId);
  }  

  Future<void> transferBlind(int callId, String toExt) {
    return _platform.transferBlind(callId, toExt);
  }
  
  Future<void> transferAttended(int fromCallId, int toCallId) {
    return _platform.transferAttended(fromCallId, toCallId);
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  //Siprix Mixer methods implmentation
  
  Future<void> switchToCall(int callId) {
    return _platform.switchToCall(callId);
  }
  
  Future<void> makeConference() {
    return _platform.makeConference();
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  //Siprix subscriptions

  Future<int?> addSubscription(SubscriptionModel newSubscription) {
    return _platform.addSubscription(newSubscription);
  }

  Future<void> deleteSubscription(int subscriptionId) {
    return _platform.deleteSubscription(subscriptionId);
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  //Siprix Devices methods implementation

  Future<int?> getPlayoutDevices() {
    return _platform.getPlayoutDevices();
  }

  Future<int?> getRecordingDevices() {
    return _platform.getRecordingDevices();
  }

  Future<int?> getVideoDevices() {
    return _platform.getVideoDevices();
  }

  Future<MediaDevice?> _getMediaDevice(int index, String methodName) async {
     try {
      Map<dynamic, dynamic>? argsMap = await _platform.getMediaDevice(index, methodName);
      if(argsMap==null) return null;
      
      MediaDevice dvc = MediaDevice(index);
      return dvc.fromMap(argsMap) ? dvc : null;
    } on PlatformException catch (err) {
      return Future.error((err.message==null) ? err.code : err.message!);
    }
  }
  
  Future<MediaDevice?> getPlayoutDevice(int index) async {
    return _getMediaDevice(index, SiprixVoipSdkPlatform.kMethodDvcGetPlayout);     
  }

  Future<MediaDevice?> getRecordingDevice(int index) async {
    return _getMediaDevice(index, SiprixVoipSdkPlatform.kMethodDvcGetRecording);     
  }

  Future<MediaDevice?> getVideoDevice(int index) async {
    return _getMediaDevice(index, SiprixVoipSdkPlatform.kMethodDvcGetVideo);     
  }

  Future<void> setPlayoutDevice(int index) {
    return _platform.setPlayoutDevice(index);
  }
  
  Future<void> setRecordingDevice(int index) {
    return _platform.setRecordingDevice(index);
  }

  Future<void> setVideoDevice(int index) {
    return _platform.setVideoDevice(index);
  }

  Future<void> setVideoParams(VideoData videoData) {
    return _platform.setVideoParams(videoData);
  }

  //Future<void> routeAudioTo(iOSAudioRoute route) {
  //  return _platform.routeAudioTo(route);
  //}
  
  
  ////////////////////////////////////////////////////////////////////////////////////////
  //Siprix video renderers

  Future<int?> videoRendererCreate() {
    return _platform.videoRendererCreate();
  }

  Future<void> videoRendererSetSourceCall(int textureId, int callId) {
    return _platform.videoRendererSetSourceCall(textureId, callId);
  }

  
  Future<void> videoRendererDispose(int textureId) {
    return _platform.videoRendererDispose(textureId);
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////
  //Android specific implementation

  Future<void>? setForegroundMode(bool enabled) {    
    return _platform.setForegroundMode(enabled);
  }

  Future<bool?>? isForegroundMode() {
    return _platform.isForegroundMode();
  }
  
  

  ////////////////////////////////////////////////////////////////////////////////////////
  //Siprix callbacks handler

  Future<void> _eventsHandler(MethodCall methodCall) async {
    debugPrint('event ${methodCall.method.toString()} ${methodCall.arguments.toString()}');
    if(methodCall.arguments is! Map<dynamic, dynamic>) {
      return;
    }

    Map<dynamic, dynamic> argsMap = methodCall.arguments as Map<dynamic, dynamic>;
    switch(methodCall.method) {
      case SiprixVoipSdkPlatform.kOnAccountRegState  : onAccountRegState(argsMap);  break;
      case SiprixVoipSdkPlatform.kOnSubscriptionState: onSubscriptionState(argsMap);break;
      case SiprixVoipSdkPlatform.kOnNetworkState     : onNetworkState(argsMap);     break;
      case SiprixVoipSdkPlatform.kOnPlayerState      : onPlayerState(argsMap);      break;

      case SiprixVoipSdkPlatform.kOnTrialModeNotif   : onTrialModeNotif(argsMap);   break;
      case SiprixVoipSdkPlatform.kOnDevicesChanged   : onDevicesChanged(argsMap);   break;
      
      case SiprixVoipSdkPlatform.kOnCallIncoming     : onCallIncoming(argsMap);     break;
      case SiprixVoipSdkPlatform.kOnCallAcceptNotif  : onCallAcceptNotif(argsMap);  break;
      case SiprixVoipSdkPlatform.kOnCallConnected    : onCallConnected(argsMap);    break;      
      case SiprixVoipSdkPlatform.kOnCallTerminated   : onCallTerminated(argsMap);   break;
      case SiprixVoipSdkPlatform.kOnCallProceeding   : onCallProceeding(argsMap);   break;      
      case SiprixVoipSdkPlatform.kOnCallDtmfReceived : onCallDtmfReceived(argsMap); break;
      case SiprixVoipSdkPlatform.kOnCallTransferred  : onCallTransferred(argsMap);  break;
      case SiprixVoipSdkPlatform.kOnCallRedirected   : onCallRedirected(argsMap);   break;
      case SiprixVoipSdkPlatform.kOnCallSwitched     : onCallSwitched(argsMap);     break;
      case SiprixVoipSdkPlatform.kOnCallHeld         : onCallHeld(argsMap);         break;
    }    
  }

  void onAccountRegState(Map<dynamic, dynamic> argsMap) {
    AccRegStateArg arg = AccRegStateArg();
    if(arg.fromMap(argsMap)) {
      accListener?.regStateChanged?.call(arg.accId, arg.regState, arg.response);
    }
  }

  void onSubscriptionState(Map<dynamic, dynamic> argsMap) {
    SubscriptionStateArg arg = SubscriptionStateArg();
    if(arg.fromMap(argsMap)) {
      subscrListener?.subscrStateChanged?.call(arg.subscrId, arg.state, arg.response);
    }
  }

  void onNetworkState(Map<dynamic, dynamic> argsMap) {
    NetworkStateArg arg = NetworkStateArg();
    if(arg.fromMap(argsMap)) {      
      netListener?.networkStateChanged?.call(arg.name, arg.state);
    }    
  }
  

  void onPlayerState(Map<dynamic, dynamic> argsMap) {
    PlayerStateArg arg =PlayerStateArg();
    if(arg.fromMap(argsMap)) {
      callListener?.playerStateChanged?.call(arg.playerId, arg.state);
    }
  }
  
  void onCallProceeding(Map<dynamic, dynamic> argsMap) {
    CallProceedingArg arg = CallProceedingArg();
    if(arg.fromMap(argsMap)) {
      callListener?.proceeding?.call(arg.callId, arg.response);
    }
  }

  void onCallTerminated(Map<dynamic, dynamic> argsMap) {
    CallTerminatedArg arg = CallTerminatedArg();
    if(arg.fromMap(argsMap)) {
      callListener?.terminated?.call(arg.callId, arg.statusCode);
    }
  }

  void onCallConnected(Map<dynamic, dynamic> argsMap) {
    CallConnectedArg arg = CallConnectedArg();
    if(arg.fromMap(argsMap)) {
      callListener?.connected?.call(arg.callId, arg.from, arg.to, arg.withVideo);
    }
  }

  void onCallIncoming(Map<dynamic, dynamic> argsMap) {
    CallIncomingArg arg = CallIncomingArg();
    if(arg.fromMap(argsMap)) {
      callListener?.incoming?.call(arg.callId, arg.accId, arg.withVideo, arg.from, arg.to);
    }
  }

  void onCallAcceptNotif(Map<dynamic, dynamic> argsMap) {
    CallAcceptNotifArg arg = CallAcceptNotifArg();
    if(arg.fromMap(argsMap)) {
      callListener?.acceptNotif?.call(arg.callId, arg.withVideo);
    }
  }
  

  void onCallDtmfReceived(Map<dynamic, dynamic> argsMap) {
    CallDtmfReceivedArg arg = CallDtmfReceivedArg();
    if(arg.fromMap(argsMap)) {
      callListener?.dtmfReceived?.call(arg.callId, arg.tone);
    }
  }

  void onCallTransferred(Map<dynamic, dynamic> argsMap) {
    CallTransferredArg arg = CallTransferredArg();
    if(arg.fromMap(argsMap)) {
      callListener?.transferred?.call(arg.callId, arg.statusCode);
    }
  }

  void onCallRedirected(Map<dynamic, dynamic> argsMap) {
    CallRedirectedArg arg = CallRedirectedArg();
    if(arg.fromMap(argsMap)) {
      callListener?.redirected?.call(arg.origCallId, arg.relatedCallId, arg.referTo);
    }
  }

  void onCallHeld(Map<dynamic, dynamic> argsMap) {
    CallHeldArg arg = CallHeldArg();
    if(arg.fromMap(argsMap)) {
      callListener?.held?.call(arg.callId, arg.state);
    }
  }

  void onCallSwitched(Map<dynamic, dynamic> argsMap) {
    CallSwitchedArg arg = CallSwitchedArg();
    if(arg.fromMap(argsMap)) {
      callListener?.switched?.call(arg.callId);
    }
  }

  void onDevicesChanged(Map<dynamic, dynamic> argsMap) {
    dvcListener?.devicesChanged?.call();
  }

  void onTrialModeNotif(Map<dynamic, dynamic> argsMap) {
    trialListener?.notified?.call();
  }

  
  
}//SiprixVoipSdk
