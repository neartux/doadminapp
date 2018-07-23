(function () {
    var app = angular.module('CompanyProvider', []);

    app.factory('CompanyService', function ($http, $q) {
        var service = {};

        service.contextPath = '';

        service.findAllCompanies = function () {
            return $http.get(service.contextPath + '/company');
        };

        service.createCompany = function (companyTO) {
            return $http.post(service.contextPath + '/company/create', companyTO);
        };

        return service;

    });

})();