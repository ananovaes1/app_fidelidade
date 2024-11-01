sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'appfidelidade/clientes/test/integration/FirstJourney',
		'appfidelidade/clientes/test/integration/pages/CustomersList',
		'appfidelidade/clientes/test/integration/pages/CustomersObjectPage'
    ],
    function(JourneyRunner, opaJourney, CustomersList, CustomersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('appfidelidade/clientes') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCustomersList: CustomersList,
					onTheCustomersObjectPage: CustomersObjectPage
                }
            },
            opaJourney.run
        );
    }
);