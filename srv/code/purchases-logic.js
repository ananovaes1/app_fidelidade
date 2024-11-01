/**
 * 
 * @On(event = { "CREATE" }, entity = "app_fidelidadeSrv.Purchases")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
    const { data } = request;
    const { customer_ID, purchaseValue } = data;

    // Ensure customer_ID and purchaseValue are defined
    if (!customer_ID || !purchaseValue) {
        return;
    }

    // Calculate reward points
    data.rewardPoints = Math.floor(purchaseValue / 10);

    const { Customers } = cds.entities;

    // Fetch the customer to update
    const customerToUpdate = await SELECT.one.from(Customers).where({ ID: customer_ID });

    if (customerToUpdate) {
        // Update total purchase value and total reward points for the customer
        customerToUpdate.totalPurchaseValue += purchaseValue;
        customerToUpdate.totalRewardPoints += data.rewardPoints;

        // Update the customer entity
        await UPDATE(Customers)
            .set({
                totalPurchaseValue: customerToUpdate.totalPurchaseValue,
                totalRewardPoints: customerToUpdate.totalRewardPoints
            })
            .where({ ID: customer_ID });
    }
}
