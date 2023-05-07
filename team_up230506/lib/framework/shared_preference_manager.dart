


class SharedPreferenceManager
{
  static final  Map<String, dynamic> values = <String, dynamic>{};

  static void setValue <T>(String key, T value)  {
    values[key] = value; 
  }

  static T getValue <T>(String key)  {
    return values[key];
  }

  static void clearDefaults() {
    values.clear();
  }
}

