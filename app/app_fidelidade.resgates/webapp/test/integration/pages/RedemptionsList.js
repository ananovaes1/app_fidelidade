sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'appfidelidade.resgates',
            componentId: 'RedemptionsList',
            contextPath: '/Redemptions'
        },
        CustomPageDefinitions
    );
});