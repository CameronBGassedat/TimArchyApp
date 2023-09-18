import 'dart:convert';

import 'package:tim_archy_app/UI/Screens/pairPages/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:tim_archy_app/Data/my_globals.dart' as globals;
import 'package:tim_archy_app/UI/Helpers/helper.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});
  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  // Variables
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devices = [];
  bool isConnected = false;
  List<Widget> characteristicsWidget = <Widget>[];
  late BluetoothDevice targetDevice;
  //BluetoothCharacteristic targetCharacteristic;
  List<BluetoothService> _services = [];
  static const String SERVICE_UID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  static const String CHARACTERISTIC_UUID =
      "beb5483e-36e1-4688-b7f5-ea07361b26a8";

  // Functions
  void startScan() {
    devices.clear();

    // Start scanning
    flutterBlue.startScan(timeout: const Duration(seconds: 2));

    // Listen to scan results
    flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        if (r.device.name.isNotEmpty && !devices.contains(r.device)) {
          setState(() {
            devices.add(r.device);
          });
        }
        // print('${r.device.name} found! rssi: ${r.rssi} | ${r.device.id}');
      }
    });

    // Stop scanning
    flutterBlue.stopScan();
  }

  void connect(device) async {
    print('Test connect');
    try {
      await device.connect();
    } on PlatformException catch (e) {
      if (e.code != 'already_connected') {
        rethrow;
      }
    }

    setState(() {
      isConnected = true;
    });
    _services = await device.discoverServices();
    print(_services);
    _services.forEach((service) {
      print(service.uuid);
      print(service.uuid.toString() == SERVICE_UID);
      if (service.uuid.toString() == SERVICE_UID) {
        service.characteristics.forEach((chara) async {
          if (chara.uuid.toString() == CHARACTERISTIC_UUID) {
            print(chara.uuid);
            print("SUUCCEESSSS");
            String data = globals.ssid + ',' + globals.password;
            List<int> bytes = utf8.encode(data);
            await chara.write(bytes);
          }
        });
      }
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DeviceInfo(
                deviceName: device.name,
              )),
    );
  }

  discoverServices() async {
    if (targetDevice == null) {
      return;
    }

    List<BluetoothService> services = await targetDevice.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == SERVICE_UID) {
        service.characteristics.forEach((characteristics) {
          if (characteristics.uuid.toString() == CHARACTERISTIC_UUID) {
            //targetCharacteristic = characteristics;
          }
        });
      }
    });
  }

  void disconnect(device) async {
    print('Test disconnect');
    await device.disconnect();
    setState(() {
      isConnected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(0.05 * screenWidth),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  makeImage("logo_min.png", 0.06 * screenHeight),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 0.09 * screenHeight,
                    child: makeText(
                      "APPAIRAGE",
                      Colors.black,
                      42,
                      FontStyle.italic,
                      FontWeight.w900)),
                  SizedBox(
                    height: 0.06 * screenHeight,
                    width: 0.06 * screenHeight,
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: devices.length,
                // prototypeItem: ListTile(
                //   title: Text(devices.first),
                // ),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${devices[index].name} | ${devices[index].state.isBroadcast}'),
                    trailing: ElevatedButton(
                        onPressed: () {
                          if (isConnected == false) {
                            connect(devices[index]);
                          } else {
                            disconnect(devices[index]);
                          }
                        },
                        child: isConnected == false
                            ? const Text('Connecter')
                            : const Text('Déconnecter')),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF70bed3),
        onPressed: () {
          startScan();
        },
        child: makeImage("search.png", screenHeight),
      ),
    );
  }
}
