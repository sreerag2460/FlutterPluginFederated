import 'package:siprix_voip_sdk/accounts_model.dart';
import 'package:siprix_voip_sdk/siprix_voip_sdk.dart';

/// Accounts list model (contains app level code of managing accіounts)
class AppAccountsModel extends AccountsModel {
  AppAccountsModel([this._logs]) : super(_logs);
  final ILogsModel? _logs;

  @override
  Future<void> addAccount(AccountModel acc, {bool saveChanges=true}) async {
    //iOS related implemetation
    String? token = await SiprixVoipSdk().getPushKitToken();
    if(token != null) {
      _logs?.print('Got PushKit token: $token');
      acc.xheaders = {"X-Token" : token};
    }
    return super.addAccount(acc, saveChanges:saveChanges);
  }

}