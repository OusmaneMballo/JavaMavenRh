<%--
  Created by Ousmane MBALLO.
  User: mballoS
  Date: 19/07/2020
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<%--    <script src="${pageContext.request.contextPath}/js/medecin.js"></script>--%>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <title>Admin | Home</title>
</head>
<body>
<script type="text/javascript">
    function showform() {
        document.getElementById('frm').hidden=false;
    }
    function hiddenform() {
        document.getElementById('frm').hidden=true;
    }
</script>
<div class="container">
    <div class="row">
        <div class="col-md-12"><br/><br/>
            <button type="button" class="btn btn-primary" onclick="showform()">Nouveau Medecin</button>
            <form method="post" action="${pageContext.request.contextPath}/medecin" id="frm" hidden>
                <div class="form-group">
                    <label for="prenom_nom">Prenom&Nom</label>
                    <input type="text" name="prenom_nom" class="form-control" id="prenom_nom" placeholder="Saisissez votre prenom & nom ici"/>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="dateNaiss">Date de naissance</label>
                        <input type="date" name="dateNaiss" class="form-control" id="dateNaiss"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="telephone">Telephone</label>
                        <input type="text" name="telephone" class="form-control" id="telephone"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="adresse">Adress</label>
                    <input type="text" name="adresse" class="form-control" id="adresse" placeholder="Votre adresse..."/>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="email">Email</label>
                        <input type="email" name="email" class="form-control" id="email" placeholder="xxxx@yyy.zzz"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="Mot de passe"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="service">Service</label>
                        <select id="service" name="service" class="form-control" required>
                            <option value="0" selected>Choose...</option>
                            <c:forEach items="${services}" var="service">
                                <option value="${service.id}">${service.libelle}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="specialite">Specialite</label>
                        <select id="specialite" name="specialite" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Enregistrer</button>
                <button type="submit" class="btn btn-danger" onclick="hiddenform()">Annuler</button>
                <input type="hidden" name="action" value="add">
            </form>
            <br/>
            <h4>Liste des medecins</h4>
            <%--<div class="table-responsive">
                <table id="mytable" class="table table-bordred table-striped">
                    <thead>
                        <th><input type="checkbox" id="checkall" /></th>
                        <th>Prenom & Nom</th>
                        <th>Date Naiss</th>
                        <th>Telephone</th>
                        <th>Address</th>
                        <th>Email</th>
                        <th>Service</th>
                        <th>Specialite</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${medecins}" var="medecin">
                           <tr>
                               <td>
                                   <input type="checkbox" class="checkthis" />
                               </td>
                                <td>${medecin.prenom_nom}</td>
                                <td>${medecin.datenaissance}</td>
                                <td>${medecin.telephone}</td>
                                <td>${medecin.adresse}</td>
                                <td>${medecin.email}</td>
                                <td>${medecin.service.libelle}</td>
                                <td>
                                    <button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
                                        <span class="glyphicon glyphicon-eye-open"></span>
                                    </button>
                                </td>
                                <td>
                                    <p data-placement="top" data-toggle="tooltip" title="Edit">
                                        <button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
                                            <span class="glyphicon glyphicon-pencil"></span>
                                        </button>
                                    </p>
                                </td>
                                <td>
                                    <p data-placement="top" data-toggle="tooltip" title="Delete">
                                        <button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </button>
                                    </p>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="clearfix"></div>
                <ul class="pagination pull-right">
                    <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
                </ul>

            </div>--%>
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">Prenom & Nom</th>
                    <th scope="col">Date Naiss</th>
                    <th scope="col">Telephone</th>
                    <th scope="col">Address</th>
                    <th scope="col">Email</th>
                    <th scope="col">Service</th>
                    <th scope="col">Specialite</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${medecins}" var="medecin">
                    <tr>
                        <td>${medecin.prenom_nom}</td>
                        <td>${medecin.datenaissance}</td>
                        <td>${medecin.telephone}</td>
                        <td>${medecin.adresse}</td>
                        <td>${medecin.email}</td>
                        <td>${medecin.service.libelle}</td>
                        <td>
                            <button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >
                                <span class="glyphicon glyphicon-eye-open"></span>
                            </button>
                        </td>
                        <td>
                            <button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </button>
                        </td>
                        <td>
                            <button class="btn btn-danger btn-xs">
                                <span class="glyphicon glyphicon-trash"></span>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>


<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="HeadingEdit">Edit Your Detail</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input class="form-control " type="text" placeholder="Mohsin">
                </div>
                <div class="form-group">

                    <input class="form-control " type="text" placeholder="Irshad">
                </div>
                <div class="form-group">
                    <textarea rows="2" class="form-control" placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>


                </div>
            </div>
            <div class="modal-footer ">
                <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>



<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
            </div>
            <div class="modal-body">

                <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>

            </div>
            <div class="modal-footer ">
                <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Recipient:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Message:</label>
                        <textarea class="form-control" id="message-text"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Send message</button>
            </div>
        </div>
    </div>
</div>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">--%>
<script type="text/javascript">
    $(document).ready(function () {
        $("#service").change(function () {
            $.ajax({
                url:'/Rh/medecin',
                type:'GET',
                dataType: 'json',
                data:{
                        action:'findByIdService',
                        idSpecialite:$("#service").val()
                        },
                success:function (data) {
                    console.log(data);
                    var options='';
                    $("#specialite").children().remove();
                    data.forEach(e=>{
                        options+="<option value='"+e.id+"'>"+e.libelle+"</option>";
                    })
                            $("#specialite").append(options);
                },
                error:function (err) {

                }
            })

        })

    })
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</body>
</html>
