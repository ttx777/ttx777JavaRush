<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="demoApp">
  <head>
    <title>Angular Demo App</title>
    <%--<link rel="stylesheet" type="text/css" href="../../resources/app/angular/bootstrap.css"/>--%>
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../../resources/app/css/style.css"/>
    <%-- <script src="../../resources/app/angular/angular.js"></script> --%>
    <script src="webjars/angularjs/1.6.8/angular.js"></script>
    <script src="webjars/angularjs/1.6.8/"></script>
    <script src="webjars/angular-utils-pagination/0.11.1/dirPagination.js"></script>

    <script src="webjars/angular-bootstrap/2.5.0/ui-bootstrap.min.js"></script>
    <script src="webjars/jquery/3.3.1/jquery.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <script src="../../resources/app/controller/notes_controller.js"></script>
  </head>
  <body>

  <div role="main" class="container theme-showcase">
    <div class="" style="margin-top:18px;">
      <div class="col-lg-8">
        <div class="page-header">
          <h2 id="tables">Notes-list</h2>
        </div>
        <div class="bs-component" ng-controller="NotesController">

          <form class="form-inline">
            <div class="form-group">
              <label>Фильтр: </label>
              <input type="text" ng-model="search" class="form-control" size="35"
                     placeholder="Фильтр по любому параметру">
            </div>
          </form>

          <%-- ADD FUNC --%>

          <div class="panel-body">
            <button type="button" class="btn btn-info" data-target="#AddNew" data-toggle="modal">Добавить заметку</button><br />

            <div class="modal" id="AddNew" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="text-info">Добавить новую заметку</h3>
                  </div>
                  <div class="modal-body">

                    <form class="form-horizontal" name="AddNewForm">
                      <div class="form-group">

                        <input class="form-control" readonly="readonly" name="EmpNo" ng-model="EmpNo" type="hidden" placeholder="Employee Number" required />
                      </div>
                      <div class="form-group">
                        <label class="text-info"> Заголовок</label>
                        <input class="form-control" name="NTitle" ng-model="NTitle" type="text" placeholder="Заголовок" required />
                      </div>
                      <div class="form-group">
                        <label class="text-info"> Описание</label>
                        <input class="form-control" name="NDesc" ng-model="NDesc" type="text" placeholder="описание аметки" required />
                      </div>
                      <div class="form-group">
                        <label class="text-info"> Дата</label>
                        <input class="form-control" name="NDate" ng-model="NDate" type="date" placeholder="дата создания" required />
                      </div>
                      <div class="form-group">
                        <label class="text-info"> Выполнена</label>
                        <input class="form-control" name="NDone" ng-model="isDone" type="checkbox" required />
                      </div>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnSave" data-dismiss="modal" ng-click="save()">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <%-- END ADD FUNC --%>

        <table class="table table-striped table-hover">

            <thead>
            <tr>
              <th ng-click="sort('id')">ID
                <span class="glyphicon sort-icon" ng-show="sortKey=='id'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
              </th>
              <th ng-click="sort('title')">Название заметки
                <span class="glyphicon sort-icon" ng-show="sortKey=='title'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
              </th>
              <th ng-click="sort('description')">Опсиание
                <span class="glyphicon sort-icon" ng-show="sortKey=='description'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
              </th>
              <th ng-click="sort('noteDate')">Дата
                <span class="glyphicon sort-icon" ng-show="sortKey=='noteDate'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
              </th>
              <th ng-click="sort('done')">Выполнена
                <span class="glyphicon sort-icon" ng-show="sortKey=='done'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
              </th>
              </tr>
            </tr>
            </thead>
            <tbody>
            <%--<tr ng-repeat="note in notes|orderBy:sortKey:reverse|filter:search"> --%>
            <tr dir-paginate="note in notes|orderBy:sortKey:reverse|filter:search|itemsPerPage:10">
              <td>{{note.id}}</td>
              <td>{{note.title}}</td>
              <td>{{note.description}}</td>
              <td>{{note.noteDate}}</td>
              <td>{{note.done}}</td>
              <td>
                <button type="button" class="btn btn-info" ng-click="getN(note.id)" data-toggle="modal"
                        data-target="#Update">Изменить</button>
                <button type="button" class="btn btn-danger" id="btnDelete" data-toggle="modal"
                        data-target="#deleteDialog" ng-click="getN(note.id)">Удалить</button>
              </td>

              </td>
            </tr>
            </tbody>
          </table>
          <dir-pagination-controls
                  max-size="10"
                  direction-links="true"
                  boundary-links="true" >
          </dir-pagination-controls>

          <div class="modal" role="dialog" id="deleteDialog">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h3 class="text-info">Действительно хочешь удалить заметку?</h3>
                </div>

                <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="deleteNote(updId)">Удалить</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                </div>
              </div>
            </div>
          </div>

          <div class="modal" id="Update" role="dialog">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h3 class="text-info">Обновить заметку</h3>
                </div>
                <div class="modal-body">

                  <form class="form-horizontal" name="UpdateEmployeeForm">
                    <div class="form-group">

                      <input class="form-control" readonly="readonly" name="EmpNo" ng-model="updId" type="hidden" placeholder="id note" required />
                    </div>
                    <div class="form-group">
                      <label class="text-info"> Заголовок заметки</label>
                      <input class="form-control" name="EmpName" ng-model="updTitle" type="text" placeholder="Заголовок заметки" required />
                    </div>
                    <div class="form-group">
                      <label class="text-info"> Описание заметки</label>
                      <input class="form-control" name="Salary" ng-model="updDesc" type="text" placeholder="Описание заметки" required />
                    </div>
                    <div class="form-group">
                      <label class="text-info"> Дата</label>
                      <input class="form-control" name="DeptName" ng-model="updDate" type="date" placeholder="Дата" required />
                    </div>
                    <div class="form-group">
                      <label class="text-info"> Выполнена</label>
                      <input class="form-control" name="DeptDone" ng-model="isDone" type="checkbox" required />
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-success" id="btnUpdate" data-dismiss="modal" ng-click="update()">Update</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>


  </div>

  </body>
</html>
