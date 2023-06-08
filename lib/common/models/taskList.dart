import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';

// task item 관리

class ItemData {
  final String name;
  final IconData icon;

  ItemData({required this.name, required this.icon});
}

// -------------------모든 task가 담겨있는 list--------------------
class AllTaskList {
  static final List<ItemData> itemList = [
    ItemData(name: "schedule", icon: MaterialSymbols.calendar_month),
    ItemData(name: "starter", icon: MaterialSymbols.where_to_vote),
    ItemData(name: "and", icon: MaterialSymbols.terminal),
    ItemData(name: "or", icon: MaterialSymbols.terminal),
    ItemData(name: "sleep", icon: MaterialSymbols.dark_mode),
    ItemData(name: "jobStatus", icon: MaterialSymbols.hourglass_empty),
    ItemData(name: "executeJob", icon: MaterialSymbols.play_arrow_filled),
  ];
}

// ----------------- 즐겨찾기에 등록된 task list -------------------
class FavoriteTaskList {
  static final List<ItemData> itemList = [
    ItemData(name: "schedule", icon: MaterialSymbols.calendar_month),
    ItemData(name: "sleep", icon: MaterialSymbols.dark_mode),
    ItemData(name: "jobStatus", icon: MaterialSymbols.hourglass_empty),
  ];
}

// ---------------------accordion에 들어갈 task list들-------------------------
List<Map<String, List<ItemData>>> taskLists = [
  {
    'task list 1': [
      ItemData(name: "schedule", icon: MaterialSymbols.calendar_month),
      ItemData(name: "starter", icon: MaterialSymbols.where_to_vote),
    ],
  },
  {
    'task list 2': [
      ItemData(name: "and", icon: MaterialSymbols.terminal),
      ItemData(name: "or", icon: MaterialSymbols.terminal),
      ItemData(name: "sleep", icon: MaterialSymbols.dark_mode),
    ],
  },
  {
    'task list 3': [
      ItemData(name: "jobStatus", icon: MaterialSymbols.hourglass_empty),
      ItemData(name: "executeJob", icon: MaterialSymbols.play_arrow_filled),
    ],
  },
  {
    'task list 4': [
      // 해당 영역 스크롤 테스트 목적 리스트, 후에 삭제 예정
      ItemData(name: "jobStatus", icon: MaterialSymbols.hourglass_empty),
      ItemData(name: "executeJob", icon: MaterialSymbols.play_arrow_filled),
      ItemData(name: "jobStatus", icon: MaterialSymbols.hourglass_empty),
      ItemData(name: "executeJob", icon: MaterialSymbols.play_arrow_filled),
      ItemData(name: "jobStatus", icon: MaterialSymbols.hourglass_empty),
      ItemData(name: "executeJob", icon: MaterialSymbols.play_arrow_filled),
      ItemData(name: "jobStatus", icon: MaterialSymbols.hourglass_empty),
      ItemData(name: "executeJob", icon: MaterialSymbols.play_arrow_filled),
      ItemData(name: "jobStatus", icon: MaterialSymbols.hourglass_empty),
      ItemData(name: "executeJob", icon: MaterialSymbols.play_arrow_filled),
      ItemData(name: "jobStatus", icon: MaterialSymbols.hourglass_empty),
      ItemData(name: "executeJob", icon: MaterialSymbols.play_arrow_filled),
      ItemData(name: "jobStatus", icon: MaterialSymbols.hourglass_empty),
      ItemData(name: "executeJob", icon: MaterialSymbols.play_arrow_filled),
    ],
  },
];
