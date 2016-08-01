'use strict';
app.service('personService', function ($http) {

    this.getCityStateFromZip = function (zip) {
        return $http.get(_baseUrl + '/api/PersonAPI/GetCityStateFromZip?zip=' + zip);
    };

    this.saveNewPerson = function (person) {
        return $http.post(_baseUrl + '/api/PersonAPI', person);
    };

    this.deletePerson = function (personID) {
        return $http.get(_baseUrl + '/api/PersonAPI/DeletePerson?personID=' + personID);
    };

});