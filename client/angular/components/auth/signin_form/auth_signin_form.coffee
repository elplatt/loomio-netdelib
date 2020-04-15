AuthService   = require 'shared/services/auth_service'
EventBus      = require 'shared/services/event_bus'
LmoUrlService = require 'shared/services/lmo_url_service'

{ hardReload }    = require 'shared/helpers/window'
{ submitOnEnter } = require 'shared/helpers/keyboard'

angular.module('loomioApp').directive 'authSigninForm', ->
  scope: {user: '='}
  templateUrl: 'generated/components/auth/signin_form/auth_signin_form.html'
  controller: ['$scope', ($scope) ->
    $scope.vars = {}

    $scope.signIn = ->
      return
      EventBus.emit $scope, 'processing'
      $scope.user.name = $scope.vars.name if $scope.vars.name?
      AuthService.signIn($scope.user, hardReload).finally ->
        EventBus.emit $scope, 'doneProcessing'

    $scope.signInAndSetPassword = ->
      LmoUrlService.params('set_password', true)
      $scope.signIn()

    $scope.sendLoginLink = ->
      EventBus.emit $scope, 'processing'
      AuthService.sendLoginLink($scope.user).finally -> EventBus.emit $scope, 'doneProcessing'

    $scope.submit = ->
      alert('submitted')
      return
      if $scope.user.hasPassword or $scope.user.hasToken
        $scope.signIn()
      else
        $scope.sendLoginLink()

    submitOnEnter($scope, anyEnter: true)
    EventBus.emit $scope, 'focus'
  ]
