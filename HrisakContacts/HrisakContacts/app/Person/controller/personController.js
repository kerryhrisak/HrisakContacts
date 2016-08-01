'use strict';
app.controller('personController', function ($scope, $http, $window, personService) {

    var vm = this;

    vm.cityStates = [];

    vm.addPerson = {
        lastName: '',
        firstName: '',
        birthDate: '',
        cellPhone: '',
        emailAddress: '',
        street: '',
        city: '',
        state: '',
        zipCode: ''

    };

    vm.status = '';

    vm.getCityStateFromZip = function (zip) {
        if (zip.length > 4) {
            personService.getCityStateFromZip(zip)
            .then(function (result) {
                vm.addPerson.City = result.data[0].City;
                vm.addPerson.State = result.data[0].State;
            },
            function (error) {
                handleException(error);
            });
        }
    };

    vm.saveNewPerson = function (person) {

        personService.saveNewPerson(person)
        .then(function (result) {
            $window.location.href = 'http://localhost' + _baseUrl + '/';
        },
        function (error) {
            handleException(error);
        });
    };

    vm.deletePerson = function (personid) {
        personService.deletePerson(personid)
        .then(function (result) {
            vm.status = result.data;
        },
        function (error) {
            handleException(error);
        });
        $window.location.href = 'http://localhost' + _baseUrl + '/';
    };

    function handleException(error) {
        alert(error);
    }

});