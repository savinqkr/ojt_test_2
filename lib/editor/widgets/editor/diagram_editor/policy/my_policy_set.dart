import 'package:diagram_editor/diagram_editor.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/canvas_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/canvas_widgets_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/component_design_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/component_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/component_widgets_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/custom_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/init_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/link_attachment_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/link_widgets_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/my_link_control_policy.dart';
import 'package:ojt_test_2/editor/widgets/editor/diagram_editor/policy/my_link_joint_control_policy.dart';

class MyPolicySet extends PolicySet
    with
        MyInitPolicy, // 초기 화면에 그려지는 component 관련
        MyCanvasPolicy, // multiple select 관련
        MyComponentPolicy, // conponent 클릭 시 나오는 위젯 관련
        MyComponentDesignPolicy,
        MyLinkControlPolicy, // joint 생성과 관련
        MyLinkJointControlPolicy, // 이미 생성된 joint를 움직이는 것과 관련
        MyLinkWidgetsPolicy,
        MyLinkAttachmentPolicy, // 링크 연결 시 연결점 관련
        MyCanvasWidgetsPolicy,
        MyComponentWidgetsPolicy,
        //
        CanvasControlPolicy,
        //
        CustomStatePolicy,
        CustomBehaviourPolicy {}
