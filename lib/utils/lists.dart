import 'package:operations/common/appbars/tabs_app_bar/tabs_app_bar.dart';
import 'package:operations/models/sort_item.dart';
import 'package:operations/screens/installation_details/views/widgets/client_tab.dart';
import 'package:operations/screens/installation_details/views/widgets/comments_tab.dart';
import 'package:operations/screens/installation_details/views/widgets/details_tab.dart';
import 'package:operations/screens/installation_details/views/widgets/main_info_tab.dart';
import 'package:operations/screens/installation_details/views/widgets/processes_tab.dart';
import 'package:operations/screens/installation_details/views/widgets/sub_contractor_tab.dart';
import 'package:operations/screens/operating_details/views/widgets/client_tab.dart';
import 'package:operations/screens/operating_details/views/widgets/comments_tab.dart';
import 'package:operations/screens/operating_details/views/widgets/details_tab.dart';
import 'package:operations/screens/operating_details/views/widgets/main_info_tab.dart';
import 'package:operations/screens/operating_details/views/widgets/processes_tab.dart';
import 'package:operations/screens/operating_details/views/widgets/sub_contractor_tab.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/consts.dart';

class Lists {
  static List<TabItem> tabsItems = [
    TabItem(
      icon: Assets.editTabIcon,
      index: 0,
    ),
    TabItem(
      icon: Assets.stagesTabIcon,
      index: 1,
    ),
    TabItem(
      icon: Assets.detailsTabIcon,
      index: 2,
    ),
    TabItem(
      icon: Assets.commentsTabIcon,
      index: 3,
    ),
    TabItem(
      icon: Assets.subcontractorTabIcon,
      index: 4,
    ),
    TabItem(
      icon: Assets.customerTabIcon,
      index: 5,
    ),
  ];

  static List admins = [
    'Ahmad Zaid',
    'Ahmad Zaid',
  ];

  static List<String> sales = [
    'lead',
    'opportunity',
    'contract',
  ];

  static List<String> operations = [
    'installation',
    'operating',
  ];

  static List<String> maintenance = [
    'openTask',
    'openOrder',
  ];

  static List<String> hr = [
    'checkInOut',
  ];

  static List installationDetailsTab = [
    MainInfoTab(),
    const ProcessesTab(),
    const DetailsTab(),
    const CommentsTab(),
    const SubContractorTab(),
    const ClientTab(),
  ];

  static List operatingDetailsTab = [
    OperatingMainInfoTab(),
    const OperatingProcessesTab(),
    const OperatingDetailsTab(),
    const OperatingCommentsTab(),
    const OperatingSubContractorTab(),
    const OperatingClientTab(),
  ];

  static List sorting = [
    SortItem(Consts.orderDate),
    SortItem(Consts.id),
    SortItem(Consts.city),
    SortItem(Consts.govern),
  ];

  static List users = [
    'Client',
    'Admin',
  ];
}
