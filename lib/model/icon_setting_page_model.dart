import 'package:flutter/material.dart';
import 'package:todo_list/i10n/localization_intl.dart';
import 'package:todo_list/json/task_icon_bean.dart';
import 'package:todo_list/logic/all_logic.dart';
import 'package:todo_list/utils/icon_list_util.dart';
import 'package:todo_list/utils/theme_util.dart';

class IconSettingPageModel extends ChangeNotifier {
  IconSettingPageLogic logic;
  BuildContext context;

  List<TaskIconBean> taskIcons = [];
  List<IconBean> showIcons = [];
  List<IconBean> searchIcons = [];
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();


  Color currentPickerColor = Colors.black;
  String currentIconName = "";
  bool isDeleting = false;
  bool isSearching = false;

  IconSettingPageModel() {
    logic = IconSettingPageLogic(this);
  }

  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
      Future.wait([
        logic.getTaskIconList(),
        logic.getIconList(),
      ]).then((value) {
        refresh();
      });
    }
  }

  @override
  void dispose() {
    textEditingController?.dispose();
    focusNode?.dispose();
    super.dispose();
    debugPrint("IconSettingPageModel销毁了");
  }

  void refresh() {
    notifyListeners();
  }
}
