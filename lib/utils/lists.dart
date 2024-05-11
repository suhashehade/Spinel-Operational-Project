import 'package:operations/models/comment/comment.dart';
import 'package:operations/models/cost/other_cost.dart';
import 'package:operations/models/level/level.dart';
import 'package:operations/models/level/level_details_item.dart';
import 'package:operations/models/order/order.dart';
import 'package:operations/screens/account_screen/views/account_screen.dart';
import 'package:operations/screens/details_screen/views/details_screen.dart';
import 'package:operations/screens/edit_info_screen/views/edit_info_screen.dart';
import 'package:operations/screens/home_screen/views/home_screen.dart';
import 'package:operations/screens/levels/views/levels.dart';
import 'package:operations/utils/assets.dart';
import 'package:operations/utils/consts.dart';

class Lists {
  static List mainPageScreens = [
    const HomeScreen(),
    const LevelsView(),
    const EditInfoScreen(),
    const DetailsScreen(),
    const AccountScreen(),
  ];

  static List<Order> orders = [
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.7, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.8, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.3, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.6, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.6, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.3, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.6, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.6, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.3, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.6, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.3, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 0.3, levels),
    Order('ساندي', 'Sandi', '22/5/2024', true, 1.0, levels),
  ];

  static List<String> orderStatus = [Consts.active, Consts.notActive];

  static List<Level> levels = [
    Level(
      'check level A',
      'description',
      'startDate',
      'endDate',
      'admin',
      'notes',
      'customerName',
      'secondaryPartner',
      'comments',
      'details',
      false,
      0.4,
    ),
    Level(
      'check level B',
      'description',
      'startDate',
      'endDate',
      'admin',
      'notes',
      'customerName',
      'secondaryPartner',
      'comments',
      'details',
      false,
      0.6,
    ),
    Level(
      'start service',
      'description',
      'startDate',
      'endDate',
      'admin',
      'notes',
      'customerName',
      'secondaryPartner',
      'comments',
      'details',
      false,
      1.0,
    ),
    Level(
      'check level C',
      'description',
      'startDate',
      'endDate',
      'admin',
      'notes',
      'customerName',
      'secondaryPartner',
      'comments',
      'details',
      false,
      0.5,
    ),
    Level(
      'working',
      'description',
      'startDate',
      'endDate',
      'admin',
      'notes',
      'customerName',
      'secondaryPartner',
      'comments',
      'details',
      false,
      0.7,
    ),
    Level(
      'check level D',
      'description',
      'startDate',
      'endDate',
      'admin',
      'notes',
      'customerName',
      'secondaryPartner',
      'comments',
      'details',
      false,
      0.6,
    ),
  ];
  static List admins = [
    'Ahmad Zaid',
    'Ahmad Zaid',
  ];
  static List<LevelDetailsItem> levelDetailsItems = [
    LevelDetailsItem('Item 1', 1, 'note 1'),
    LevelDetailsItem('Item 2', 1, 'note 2'),
    LevelDetailsItem('Item 3', 1, 'note 3'),
    LevelDetailsItem('Item 4', 1, 'note 4'),
    LevelDetailsItem('Item 5', 1, 'note 5'),
    LevelDetailsItem('Item 6', 1, 'note 6'),
    LevelDetailsItem('Item 7', 1, 'note 7'),
    LevelDetailsItem('Item 8', 1, 'note 8'),
  ];

  static List<OtherCost> otherCosts = [
    OtherCost(200, 'nothing'),
    OtherCost(200, 'nothing'),
    OtherCost(200, 'nothing'),
    OtherCost(200, 'nothing'),
    OtherCost(200, 'nothing'),
    OtherCost(200, 'nothing'),
  ];

  static List<Comment> comments = [
    Comment('Ahmad Zaid', 'test 1', Assets.profilePicture),
    Comment('Ahmad Zaid', 'test 1', Assets.profilePicture),
    Comment('Ahmad Zaid', 'test 1', Assets.profilePicture),
    Comment('Ahmad Zaid', 'test 1', Assets.profilePicture),
  ];
}
