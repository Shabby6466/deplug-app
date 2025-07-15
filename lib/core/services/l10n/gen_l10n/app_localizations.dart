import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @decentralized_energy.
  ///
  /// In en, this message translates to:
  /// **'Decentralized Energy, Plugged into Your Life.'**
  String get decentralized_energy;

  /// No description provided for @lorem_ipsum.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'**
  String get lorem_ipsum;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @device_details.
  ///
  /// In en, this message translates to:
  /// **'Device Details'**
  String get device_details;

  /// No description provided for @deplug_mining.
  ///
  /// In en, this message translates to:
  /// **'DePlug Mining'**
  String get deplug_mining;

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shop;

  /// No description provided for @deplug_mining_will_start.
  ///
  /// In en, this message translates to:
  /// **'DePlug Mining will start after 5000 device users.'**
  String get deplug_mining_will_start;

  /// No description provided for @complete_all_missions_to_get_rewards.
  ///
  /// In en, this message translates to:
  /// **'Complete all missions to get rewards.'**
  String get complete_all_missions_to_get_rewards;

  /// No description provided for @my_devices.
  ///
  /// In en, this message translates to:
  /// **'My Devices'**
  String get my_devices;

  /// No description provided for @living_room_device.
  ///
  /// In en, this message translates to:
  /// **'Living Room Device'**
  String get living_room_device;

  /// No description provided for @looking_for_new_device.
  ///
  /// In en, this message translates to:
  /// **'Looking for a new device?'**
  String get looking_for_new_device;

  /// No description provided for @shop_now.
  ///
  /// In en, this message translates to:
  /// **'Shop Now'**
  String get shop_now;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @devices.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get devices;

  /// No description provided for @missions.
  ///
  /// In en, this message translates to:
  /// **'Missions'**
  String get missions;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @connectYourWallet.
  ///
  /// In en, this message translates to:
  /// **'Connect your wallet to continue with DePlug'**
  String get connectYourWallet;

  /// No description provided for @metaMask.
  ///
  /// In en, this message translates to:
  /// **'Metamask'**
  String get metaMask;

  /// No description provided for @phantom.
  ///
  /// In en, this message translates to:
  /// **'Phantom'**
  String get phantom;

  /// No description provided for @deplugDevices.
  ///
  /// In en, this message translates to:
  /// **'DePlug Device'**
  String get deplugDevices;

  /// No description provided for @buyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy Now'**
  String get buyNow;

  /// No description provided for @iAgreeToDeplug.
  ///
  /// In en, this message translates to:
  /// **'I agree to DePlug'**
  String get iAgreeToDeplug;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @exclusive_nft_reward.
  ///
  /// In en, this message translates to:
  /// **'Exclusive NFT Rewards'**
  String get exclusive_nft_reward;

  /// No description provided for @a_bonus_token.
  ///
  /// In en, this message translates to:
  /// **'A Bonus Token'**
  String get a_bonus_token;

  /// No description provided for @earn_airdrop_multiplier.
  ///
  /// In en, this message translates to:
  /// **'Earn Airdrop Multiplier'**
  String get earn_airdrop_multiplier;

  /// No description provided for @upload_image.
  ///
  /// In en, this message translates to:
  /// **'Upload Image'**
  String get upload_image;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of service.'**
  String get termsOfService;

  /// No description provided for @letsConnect.
  ///
  /// In en, this message translates to:
  /// **'Let’s Connect \nDePlug device'**
  String get letsConnect;

  /// No description provided for @howToConnect.
  ///
  /// In en, this message translates to:
  /// **'How to connect?'**
  String get howToConnect;

  /// No description provided for @point1.
  ///
  /// In en, this message translates to:
  /// **'Make sure your device is On and connected to power.'**
  String get point1;

  /// No description provided for @point2.
  ///
  /// In en, this message translates to:
  /// **'Hold the physical button on device for 3 second until red light blinks.'**
  String get point2;

  /// No description provided for @point3.
  ///
  /// In en, this message translates to:
  /// **'Find the DePlug power strip device on mobile device.'**
  String get point3;

  /// No description provided for @point4.
  ///
  /// In en, this message translates to:
  /// **'Connect the device.'**
  String get point4;

  /// No description provided for @point5.
  ///
  /// In en, this message translates to:
  /// **'Enter Wifi password to connect the IoT device to wifi.'**
  String get point5;

  /// No description provided for @point6.
  ///
  /// In en, this message translates to:
  /// **'Name your device.'**
  String get point6;

  /// No description provided for @point7.
  ///
  /// In en, this message translates to:
  /// **'Ready to mining.'**
  String get point7;

  /// No description provided for @startConnection.
  ///
  /// In en, this message translates to:
  /// **'Start Connection'**
  String get startConnection;

  /// No description provided for @addADevice.
  ///
  /// In en, this message translates to:
  /// **'Add a device'**
  String get addADevice;

  /// No description provided for @holdDeviceButton.
  ///
  /// In en, this message translates to:
  /// **'Hold Device Button'**
  String get holdDeviceButton;

  /// No description provided for @holdDeviceButtonDesc.
  ///
  /// In en, this message translates to:
  /// **'Ensure your DePlug power strip is powered on, connected to a power source, and placed close to your mobile device.'**
  String get holdDeviceButtonDesc;

  /// No description provided for @selectDeviceToConnect.
  ///
  /// In en, this message translates to:
  /// **'Select device to connect'**
  String get selectDeviceToConnect;

  /// No description provided for @selectDeviceToConnectDesc.
  ///
  /// In en, this message translates to:
  /// **'Select the device and start connection.'**
  String get selectDeviceToConnectDesc;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @connecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get connecting;

  /// No description provided for @keepDeviceOn.
  ///
  /// In en, this message translates to:
  /// **'Keep your mobile screen on and near to device.'**
  String get keepDeviceOn;

  /// No description provided for @connectWifi.
  ///
  /// In en, this message translates to:
  /// **'Connect Wifi'**
  String get connectWifi;

  /// No description provided for @connectWifiDesc.
  ///
  /// In en, this message translates to:
  /// **'Please connect your DePlug power strip to your Wi-Fi by entering your Wi-Fi password.'**
  String get connectWifiDesc;

  /// No description provided for @enterWifiPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your wifi password'**
  String get enterWifiPassword;

  /// No description provided for @renameDevice.
  ///
  /// In en, this message translates to:
  /// **'Rename Device'**
  String get renameDevice;

  /// No description provided for @renameDeviceDesc.
  ///
  /// In en, this message translates to:
  /// **'Rename your device'**
  String get renameDeviceDesc;

  /// No description provided for @enterDeviceName.
  ///
  /// In en, this message translates to:
  /// **'Enter your device name'**
  String get enterDeviceName;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @withdrawOptionWillBe.
  ///
  /// In en, this message translates to:
  /// **'Withdraw option will be available once the mining start.'**
  String get withdrawOptionWillBe;

  /// No description provided for @connectPhantom.
  ///
  /// In en, this message translates to:
  /// **'Connect Phantom'**
  String get connectPhantom;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact US'**
  String get contactUs;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditions;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @id.
  ///
  /// In en, this message translates to:
  /// **'Id'**
  String get id;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @power_down_hour.
  ///
  /// In en, this message translates to:
  /// **'Power Down Hour'**
  String get power_down_hour;

  /// No description provided for @reduce_your_electricity.
  ///
  /// In en, this message translates to:
  /// **'Reduce your electricity usage by 20% during peak hours (6 PM–9 PM) for 3 consecutive days.'**
  String get reduce_your_electricity;

  /// No description provided for @smart_meter_auto_tracks_your_usage.
  ///
  /// In en, this message translates to:
  /// **'Smart meter auto-tracks your usage and confirms the reduction.'**
  String get smart_meter_auto_tracks_your_usage;

  /// No description provided for @earn_peak_saver_badge.
  ///
  /// In en, this message translates to:
  /// **'Earn Peak Saver Badge'**
  String get earn_peak_saver_badge;

  /// No description provided for @weekend_eco_warrior.
  ///
  /// In en, this message translates to:
  /// **'Weekend Eco-Warrior'**
  String get weekend_eco_warrior;

  /// No description provided for @keep_your_energy_consumption_below.
  ///
  /// In en, this message translates to:
  /// **'Keep your energy consumption below 10kWh per day for the entire weekend (Saturday and Sunday).'**
  String get keep_your_energy_consumption_below;

  /// No description provided for @submit_a_screenshot_of_your_weekend.
  ///
  /// In en, this message translates to:
  /// **'Submit a screenshot of your weekend usage summary from the smart meter.'**
  String get submit_a_screenshot_of_your_weekend;

  /// No description provided for @earn_energy_saver_badge.
  ///
  /// In en, this message translates to:
  /// **'Earn Energy Saver Badge'**
  String get earn_energy_saver_badge;

  /// No description provided for @night_saver_challenge.
  ///
  /// In en, this message translates to:
  /// **'Night Saver Challenge'**
  String get night_saver_challenge;

  /// No description provided for @switch_off_all_non_essential_devices.
  ///
  /// In en, this message translates to:
  /// **'Switch off all non-essential devices between 10 PM–6 AM for 5 nights in a row.'**
  String get switch_off_all_non_essential_devices;

  /// No description provided for @smart_meter_data_confirms_minimal_energy.
  ///
  /// In en, this message translates to:
  /// **'Smart meter data confirms minimal energy usage during the designated hours.'**
  String get smart_meter_data_confirms_minimal_energy;

  /// No description provided for @unlock_3x_reward.
  ///
  /// In en, this message translates to:
  /// **'Unlock 3x Reward'**
  String get unlock_3x_reward;

  /// No description provided for @electric_usage.
  ///
  /// In en, this message translates to:
  /// **'Electric Usage'**
  String get electric_usage;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @off.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get off;

  /// No description provided for @unlock_a_yield_boost.
  ///
  /// In en, this message translates to:
  /// **'Unlock a 1.5X yield boost on your next DePlug deposit and a “Night Saver” collectible NFT.'**
  String get unlock_a_yield_boost;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @tfH.
  ///
  /// In en, this message translates to:
  /// **'24 H'**
  String get tfH;

  /// No description provided for @oneH.
  ///
  /// In en, this message translates to:
  /// **'1 H'**
  String get oneH;

  /// No description provided for @oneW.
  ///
  /// In en, this message translates to:
  /// **'1 W'**
  String get oneW;

  /// No description provided for @oneM.
  ///
  /// In en, this message translates to:
  /// **'1 M'**
  String get oneM;

  /// No description provided for @sixM.
  ///
  /// In en, this message translates to:
  /// **'6 M'**
  String get sixM;

  /// No description provided for @oneY.
  ///
  /// In en, this message translates to:
  /// **'1 Y'**
  String get oneY;

  /// No description provided for @proof.
  ///
  /// In en, this message translates to:
  /// **'Proof'**
  String get proof;

  /// No description provided for @reward.
  ///
  /// In en, this message translates to:
  /// **'Reward'**
  String get reward;

  /// No description provided for @green_team_invite.
  ///
  /// In en, this message translates to:
  /// **'Green Team Invite'**
  String get green_team_invite;

  /// No description provided for @phantom_load_hunt.
  ///
  /// In en, this message translates to:
  /// **'Phantom Load Hunt'**
  String get phantom_load_hunt;

  /// No description provided for @daily_energy_pledge.
  ///
  /// In en, this message translates to:
  /// **'Daily Energy Pledge'**
  String get daily_energy_pledge;

  /// No description provided for @take_a_pledge.
  ///
  /// In en, this message translates to:
  /// **'Take a pledge to unplug unused devices today'**
  String get take_a_pledge;

  /// No description provided for @invite_friends_to_deplug.
  ///
  /// In en, this message translates to:
  /// **'Invite friends to Deplug, earn rewards when they join and complete missions.'**
  String get invite_friends_to_deplug;

  /// No description provided for @pledge_to_unplug_unused_devices.
  ///
  /// In en, this message translates to:
  /// **'Pledge to unplug unused devices daily. Build habits, save power, and score points.'**
  String get pledge_to_unplug_unused_devices;

  /// No description provided for @stats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get stats;

  /// No description provided for @energy_saved.
  ///
  /// In en, this message translates to:
  /// **'Energy Saved'**
  String get energy_saved;

  /// No description provided for @points_earned.
  ///
  /// In en, this message translates to:
  /// **'Points Earned'**
  String get points_earned;

  /// No description provided for @friends_invited.
  ///
  /// In en, this message translates to:
  /// **'Friends Invited'**
  String get friends_invited;

  /// No description provided for @daily_streak.
  ///
  /// In en, this message translates to:
  /// **'Daily Streak'**
  String get daily_streak;

  /// No description provided for @start_hunt.
  ///
  /// In en, this message translates to:
  /// **'Start Hunt'**
  String get start_hunt;

  /// No description provided for @invite_now.
  ///
  /// In en, this message translates to:
  /// **'Invite Now'**
  String get invite_now;

  /// No description provided for @view_pledge.
  ///
  /// In en, this message translates to:
  /// **'View Pledge'**
  String get view_pledge;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'back'**
  String get back;

  /// No description provided for @invite_up_to_5_friends.
  ///
  /// In en, this message translates to:
  /// **'Invite up to 5 friends daily.\nEarn points when they join and complete missions.'**
  String get invite_up_to_5_friends;

  /// No description provided for @checkpoints.
  ///
  /// In en, this message translates to:
  /// **'Checkpoints'**
  String get checkpoints;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'copy'**
  String get copy;

  /// No description provided for @unplug_standby_devices.
  ///
  /// In en, this message translates to:
  /// **'Unplug standby devices, check them off, learn tips, and earn points daily.'**
  String get unplug_standby_devices;

  /// No description provided for @entertainment_media.
  ///
  /// In en, this message translates to:
  /// **'Entertainment & Media'**
  String get entertainment_media;

  /// No description provided for @kitchen_appliances.
  ///
  /// In en, this message translates to:
  /// **'Kitchen Appliances'**
  String get kitchen_appliances;

  /// No description provided for @standby_power.
  ///
  /// In en, this message translates to:
  /// **'Standby power'**
  String get standby_power;

  /// No description provided for @office_equipment.
  ///
  /// In en, this message translates to:
  /// **'Office Equipment'**
  String get office_equipment;

  /// No description provided for @submit_hunt.
  ///
  /// In en, this message translates to:
  /// **'Submit Hunt'**
  String get submit_hunt;

  /// No description provided for @refree_code.
  ///
  /// In en, this message translates to:
  /// **'Refree Code'**
  String get refree_code;

  /// No description provided for @phantom_load_hunt_reward_desc.
  ///
  /// In en, this message translates to:
  /// **'Unplug 1–2 devices → +5 points\nUnplug 3–5 devices → +10 points \nUnplug 6+ devices → +15 points \nComplete 5 days in a week → +25 bonus'**
  String get phantom_load_hunt_reward_desc;

  /// No description provided for @invite_friend_rewards_desc.
  ///
  /// In en, this message translates to:
  /// **'Install: You +30 | Friend +20\nMax 5 invites/day'**
  String get invite_friend_rewards_desc;

  /// No description provided for @pledge_rewards_desc.
  ///
  /// In en, this message translates to:
  /// **'Take the pledge → +10 points\nSelect 3+ devices → +5 bonus\nKeep a 3-day streak → +15 bonus'**
  String get pledge_rewards_desc;

  /// No description provided for @noDeviceFound.
  ///
  /// In en, this message translates to:
  /// **'No Device Found'**
  String get noDeviceFound;

  /// No description provided for @checkIn.
  ///
  /// In en, this message translates to:
  /// **'Check In'**
  String get checkIn;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
