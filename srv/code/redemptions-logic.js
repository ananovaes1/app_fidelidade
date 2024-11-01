/**
 * 
 * @On(event = { "CREATE" }, entity = "app_fidelidadeSrv.Redemptions")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
    const data = request.data;

    if (!data.customer_ID || !data.redeemedAmount) {
        return;
    }

    const { Customers } = cds.entities;
    const customer = await SELECT.one.from(Customers).where({ ID: data.customer_ID });

    if (!customer) {
        return;
    }

    if (customer.totalRewardPoints < data.redeemedAmount) {
        request.reject(400, 'Not enough reward points');
        return;
    }

    const updatedTotalRewardPoints = customer.totalRewardPoints - data.redeemedAmount;
    const updatedTotalRedeemedRewardPoints = (customer.totalRedeemedRewardPoints || 0) + data.redeemedAmount;

    await cds.run(UPDATE(Customers).set({
        totalRewardPoints: updatedTotalRewardPoints,
        totalRedeemedRewardPoints: updatedTotalRedeemedRewardPoints
    }).where({ ID: data.customer_ID }));
};