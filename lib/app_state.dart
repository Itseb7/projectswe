import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_SecondSecorityLayerConfig') !=
          null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_SecondSecorityLayerConfig') ??
                  '{}';
          _SecondSecorityLayerConfig =
              SecondSecurityLayerStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _SearchHistory = await secureStorage.getStringList('ff_SearchHistory') ??
          _SearchHistory;
    });
    await _safeInitAsync(() async {
      _SyncedContacts = (await secureStorage.getStringList('ff_SyncedContacts'))
              ?.map((x) {
                try {
                  return ContactStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _SyncedContacts;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_NotificationConfiguration') !=
          null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_NotificationConfiguration') ??
                  '{}';
          _NotificationConfiguration =
              NotificationConfiguresStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _ShippingMethod =
          await secureStorage.getString('ff_ShippingMethod') ?? _ShippingMethod;
    });
    await _safeInitAsync(() async {
      _PaymentMethod =
          await secureStorage.getString('ff_PaymentMethod') ?? _PaymentMethod;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _toggle = false;
  bool get toggle => _toggle;
  set toggle(bool value) {
    _toggle = value;
  }

  DefaultsStruct _defaults = DefaultsStruct.fromSerializableMap(jsonDecode(
      '{\"brandName\":\"Evira\",\"brandTagline\":\"Best seller e-com market\",\"avatarDefaultImage\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/l260dcr57pr2/user-default.png\",\"imagesDefaultImage\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/netron-e-com-mobile-6rhojr/assets/a105n0zo09d5/images.png\",\"DateOfBirth\":\"Date Of Birth dd/mm/yy\"}'));
  DefaultsStruct get defaults => _defaults;
  set defaults(DefaultsStruct value) {
    _defaults = value;
  }

  void updateDefaultsStruct(Function(DefaultsStruct) updateFn) {
    updateFn(_defaults);
  }

  SecondSecurityLayerStruct _SecondSecorityLayerConfig =
      SecondSecurityLayerStruct.fromSerializableMap(
          jsonDecode('{\"enable\":\"true\"}'));
  SecondSecurityLayerStruct get SecondSecorityLayerConfig =>
      _SecondSecorityLayerConfig;
  set SecondSecorityLayerConfig(SecondSecurityLayerStruct value) {
    _SecondSecorityLayerConfig = value;
    secureStorage.setString('ff_SecondSecorityLayerConfig', value.serialize());
  }

  void deleteSecondSecorityLayerConfig() {
    secureStorage.delete(key: 'ff_SecondSecorityLayerConfig');
  }

  void updateSecondSecorityLayerConfigStruct(
      Function(SecondSecurityLayerStruct) updateFn) {
    updateFn(_SecondSecorityLayerConfig);
    secureStorage.setString(
        'ff_SecondSecorityLayerConfig', _SecondSecorityLayerConfig.serialize());
  }

  bool _secondSecurityMesureIsGuranteed = false;
  bool get secondSecurityMesureIsGuranteed => _secondSecurityMesureIsGuranteed;
  set secondSecurityMesureIsGuranteed(bool value) {
    _secondSecurityMesureIsGuranteed = value;
  }

  List<String> _Categories = ['All', 'Clothe', 'Shoe', 'Kitchen'];
  List<String> get Categories => _Categories;
  set Categories(List<String> value) {
    _Categories = value;
  }

  void addToCategories(String value) {
    Categories.add(value);
  }

  void removeFromCategories(String value) {
    Categories.remove(value);
  }

  void removeAtIndexFromCategories(int index) {
    Categories.removeAt(index);
  }

  void updateCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Categories[index] = updateFn(_Categories[index]);
  }

  void insertAtIndexInCategories(int index, String value) {
    Categories.insert(index, value);
  }

  List<String> _SearchHistory = ['Women', 'Shoe'];
  List<String> get SearchHistory => _SearchHistory;
  set SearchHistory(List<String> value) {
    _SearchHistory = value;
    secureStorage.setStringList('ff_SearchHistory', value);
  }

  void deleteSearchHistory() {
    secureStorage.delete(key: 'ff_SearchHistory');
  }

  void addToSearchHistory(String value) {
    SearchHistory.add(value);
    secureStorage.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void removeFromSearchHistory(String value) {
    SearchHistory.remove(value);
    secureStorage.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void removeAtIndexFromSearchHistory(int index) {
    SearchHistory.removeAt(index);
    secureStorage.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void updateSearchHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SearchHistory[index] = updateFn(_SearchHistory[index]);
    secureStorage.setStringList('ff_SearchHistory', _SearchHistory);
  }

  void insertAtIndexInSearchHistory(int index, String value) {
    SearchHistory.insert(index, value);
    secureStorage.setStringList('ff_SearchHistory', _SearchHistory);
  }

  List<ContactStruct> _SyncedContacts = [
    ContactStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Sozan Miracle\",\"phone\":\"+1 304 566 7887\",\"shortName\":\"SM\",\"invited\":\"true\"}')),
    ContactStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Jessica Williams\",\"phone\":\"+1 433 980 7656\",\"shortName\":\"JW\",\"invited\":\"true\"}'))
  ];
  List<ContactStruct> get SyncedContacts => _SyncedContacts;
  set SyncedContacts(List<ContactStruct> value) {
    _SyncedContacts = value;
    secureStorage.setStringList(
        'ff_SyncedContacts', value.map((x) => x.serialize()).toList());
  }

  void deleteSyncedContacts() {
    secureStorage.delete(key: 'ff_SyncedContacts');
  }

  void addToSyncedContacts(ContactStruct value) {
    SyncedContacts.add(value);
    secureStorage.setStringList('ff_SyncedContacts',
        _SyncedContacts.map((x) => x.serialize()).toList());
  }

  void removeFromSyncedContacts(ContactStruct value) {
    SyncedContacts.remove(value);
    secureStorage.setStringList('ff_SyncedContacts',
        _SyncedContacts.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSyncedContacts(int index) {
    SyncedContacts.removeAt(index);
    secureStorage.setStringList('ff_SyncedContacts',
        _SyncedContacts.map((x) => x.serialize()).toList());
  }

  void updateSyncedContactsAtIndex(
    int index,
    ContactStruct Function(ContactStruct) updateFn,
  ) {
    SyncedContacts[index] = updateFn(_SyncedContacts[index]);
    secureStorage.setStringList('ff_SyncedContacts',
        _SyncedContacts.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSyncedContacts(int index, ContactStruct value) {
    SyncedContacts.insert(index, value);
    secureStorage.setStringList('ff_SyncedContacts',
        _SyncedContacts.map((x) => x.serialize()).toList());
  }

  String _HomePagePath = '';
  String get HomePagePath => _HomePagePath;
  set HomePagePath(String value) {
    _HomePagePath = value;
  }

  NotificationConfiguresStruct _NotificationConfiguration =
      NotificationConfiguresStruct.fromSerializableMap(jsonDecode(
          '{\"EnableNotification\":\"true\",\"Sound\":\"true\",\"Vibrate\":\"false\",\"SpecialOffers\":\"true\",\"PromoDiscount\":\"true\",\"Cashback\":\"true\",\"NewServices\":\"true\"}'));
  NotificationConfiguresStruct get NotificationConfiguration =>
      _NotificationConfiguration;
  set NotificationConfiguration(NotificationConfiguresStruct value) {
    _NotificationConfiguration = value;
    secureStorage.setString('ff_NotificationConfiguration', value.serialize());
  }

  void deleteNotificationConfiguration() {
    secureStorage.delete(key: 'ff_NotificationConfiguration');
  }

  void updateNotificationConfigurationStruct(
      Function(NotificationConfiguresStruct) updateFn) {
    updateFn(_NotificationConfiguration);
    secureStorage.setString(
        'ff_NotificationConfiguration', _NotificationConfiguration.serialize());
  }

  String _ShippingMethod = 'International';
  String get ShippingMethod => _ShippingMethod;
  set ShippingMethod(String value) {
    _ShippingMethod = value;
    secureStorage.setString('ff_ShippingMethod', value);
  }

  void deleteShippingMethod() {
    secureStorage.delete(key: 'ff_ShippingMethod');
  }

  String _PaymentMethod = 'E-Wallet';
  String get PaymentMethod => _PaymentMethod;
  set PaymentMethod(String value) {
    _PaymentMethod = value;
    secureStorage.setString('ff_PaymentMethod', value);
  }

  void deletePaymentMethod() {
    secureStorage.delete(key: 'ff_PaymentMethod');
  }

  String _CardNumber = '';
  String get CardNumber => _CardNumber;
  set CardNumber(String value) {
    _CardNumber = value;
  }

  String _expir = '';
  String get expir => _expir;
  set expir(String value) {
    _expir = value;
  }

  int _cvv = 0;
  int get cvv => _cvv;
  set cvv(int value) {
    _cvv = value;
  }

  String _cardholderName = '';
  String get cardholderName => _cardholderName;
  set cardholderName(String value) {
    _cardholderName = value;
  }

  bool _isButtonEnabled = true;
  bool get isButtonEnabled => _isButtonEnabled;
  set isButtonEnabled(bool value) {
    _isButtonEnabled = value;
  }

  List<dynamic> _selectedTickets = [];
  List<dynamic> get selectedTickets => _selectedTickets;
  set selectedTickets(List<dynamic> value) {
    _selectedTickets = value;
  }

  void addToSelectedTickets(dynamic value) {
    selectedTickets.add(value);
  }

  void removeFromSelectedTickets(dynamic value) {
    selectedTickets.remove(value);
  }

  void removeAtIndexFromSelectedTickets(int index) {
    selectedTickets.removeAt(index);
  }

  void updateSelectedTicketsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    selectedTickets[index] = updateFn(_selectedTickets[index]);
  }

  void insertAtIndexInSelectedTickets(int index, dynamic value) {
    selectedTickets.insert(index, value);
  }

  List<dynamic> _specialTickets = [];
  List<dynamic> get specialTickets => _specialTickets;
  set specialTickets(List<dynamic> value) {
    _specialTickets = value;
  }

  void addToSpecialTickets(dynamic value) {
    specialTickets.add(value);
  }

  void removeFromSpecialTickets(dynamic value) {
    specialTickets.remove(value);
  }

  void removeAtIndexFromSpecialTickets(int index) {
    specialTickets.removeAt(index);
  }

  void updateSpecialTicketsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    specialTickets[index] = updateFn(_specialTickets[index]);
  }

  void insertAtIndexInSpecialTickets(int index, dynamic value) {
    specialTickets.insert(index, value);
  }

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;
  set totalPrice(int value) {
    _totalPrice = value;
  }

  String _selectPaymentMethod = '';
  String get selectPaymentMethod => _selectPaymentMethod;
  set selectPaymentMethod(String value) {
    _selectPaymentMethod = value;
  }

  String _fullNameOnCard = '';
  String get fullNameOnCard => _fullNameOnCard;
  set fullNameOnCard(String value) {
    _fullNameOnCard = value;
  }

  double _ticketPrice = 0.0;
  double get ticketPrice => _ticketPrice;
  set ticketPrice(double value) {
    _ticketPrice = value;
  }

  int _quantity = 0;
  int get quantity => _quantity;
  set quantity(int value) {
    _quantity = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
