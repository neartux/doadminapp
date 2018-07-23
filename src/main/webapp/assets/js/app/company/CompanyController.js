(function (){
    var app = angular.module('Company', ['CompanyProvider', 'CommonDirectives']);

    app.controller('CompanyController', function($scope, CompanyService) {
        var ctrl = this;
        ctrl.companyTO = {};
        ctrl.companyList = { data: [] };
        ctrl.isCreateCompany = true;

        /**
         * Init company app
         *
         * @param contextPath aplication path
         */
        ctrl.init = function (contextPath) {
            // Asign path aplication
            CompanyService.contextPath = contextPath;
            // Find all companies of the system
            ctrl.findAllCompanies();
        };

        /**
         * Method to find all companies of the system
         */
        ctrl.findAllCompanies = function () {
            return CompanyService.findAllCompanies().then(function (res) {
                if(!res.data.error) {
                    ctrl.companyList.data = res.data.data;
                }
            });
        };

        /**
         * Method to display form to create a new company
         */
        ctrl.viewToCreateNewCompany = function() {
            ctrl.isCreateCompany = true;
            ctrl.companyTO = {};
            $("#companyDataForm").modal();
        };

        /**
         * Method to validate and save a new company or update
         *
         * @param isValidForm if generic form is valid
         */
        ctrl.validateCompany = function(isValidForm) {
            // If is valid form
            if(isValidForm) {
                // Create new company
                if(ctrl.isCreateCompany) {
                    ctrl.createCompany();
                }
                // Is update an existing company
                else {

                }
            }
        };

        /**
         * Method to create a company
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.createCompany = function() {
            return CompanyService.createCompany(ctrl.companyTO).then(function (res) {
                if(res.data.data.error) {
                    showNotification("error", "Error: " + res.data.data.message);
                } else {
                    showNotification("success", "La compania se ha creado");
                }
                $("#companyDataForm").modal("hide");
            });
        };

        /**
         * Method to display form to update a company
         * @param company
         */
        ctrl.viewToUpdateCompany = function(company) {
            ctrl.companyTO = angular.copy(company);
            $("#companyDataForm").modal();
        };
    });

})();
