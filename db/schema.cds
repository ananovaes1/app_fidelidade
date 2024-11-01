namespace app_fidelidade;
using { cuid } from '@sap/cds/common';

@assert.unique: { name: [name] }
entity Customers : cuid {
  name: String(100) @mandatory;
  email: String(100);
  customerNumber: Integer;
  totalPurchaseValue: Integer;
  totalRewardPoints: Integer;
  totalRedeemedRewardPoints: Integer;
}

@assert.unique: { name: [name] }
entity Foods : cuid {
  name: String(100) @mandatory;
  description: String(500);
  price: Integer;
}

entity Purchases : cuid {
  purchaseValue: Integer;
  rewardPoints: Integer;
  customer: Association to Customers;
  selectedFood: Association to Foods;
}

entity Redemptions : cuid {
  redeemedAmount: Integer;
  customer: Association to Customers;
}

