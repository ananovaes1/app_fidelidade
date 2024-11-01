using { app_fidelidade as my } from '../db/schema.cds';

@path: '/service/app_fidelidade'
@requires: 'authenticated-user'
service app_fidelidadeSrv {
  @odata.draft.enabled
  entity Customers as projection on my.Customers;
  @odata.draft.enabled
  entity Foods as projection on my.Foods;
  @odata.draft.enabled
  entity Purchases as projection on my.Purchases;
  @odata.draft.enabled
  entity Redemptions as projection on my.Redemptions;
}