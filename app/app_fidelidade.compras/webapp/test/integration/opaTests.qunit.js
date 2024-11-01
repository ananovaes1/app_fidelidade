sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'appfidelidade/compras/test/integration/FirstJourney',
		'appfidelidade/compras/test/integration/pages/PurchasesList',
		'appfidelidade/compras/test/integration/pages/PurchasesObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchasesList, PurchasesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('appfidelidade/compras') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchasesList: PurchasesList,
					onThePurchasesObjectPage: PurchasesObjectPage
                }
            },
            opaJourney.run
        );
    }
);