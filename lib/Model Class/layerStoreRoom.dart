import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'layerStoreRoom.g.dart';

@HiveType(typeId: 1)
class LayerStorage extends HiveObject{
  @HiveField(2)
  late List<Widget> storedLayer;
  @HiveField(3)
   bool newProject = true;
}