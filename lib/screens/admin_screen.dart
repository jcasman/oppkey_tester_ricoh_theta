import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:theta_req_res/windows/request_window.dart';
import 'package:theta_req_res/windows/response_window.dart';
import 'package:theta_req_res/windows/thumb_window.dart';
import 'package:theta_req_res/windows/req_res_window.dart';
import 'package:theta_req_res/screens/navigation_drawer.dart';
import 'package:theta_req_res/camera_api/admin/reset_button.dart';
import 'package:theta_req_res/camera_api/admin/power/disable_sleep_button.dart';
import 'package:theta_req_res/camera_api/admin/power/show_sleep_delay_button.dart';
import 'package:theta_req_res/camera_api/admin/power/disable_power_off.dart';
import 'package:theta_req_res/camera_api/admin/power/enable_power_off.dart';
import 'package:theta_req_res/camera_api/admin/power/show_off_delay_button.dart';
import 'package:theta_req_res/camera_api/admin/delete_all_button.dart';
import 'package:theta_req_res/camera_api/admin/power/enable_sleep_delay.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this variable is needed to get the size of the device
    var device = MediaQuery.of(context).size;
    print('On the Admin screen, the device is ${device.width} pixels wide');
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin for ${Provider.of<CameraNotifier>(context).model}'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          children: [
            // row of buttons to send commands to camera
            device.width > 1000
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DisableSleepButton(),
                      ShowSleepDelayButton(),
                      DisablePowerOffButton(),
                      EnablePowerOffButton(),
                      EnableSleepDelayButton(),
                      ShowOffDelayButton(),
                      ResetButton(),
                      DeleteAllButton(),
                    ],
                  )
                : Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DisableSleepButton(),
                            EnableSleepDelayButton(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DisablePowerOffButton(),
                            EnablePowerOffButton(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ShowOffDelayButton(),
                            ShowSleepDelayButton(),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 30.0,
                                  child: Text(
                                    'Danger Will Robinson',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  )),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ResetButton(),
                            DeleteAllButton(),
                          ],
                        ),
                        Container(height: 300.0, child: ReqResWindow())
                      ],
                    ),
                  ),
            // This is the end of the mobile view
            device.width > 1000
                ? Row(
                    children: [
                      Container(
                        width: 300.0,
                        child: Center(
                          child: Text(
                            'Response',
                            style: TextStyle(fontSize: 28),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 300.0,
                      //   child: Center(
                      //     child: Text(
                      //       'Last Image',
                      //       style: TextStyle(fontSize: 28),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                : Row(),
            SizedBox(
              height: 12,
            ),
            // request, response, and image windows
            device.width > 1000
                ? Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RequestWindow(),
                        ResponseWindow(),
                        ThumbWindow(),
                      ],
                    ),
                  )
                : Row(),
          ],
        ),
      ),
    );
  }
}
