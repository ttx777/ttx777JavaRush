var app = angular.module('demoApp', ['angularUtils.directives.dirPagination']);

app.service('CRUDService', ['$http', function($http) {

    this.getAllNotes = function getAllNotes() {
        return $http({
            method : 'GET',
            url : 'ta/notes'
        });
    }

    this.getNote = function getNote(noteId) {
        return $http({
            method: 'GET',
            url: 'ta/note?id=' + noteId
        });
    }

    this.save = function (Note) {
        var request = $http({
            method: 'post',
            url: '/ta/savenote/',
            data:Note
        });
        return request;
    }

    this.delete = function (idNote) {
        var deleterecord= $http({
            method: 'delete',
            url: "/ta/delnote?id=" + idNote
        });
        return deleterecord;
    }

    this.update = function (Note) {
        var updaterequest = $http({
            method: 'post',
            url: "/ta/savenote",
            data:Note
        });
        return updaterequest;
    }

}]);

app.controller('NotesController',  function($scope, CRUDService){
    $scope.notes = []; //declare an empty array

    loadNotes();

    function loadNotes() {
        var records = CRUDService.getAllNotes();
        records
            .then(function (response) {
                console.log("success");
                $scope.notes = response.data;
                console.log($scope.notes);
            }, function (error) {

            });
    }

    $scope.sort = function(keyname){
        $scope.sortKey = keyname;   //set the sortKey to the param passed
        $scope.reverse = !$scope.reverse; //if true make it false and vice versa
    };

    $scope.getN = function (noteId) {
        var singlerecord = CRUDService.getNote(noteId);
        singlerecord.then(function (d) {
                var record = d.data;
                console.log(record);
                $scope.updId=record.id;
                $scope.updTitle=record.title;
                $scope.updDesc=record.description;
                $scope.updDate=record.noteDate;
                $scope.isDone=record.done;
                $scope.updDate = new Date($scope.updDate);
                console.log('record id='+$scope.updId);
            },
            function(){
                alert("dfd");
            });
    };

    $scope.save = function () {
        //debugger;
        var Note = {
            title: $scope.NTitle,
            description: $scope.NDesc,
            noteDate: $scope.NDate,
            done: $scope.isDone
        };
        
        console.log(Note);
        var saverecords = CRUDService.save(Note);
        saverecords.then(function (d) {
                //$scope.EmpNo = d.data.EmpNo;
                loadNotes();
            },
            function(){

            });
    }


    $scope.deleteNote = function (updId) {
        var deleterecord = CRUDService.delete($scope.updId);
        deleterecord.then(function (d) {
            /*var Employee = {
                EmpNo: '',
                EmpName: '',
                Salary: '',
                DeptName: '',
                Designation: ''
            };*/
            console.log("success delete record");
            loadNotes();
        });
    }

    $scope.update = function () {
        var Note = {
            id: $scope.updId,
            title: $scope.updTitle,
            description: $scope.updDesc,
            noteDate: $scope.updDate,
            done: $scope.isDone
        };
        //debugger;
        var updaterecords = CRUDService.update(Note);
        updaterecords.then(function (d) {
                loadNotes();
                console.log("Record updated successfully");
            },
            function () {

            });
    }

});

