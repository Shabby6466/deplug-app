
import 'package:deplug/core/services/l10n/gen_l10n/app_localizations.dart';
import 'package:deplug/modules/initial/bloc/device_connection_bloc.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/widget/add_device/device_connect_widget.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/widget/add_device/device_connecting_widget.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/widget/add_device/device_found_widget.dart';
import 'package:deplug/modules/initial/view/connect_de_plug_device/widget/add_device/search_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDeviceWidget extends StatefulWidget {
  const AddDeviceWidget({super.key});

  @override
  State<AddDeviceWidget> createState() => _AddDeviceWidgetState();
}

class _AddDeviceWidgetState extends State<AddDeviceWidget> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context);
    return BlocBuilder<ConnectDeviceBloc, ConnectDeviceState>(
      builder: (context, state) {
        return Column(
          children: [getAddDeviceScreen(state.addDeviceScreens)],
        );
      },
    );
  }

  Widget getAddDeviceScreen(AddDeviceScreens addDeviceScreens) {
    switch (addDeviceScreens) {
      case AddDeviceScreens.searchDevice:
        return const SearchDevice();
      case AddDeviceScreens.deviceFound:
        return const DeviceFoundWidget();
      case AddDeviceScreens.deviceConnect:
        return const DeviceConnectWidget();
      case AddDeviceScreens.deviceConnecting:
        return const DeviceConnectingWidget();
    }
  }
}

enum AddDeviceScreens { searchDevice, deviceFound, deviceConnect, deviceConnecting }
