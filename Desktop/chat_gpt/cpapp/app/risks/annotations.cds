using RiskService as service from '../../srv/risk-service';
using from '../../srv/risks-service-ui';


annotate service.Risks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : '{i18n>Title}',
        },
        {
            $Type : 'UI.DataField',
            Value : miti_ID,
            Label : '{i18n>Mitigation}',
        },
        {
            $Type : 'UI.DataField',
            Value : prio,
            Criticality : criticality,
            Label : '{i18n>Priority}',
        },
        {
            $Type : 'UI.DataField',
            Value : impact,
            Criticality : criticality,
            Label : '{i18n>Impact}',
        },
    ]
);

using from '../../srv/risks-service-ui';


annotate service.Risks with {
    miti @Common.ValueList : {
        Label : '{i18n>Mitigations}',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};


annotate service.Risks with {
    prio @Common.Label : '{i18n>Priority}'
};
annotate service.Risks with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Main}',
            Target : '@UI.FieldGroup#Main',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Priority}',
            ID : 'i18nPriority',
            Target : '@UI.FieldGroup#i18nPriority',
        },
    ],
    UI.FieldGroup #Main : {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : '{i18n>Mitigation}',
            },
            {
                $Type : 'UI.DataField',
                Value : prio,
                Criticality : criticality,
                Label : '{i18n>Priority}',
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Criticality : criticality,
                Label : '{i18n>Impact}',
            },
        ],
    },
    UI.HeaderInfo : {
        TypeName : '{i18n>Risk}',
        TypeNamePlural : '{i18n>Risks}',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
    }
);
annotate service.Risks with @(
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.ConnectedFields#connected',
            Label : 'Impact',
        },]
);
annotate service.Risks with @(
    UI.ConnectedFields #connected : {
        $Type : 'UI.ConnectedFieldsType',
        Template : '{descr},{prio}',
        Data : {
            $Type : 'Core.Dictionary',
            descr : {
                $Type : 'UI.DataField',
                Value : descr,
            },
            prio : {
                $Type : 'UI.DataField',
                Value : prio,
            },
        },
    }
);
annotate service.Risks with @(
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View',
    }
);
annotate service.Mitigations with @(
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Value : risks.miti.createdBy,
        },{
            $Type : 'UI.DataField',
            Value : risks.miti.owner,
        },{
            $Type : 'UI.DataField',
            Value : risks.miti.timeline,
        },],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View Mitigations',
    }
);
annotate service.Mitigations with @(
    UI.LineItem #tableView1 : [
        {
            $Type : 'UI.DataField',
            Value : risks.prio,
        },{
            $Type : 'UI.DataField',
            Value : risks.miti.description,
        },{
            $Type : 'UI.DataField',
            Value : risks.miti.owner,
        },{
            $Type : 'UI.DataField',
            Value : risks.miti.timeline,
        },{
            $Type : 'UI.DataField',
            Value : risks.miti.createdAt,
        },],
    UI.SelectionPresentationVariant #tableView1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView1',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View Mitigations 1',
    }
);
annotate service.Risks with @(
    UI.FieldGroup #i18nImpact : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti.owner,
            },{
                $Type : 'UI.DataField',
                Value : miti.timeline,
            },{
                $Type : 'UI.DataField',
                Value : miti.description,
            },{
                $Type : 'UI.DataField',
                Value : miti.createdBy,
            },],
    }
);
annotate service.Risks with @(
    UI.FieldGroup #i18nPriority : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti.risks.prio,
            },{
                $Type : 'UI.DataField',
                Value : miti.risks.title,
            },{
                $Type : 'UI.DataField',
                Value : miti.risks.ID,
                Label : 'ID',
            },{
                $Type : 'UI.DataField',
                Value : miti.risks.miti.risks.impact,
                Criticality : criticality,
            },{
                $Type : 'UI.DataField',
                Value : miti.risks.miti.risks.descr,
            },{
                $Type : 'UI.DataField',
                Value : miti.risks.miti.risks.criticality,
                Label : '{i18n>Criticallity}',
                Criticality : criticality,
                CriticalityRepresentation : #WithoutIcon,
            },],
    }
);
annotate service.Risks with {
    criticality @Common.Text : {
            $value : prio,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
