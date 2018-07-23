<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tiles:insertDefinition name="template-admin">
    <tiles:putAttribute name="body">

        <div class="content" data-ng-app="Patient" data-ng-controller="CompanyController as ctrl" data-ng-init="ctrl.init('${pageContext.request.contextPath}');">
            <div class="container">


                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Lista de Empresas </h4>
                            <ol class="breadcrumb p-0 m-0">
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li>
                                    <a href="#">Empresa </a>
                                </li>
                                <li class="active">
                                    Lista de Empresas
                                </li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">

                        <div class="panel panel-border panel-primary">
                            <div class="panel-heading">
                                <div class="col-sm-6 p-l-0">
                                    <h3 class="panel-title"></h3>
                                </div>
                                <div class="col-sm-6 text-right p-r-0">
                                    <button type="button" data-ng-click="ctrl.viewToCreateNewPatient();"
                                            class="btn btn-default btn-rounded w-md waves-effect btn-sm">
                                        <i class="mdi mdi-account-plus"></i> Nueva Empresa
                                    </button>
                                </div>
                            </div>
                            <div class="panel-body">



                            </div>
                        </div>

                    </div>
                </div>

            </div>


        </div>

    </tiles:putAttribute>

    <tiles:putAttribute name="scripts">
        <script src="${pageContext.request.contextPath}/assets/js/app/company/App.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/company/CompanyProvider.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/company/CompanyController.js?1.1"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/common/CommonDirectives.js"></script>
        <script>

            $(function () {
            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>