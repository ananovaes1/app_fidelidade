using { app_fidelidadeSrv } from '../srv/service.cds';

annotate app_fidelidadeSrv.Customers with @UI.HeaderInfo: { TypeName: 'Customer', TypeNamePlural: 'Customers', Title: { Value: name } };
annotate app_fidelidadeSrv.Customers with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate app_fidelidadeSrv.Customers with @UI.Identification: [{ Value: name }];
annotate app_fidelidadeSrv.Customers with @UI.DataPoint #customerNumber: {
  Value: customerNumber,
  Title: 'Customer Number',
};
annotate app_fidelidadeSrv.Customers with {
  name @title: 'Name';
  email @title: 'Email';
  customerNumber @title: 'Customer Number';
  totalPurchaseValue @title: 'Total Purchase Value';
  totalRewardPoints @title: 'Total Reward Points';
  totalRedeemedRewardPoints @title: 'Total Redeemed Reward Points'
};

annotate app_fidelidadeSrv.Customers with @UI.LineItem: [
  { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerNumber },
    { $Type: 'UI.DataField', Value: totalPurchaseValue },
    { $Type: 'UI.DataField', Value: totalRewardPoints },
    { $Type: 'UI.DataField', Value: totalRedeemedRewardPoints }
];

annotate app_fidelidadeSrv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerNumber },
    { $Type: 'UI.DataField', Value: totalPurchaseValue },
    { $Type: 'UI.DataField', Value: totalRewardPoints },
    { $Type: 'UI.DataField', Value: totalRedeemedRewardPoints }
  ]
};

annotate app_fidelidadeSrv.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerNumber' }
];

annotate app_fidelidadeSrv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate app_fidelidadeSrv.Customers with @UI.SelectionFields: [
  name
];

annotate app_fidelidadeSrv.Foods with @UI.HeaderInfo: { TypeName: 'Food', TypeNamePlural: 'Foods', Title: { Value: name } };
annotate app_fidelidadeSrv.Foods with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate app_fidelidadeSrv.Foods with @UI.Identification: [{ Value: name }];
annotate app_fidelidadeSrv.Foods with {
  description @title: 'Description';
  price @title: 'Price'
};

annotate app_fidelidadeSrv.Foods with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price }
];

annotate app_fidelidadeSrv.Foods with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price }
  ]
};

annotate app_fidelidadeSrv.Foods with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate app_fidelidadeSrv.Foods with @UI.SelectionFields: [
  name
];

annotate app_fidelidadeSrv.Purchases with @UI.HeaderInfo: { TypeName: 'Purchase', TypeNamePlural: 'Purchases' };
annotate app_fidelidadeSrv.Purchases with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPurchaseValue'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRewardPoints'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRedeemedRewardPoints'
      },
    ],
  }
};
annotate app_fidelidadeSrv.Purchases with {
  selectedFood @Common.ValueList: {
    CollectionPath: 'Foods',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: selectedFood_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
    ],
  }
};
annotate app_fidelidadeSrv.Purchases with {
  purchaseValue @title: 'Purchase Value';
  rewardPoints @title: 'Reward Points'
};

annotate app_fidelidadeSrv.Purchases with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: purchaseValue },
    { $Type: 'UI.DataField', Value: rewardPoints },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID },
    { $Type: 'UI.DataField', Label: 'Selected Food', Value: selectedFood_ID }
];

annotate app_fidelidadeSrv.Purchases with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: purchaseValue },
    { $Type: 'UI.DataField', Value: rewardPoints },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID },
    { $Type: 'UI.DataField', Label: 'Selected Food', Value: selectedFood_ID }
  ]
};

annotate app_fidelidadeSrv.Purchases with {
  customer @Common.Text: { $value: customer.name, ![@UI.TextArrangement]: #TextOnly };
  selectedFood @Common.Text: { $value: selectedFood.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate app_fidelidadeSrv.Purchases with {
  customer @Common.Label: 'Customer';
  selectedFood @Common.Label: 'Selected Food'
};

annotate app_fidelidadeSrv.Purchases with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate app_fidelidadeSrv.Purchases with @UI.SelectionFields: [
  customer_ID,
  selectedFood_ID
];

annotate app_fidelidadeSrv.Redemptions with @UI.HeaderInfo: { TypeName: 'Redemption', TypeNamePlural: 'Redemptions' };
annotate app_fidelidadeSrv.Redemptions with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPurchaseValue'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRewardPoints'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRedeemedRewardPoints'
      },
    ],
  }
};
annotate app_fidelidadeSrv.Redemptions with {
  redeemedAmount @title: 'Redeemed Amount'
};

annotate app_fidelidadeSrv.Redemptions with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: redeemedAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate app_fidelidadeSrv.Redemptions with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: redeemedAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate app_fidelidadeSrv.Redemptions with {
  customer @Common.Text: { $value: customer.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate app_fidelidadeSrv.Redemptions with {
  customer @Common.Label: 'Customer'
};

annotate app_fidelidadeSrv.Redemptions with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate app_fidelidadeSrv.Redemptions with @UI.SelectionFields: [
  customer_ID
];

