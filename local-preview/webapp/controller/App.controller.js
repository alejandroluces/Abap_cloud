sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/ui/model/Filter",
  "sap/ui/model/FilterOperator"
], function (Controller, Filter, FilterOperator) {
  "use strict";

  return Controller.extend("preview.app.controller.App", {
    onSearch: function (oEvent) {
      var sQuery = oEvent.getParameter("newValue");
      var oTable = this.byId("providersTable");
      var oBinding = oTable.getBinding("items");

      if (!sQuery) {
        oBinding.filter([]);
        return;
      }

      var aFilters = [
        new Filter("Name", FilterOperator.Contains, sQuery),
        new Filter("City", FilterOperator.Contains, sQuery)
      ];

      oBinding.filter(new Filter({ filters: aFilters, and: false }));
    },

    onOpenCreateDialog: function () {
      var oView = this.getView();
      var oDialog = oView.byId("createProviderDialog");
      
      // Limpiar campos
      oView.byId("inpId").setValue("");
      oView.byId("inpName").setValue("");
      oView.byId("inpCountry").setValue("");
      oView.byId("inpCity").setValue("");
      oView.byId("inpStreet").setValue("");
      oView.byId("inpBankType").setValue("");

      oDialog.open();
    },

    onCancelCreate: function () {
      this.getView().byId("createProviderDialog").close();
    },

    onSaveProvider: function () {
      var oView = this.getView();
      var sId = oView.byId("inpId").getValue();
      var sName = oView.byId("inpName").getValue();
      var sCountry = oView.byId("inpCountry").getValue();
      var sCity = oView.byId("inpCity").getValue();
      var sStreet = oView.byId("inpStreet").getValue();
      var sBankType = oView.byId("inpBankType").getValue();

      if (!sId || !sName) {
        sap.m.MessageToast.show("ID y Nombre son obligatorios");
        return;
      }

      var oModel = this.getView().getModel();
      var aProviders = oModel.getProperty("/Providers");

      // Crear nuevo objeto proveedor
      var oNewProvider = {
        ProviderID: sId,
        Name: sName,
        Country: sCountry,
        City: sCity,
        Street: sStreet,
        CreatedBy: "ALUCES", // Mock
        CreatedOn: new Date().toISOString().split('T')[0], // YYYY-MM-DD
        BankKey: "",
        BankAccount: "",
        BankType: sBankType
      };

      // Añadir al modelo
      aProviders.push(oNewProvider);
      oModel.setProperty("/Providers", aProviders);

      sap.m.MessageToast.show("Proveedor creado con éxito (local)");
      this.getView().byId("createProviderDialog").close();
    }
  });
});
