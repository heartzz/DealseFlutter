
import 'package:dealse/model/flavor_vo.dart';
import 'package:dealse/service/common/tg_log.dart';
import 'package:dealse/service/common/tg_log_level.dart';

var flavorlist = [
  {
    "name": "dealse",
    "baseUrl": "https://dealse.app/",
    "logLevel": "DEBUG",
    "applyMock": false,
    "mockMappingsFile": "assets/mocks/_mappings.json",
    "params": {
      "productListMaxCount": 10,
      "bankName": "dealse",
      "isTestingMode": false,
      "publickey": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkOsL6rwmY3c7YE+0bW0DjMG/o6+HejNt7lGwCIZseD3gowlcoMt6+0n9rvAMxW5tM3anCQK8wOf93jhcyBolR+cYIoiaN6/kjAd0e8sgkod8jqBzWArfVNYB/VKPukIqKi/wz1kEbLHMdmjpwC64mLmScI4IuZgWz0RjopOT6QH1zX1j3sCvz9sF0NMVrLA4hEA84KA5hMSvAiy0CtAF7ku2kQqrKVQQVUqmQuEptWgC5j1Fea9O/9lrN6s0pnRauQqQ3i7GHIu6/ljIVsY0Jpm3RjCzX2HQDyK+m9kWuKqGHudfom1vK86HqeKgJwFcq9rR9/s2/JVWP1clr95aiQIDAQAB",
      "privatekey": "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDHz1yy/tbdueYwjTkn9UO7TEeybOJOIgg1fosB4N3XnF8BJpyxy5SbmDOO85mtf/s3XzklnV7kAYItsm78Fke+8kZ9N202iraoCRmFuhx94iCnd7fEdVsqwjmufW+NfoXT27vEJxSKA4oIpWPdIdIKyg2eE59NnEIRsRuNAaniXV7d5k4J64q4Y/Hk7T35FfHz4vz8gxB5xBH1OwFPfnvd0SpkM/VJxwU5FvDmf6d+WT3nNgomD2Lc6TSi44A0/oKIDfpxn/mm6CB6DNwaK61tTGzPjz3WveaweR5vaPIEMOsUW2aVJwOX7s4WyV9e32+Va2KNSeubjtQjy1JxCK2VAgMBAAECggEBAL0C2HLuhP0r/KeTAC1fYtoLt4r+WzmEEfXgpch6GgD7CBgDmZjKtuJVIPiqUYaBmXfw2RNPAdN35dgqgbhvryDe+HU8+E/u+giMyxroSkl+nlss8aajSUFyh7QbLmpP9HLL2pwcR96iqHGzWnt1ocbZCfauIzT8irdHrYM+vqDE++B/Q8w/Lnb6UJN9gTbmSyZ4UTsOxvbmbqKtpgHddx4sV+B0vu7JcdZPdQxiYSPHTthb0jsOhi9yHLfAfEyzGYYtSosarrtbtqFOtTgdyirmDMqXw5k3pMjFK3cvBTUjcSNszq4xPNNegJFfTrfbHDbl+9esI5n6oXE0CAaAAmUCgYEA8KG2FvmAnoU0K1i8sh75Gd+8ZO+zP3hecJZ3Qh0hMrf7ABUDHyRmlYArIPEVQucJXlvaQzbcMfPHjpbX3SDW/7ol9cSynTatYGMT9oCdVxIMd5OIaqs5CvArzGE9Oxa8WiricBbHnGrebE1TaZibVVQZAo3muoKu7TZwjQJMxusCgYEA1JI5G8iO/E/kCFAMmfTMdR6UYOR/K3ogJ9voczCEQS8J/iNqu5RgacbuTQVxq7w4+SsgAZeu5taW4GIWlGK8CPhrPP6I74OKaxH1MuxEZEDHmtCzwO9OxZ/UMm9yxnL+AKlTwcDeQL/xtIcOlcyRcf3jb8Cne2rALsMlePmkPX8CgYEA2v6RNX+EqsAXpotvz7uYgQ+56TKtM0pcyKJnjufr2rjN2llFKgZ6xfyLQ8Ok0epqAFIf5aP76goux3pIoprMkJfdDDsjQykLyPjipiiPCTsH1ZuTP2Ds3SOO+MZWb3xVlsoIonJY3+Xy3yXQj/2vAI005bo3De75PDGbZPl+3lkCgYAuBpMS7vP2sZ2gJyTzWMvEOCDMce0PDtxThQvplQGt02+IdUaw4smVXZtPVfRsyM5VNP8zGRKnrKLyZoqZCl/IWXFuvXYM1iBsWnEK25lbU6NkY/fnuGkH5Tleyj7BtThGEGOwOgBlaKn++pcv3CFJ2z0Zf09EK7L87Qf6D6N+JQKBgD/LkbMfJ/QsYRkYE4sQlSv4pZakJtvnLAwgNAdBb0kuvZNPhH60V5gYShZZnuvId4MG/EiCS4WrrsdeutnyNvKC2e27PwcyHfCXcIudQWPaHf++dBEIMgoqHN22qS/DV+iGZM95TKHuDWFFa8T4AZiIqzf5B+sR6F+4a4U6hNPc"
    }
  }
];/// TGFramework's Flavor implementation
class TGFlavor {
  static List<TGFlavorVO>? _flavors;
  static TGFlavorVO? _current;
  static const String ENV_FLAVOR = String.fromEnvironment('flavor');

