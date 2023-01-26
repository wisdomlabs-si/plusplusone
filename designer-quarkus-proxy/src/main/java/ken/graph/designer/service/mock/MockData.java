package ken.graph.designer.service.mock;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import ken.graph.designer.model.ActionDef;
import ken.graph.designer.model.ActionDefParameter;
import ken.graph.designer.model.ActionResultData;
import ken.graph.designer.model.ViewModel;
import ken.graph.designer.model.ViewModelDef;
import ken.graph.designer.model.ViewNode;
import ken.graph.designer.model.ViewProperty;
import ken.graph.designer.model.ViewRel;

/**
 * @author Tomo Cesnik
 */
public final class MockData {
    private MockData() {
    }

    public static List<ViewModel> create() {
        return List.of(createMockViewModel1(), createMockViewModel2());
    }

    private static ViewModel createMockViewModel1() {
        ViewNode n1 = new ViewNode(randomUuid(), "Node1", Collections.emptyList(), "Node1", 0, 0, "#A1E8AF",
                "annotation", 70, Collections.emptyList());
        ViewNode n2 = new ViewNode(randomUuid(), "Node2", Collections.emptyList(), "Node2", 300, 300, "#94C595", null,
                90, Collections.emptyList());

        ViewRel r1 = new ViewRel(randomUuid(), n1.uuid(), n2.uuid(), "REL1", Collections.emptyList(), "REL1", "#372772",
                null, "solid", 1, Collections.emptyList());

        return new ViewModel(new ViewModelDef(randomUuid(), "First"), List.of(n1, n2), List.of(r1),
                Collections.emptyList());
    }

    private static ViewModel createMockViewModel2() {
        ActionDef a1 = new ActionDef(randomUuid(), "Action 1", false,"Group 1", "annotation",
                List.of(new ActionDefParameter("param1", "textField", null), new ActionDefParameter("param2", "numberField", null),
                        new ActionDefParameter("param3", "textArea", null), new ActionDefParameter("param4", "colorPicker", null),
                        new ActionDefParameter("param5", "iconPicker", null)));
        ActionDef a2 = new ActionDef(randomUuid(), "Action 2", false, "Group 1", null, Collections.emptyList());
        ActionDef a3 = new ActionDef(randomUuid(), "Action 3", false, null, null, Collections.emptyList());
        List<ActionDef> actions = List.of(a1, a2, a3);

        List<ViewProperty> props = List.of(new ViewProperty("prop1", "value1"), new ViewProperty("prop2", "value2"));

        List<ActionDef> nodeActions = new ArrayList<>();
        nodeActions.addAll(HardCodedActions.nodeActions());
        nodeActions.addAll(actions);
        ViewNode n1 = new ViewNode(randomUuid(), "Node1", props, "Custom Caption N1", 0, 0, "#A1E8AF", "cube", 60,
                nodeActions);
        ViewNode n2 = new ViewNode(randomUuid(), "Node2", props, "Custom Caption N2", 300, 300, "#94C595", null, 80,
                HardCodedActions.nodeActions());
        ViewNode n3 = new ViewNode(randomUuid(), "Node3", props, "Custom Caption N3", 0, 300, "#747C92", null, 100,
                HardCodedActions.nodeActions());

        List<ActionDef> relActions = new ArrayList<>();
        relActions.addAll(HardCodedActions.relActions());
        relActions.addAll(actions);
        ViewRel r1 = new ViewRel(randomUuid(), n1.uuid(), n2.uuid(), "REL1", props, "Custom Caption R1", "#372772",
                null, "solid", 1, relActions);
        ViewRel r2 = new ViewRel(randomUuid(), n3.uuid(), n2.uuid(), "REL2", props, "Custom Caption R2", "#3A2449",
                "cube", "dashed", 2, relActions);
        ViewRel r3 = new ViewRel(randomUuid(), n2.uuid(), n1.uuid(), "REL3", Collections.emptyList(),
                "Custom Caption R3", "#42273B", null, "dotted", 1, HardCodedActions.relActions());

        List<ActionDef> viewActions = new ArrayList<>();
        viewActions.addAll(HardCodedActions.viewActions());
        viewActions.addAll(actions);
        return new ViewModel(new ViewModelDef(randomUuid(), "Second"), List.of(n1, n2, n3), List.of(r1, r2, r3),
                viewActions);

    }

    public static ActionResultData createActionResult() {
        ViewNode n1 = new ViewNode(randomUuid(), "Node1", Collections.emptyList(), "Node1", 0, 0, "#A1E8AF",
            "annotation", 70, Collections.emptyList());
        ViewNode n2 = new ViewNode(randomUuid(), "Node2", Collections.emptyList(), "Node2", 300, 300, "#94C595", null,
            90, Collections.emptyList());

        ViewRel r1 = new ViewRel(randomUuid(), n1.uuid(), n2.uuid(), "REL1", Collections.emptyList(), "REL1", "#372772",
            null, "solid", 1, Collections.emptyList());

        return new ActionResultData(Arrays.asList(n1,n2), Collections.singletonList(r1));
    }

    private static String randomUuid() {
        return UUID.randomUUID().toString();
    }
}
