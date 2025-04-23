// ignore_for_file: avoid_print, prefer_final_fields, unnecessary_getters_setters, unused_field, non_constant_identifier_names

abstract class SmartDevice {
  String _deviceName;
  bool _isOn;

  SmartDevice(this._deviceName, this._isOn);

  String get deviceName => _deviceName;
  bool get isOn => _isOn;

  void operate();

  void TurnOffOn() {
    _isOn = !_isOn;
    print("$_deviceName is now ${_isOn ? "on" : "off"}.");
  }
}

mixin TempControl {
  double? _temp;

  void setTemp(double temp) {
    _temp = temp;
    print('Temparature set to $temp °C');
  }
}

class Light extends SmartDevice {
  Light(super.deviceName, super.isOn);

  void IsOn(bool isOn) {
    isOn = false;
  }

  @override
  void operate() {
    TurnOffOn();
    if (isOn) {
      print('$deviceName lights are glowing');
    }
  }
}

class Fan extends SmartDevice with TempControl {
  Fan(super.deviceName, super.isOn);

  @override
  void operate() {
    TurnOffOn();
    if (isOn) {
      print('$deviceName lights are glowing');
      setTemp(26.0);
    }
  }
}

class SecurityCameras extends SmartDevice {
  SecurityCameras(super.deviceName, super.isOn);

  @override
  void operate() {
    TurnOffOn();
    if (isOn) {
      print('$deviceName is unlocked');
    } else {
      print('$deviceName is locked');
    }
  }
}

class SecureSmartDoor extends SmartDevice {
  String _password;
  bool isAuthentication = false;

  SecureSmartDoor(super.deviceName, super.isOn, this._password, this.isAuthentication);

  void Authenticated(String pass) {
    if (pass == _password) {
      print('Successfully authenticated');
    } else {
      print("Failed authentication");
    }
  }

  @override
  void operate(){

  }
}

void main() {
  var light = Light('Samsung', false);
  light.operate();
  light.operate();

  print('\n');
  var fan = Fan('LG', false);
  fan.operate();

  print('\n');
  var camera = SecurityCameras('Sony', true);
  camera.operate();

  print('\n');

  var sec = SecureSmartDoor('Hitachi', false, "1234", true);
  sec.Authenticated('1234');
  sec.operate();
}