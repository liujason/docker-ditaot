'use strict';

angular.module('nodeappApp')
  .config(function($stateProvider){
    $stateProvider
      .state('upload',{
        url:'/upload',
        templateUrl: 'app/upload/upload.html',
        controller: 'UploadCtrl'
      });
  });
