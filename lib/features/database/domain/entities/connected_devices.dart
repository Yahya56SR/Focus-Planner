import 'package:focus_planner/features/enum/device_type.dart';

class ConnectedDevices {
  final String ipAddress;
  final String deviceName;
  final DeviceType deviceType;

  ConnectedDevices(this.ipAddress, this.deviceName, this.deviceType);
}
