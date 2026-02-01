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
    }
  });
});