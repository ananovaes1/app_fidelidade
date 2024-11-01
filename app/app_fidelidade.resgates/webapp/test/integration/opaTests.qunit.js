sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'appfidelidade/resgates/test/integration/FirstJourney',
		'appfidelidade/resgates/test/integration/pages/RedemptionsList',
		'appfidelidade/resgates/test/integration/pages/RedemptionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, RedemptionsList, RedemptionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('appfidelidade/resgates') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRedemptionsList: RedemptionsList,
					onTheRedemptionsObjectPage: RedemptionsObjectPage
                }
            },
            opaJourney.run
        );
    }
);