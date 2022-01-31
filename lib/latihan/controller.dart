import 'package:device_info/device_info.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class CounterController extends Controller {
  bool _isSmartTv = false;
  bool get isSmartTv => _isSmartTv;

  @override
  void initListeners() {
    _setSmartTv();
  }

  void _setSmartTv() async {
    _isSmartTv = await _checkSmartTv();
    refreshUI();
  }

  static Future<bool> _checkSmartTv() async {
    try {
      var androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
      var isSmartTv = androidDeviceInfo.systemFeatures.contains(
        'android.software.leanback_only',
      );

      return isSmartTv;
    } catch (e) {
      return false;
    }
  }
}
