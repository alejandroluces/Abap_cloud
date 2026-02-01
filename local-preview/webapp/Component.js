sap.ui.define([
  "sap/ui/core/UIComponent",
  "sap/ui/model/json/JSONModel",
  "sap/ui/model/BindingMode"
], function (UIComponent, JSONModel, BindingMode) {
  "use strict";

  return UIComponent.extend("preview.app.Component", {
    metadata: {
      manifest: "json"
    },

    init: function () {
      UIComponent.prototype.init.apply(this, arguments);

      var data = {
        Providers: [
          {
            ProviderID: "P0001",
            Name: "Proveedor Andes",
            Country: "CL",
            City: "Santiago",
            Street: "Av. Providencia 100",
            CreatedBy: "ALUCES",
            CreatedOn: "2026-01-24",
            BankKey: "001",
            BankAccount: "12345678",
            BankType: "CTA_CORRIENTE"
          },
          {
            ProviderID: "P0002",
            Name: "Proveedor Pacífico",
            Country: "CL",
            City: "Valparaíso",
            Street: "Cerro Alegre 55",
            CreatedBy: "ALUCES",
            CreatedOn: "2026-01-24",
            BankKey: "002",
            BankAccount: "87654321",
            BankType: "CTA_VISTA"
          },
          {
            ProviderID: "P0003",
            Name: "Proveedor Norte",
            Country: "PE",
            City: "Lima",
            Street: "Av. Miraflores 210",
            CreatedBy: "ALUCES",
            CreatedOn: "2026-01-24",
            BankKey: "003",
            BankAccount: "11223344",
            BankType: "CTA_CORRIENTE"
          }
        ]
      };

      var model = new JSONModel(data);
      model.setDefaultBindingMode(BindingMode.TwoWay);
      this.setModel(model);
    }
  });
});