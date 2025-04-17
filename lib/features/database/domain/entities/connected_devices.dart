import 'package:focus_planner/features/enum/device_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConnectedDevices {
  final String? ipAddress;
  final String? deviceName;
  final DeviceType? deviceType;

  ConnectedDevices({this.ipAddress, this.deviceName, this.deviceType});

  factory ConnectedDevices.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ConnectedDevices(
      ipAddress: data['ipAddress'],
      deviceName: data['deviceName'],
      deviceType: DeviceType.values[data['deviceType']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ipAddress': ipAddress,
      'deviceName': deviceName,
      'deviceType': deviceType,
    };
  }
}