  /// Initialize
  static void init(String flavor) {
    TGLog.d("TGFlavor : init");
    _load();
  }

  /// Load Flavors & Setup
  static void _load() {
    TGLog.d("TGFlavor._load");
    _loadFlavors();
  }

  /// Load Flavors
  static Future<void> _loadFlavors() async {
    try {
      _flavors = flavorlist.map<TGFlavorVO>((json) => TGFlavorVO.fromJson(json)).toList();
      _loadCurrentFlavor();
    } catch (error) {
      TGLog.e("- - - - - - - - - - - - - - - - - - - - - - -");
      TGLog.e("[ATTN] Flavors configuration file is invalid.");
      TGLog.e("- - - - - - - - - - - - - - - - - - - - - - -");
      TGLog.e(error);
    }
  }

  /// Load Current Flavor
  static void _loadCurrentFlavor() {
    TGLog.d("TGFlavor._loadCurrentFlavor");
    String paramFlavor = ENV_FLAVOR;
    TGLog.d("Argument for flavor = $paramFlavor");

    if (paramFlavor.length == 0) {
      _current = _flavors![0];
    } else {
      // Iterate flavors and match it with provided app flavor
      _flavors!.forEach((flavor) {
        if (paramFlavor.toUpperCase() == flavor.name!.toUpperCase()) _current = flavor;
      });

      // If app flavor doesn't match with provided flavors, take the first flavor from the list as default
      if (_current == null) {
        _current = _flavors![0];
      }
    }

    // Set logLevel to TGLog
    if (_current != null) {
      if (_current!.logLevel != null) TGLog.setLogLevel(_current!.logLevel!);

      TGLog.d("- - - - - - - - - - - - - - - - - - - - - - -");
      TGLog.i(" flavor = " + _current!.name.toString());
      TGLog.d(" baseUrl = " + _current!.baseUrl.toString());
      TGLog.d(" logLevel = " + _current!.logLevel.toString());
      TGLog.i(" applyMock = " + _current!.applyMock.toString());
      if (_current!.applyMock == true) TGLog.d(" mockMappingsFile = " + _current!.mockMappingsFile.toString());
      TGLog.d(" params = " + _current!.params.toString());
      TGLog.d("- - - - - - - - - - - - - - - - - - - - - - -");
    } else {
      TGLog.e("- - - - - - - - - - - - - - - - - - - - - -");
      TGLog.e("[ATTN] Unable to load flavor configuration.");
      TGLog.e("- - - - - - - - - - - - - - - - - - - - - -");
    }
  }

  /// Gets Base Url
  static String name() {
    String? name = _current?.name;
    return name != null ? name : "";
  }

  /// Gets Base Url
  static String baseUrl() {
    String? baseUrl = _current?.baseUrl;
    return baseUrl != null ? baseUrl : "";
  }

  /// Gets Base Url
  static TGLogLevel? logLevel() {
    TGLogLevel? logLevel = _current?.logLevel;
    return logLevel != null ? logLevel : TGLogLevel.DEBUG;
  }

  /// Gets Apply Mock
  static bool applyMock() {
    return _current!.applyMock!;
  }

  /// Gets Base Url
  static String mockMappingsFile() {
    String? mockMappingsFile = _current?.mockMappingsFile;
    return mockMappingsFile != null ? mockMappingsFile : "";
  }

  /// Gets param value for given key
  static dynamic param(String key) {
    Map<String, dynamic>? params = _current!.params;
    if (params == null) return null;
    return params[key];
  }
}
