
using from './risks/annotations';

using from './mitigations/annotations';
annotate RiskService.Mitigations with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : risks.descr,
            Label : '{i18n>Description}',
            ![@UI.Importance] : #High,
        },
    ]
);

using from './risk-analysis/annotations';