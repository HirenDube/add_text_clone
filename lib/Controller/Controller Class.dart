import 'package:add_text_clone/Model%20Class/layerStoreRoom.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveController {
  static get getBox {

    return Hive.box("progressStorage");
  }

  static get getLayer {
    Box storage = getBox;
    LayerStorage ob = storage.get("progress");
    return ob;
  }

  static set storeLayer(Object object) {
    Box storage = getBox;
    storage.put("progress", object);
  }

  static set deleteLayer(object) {
    object.delete();
  }

}