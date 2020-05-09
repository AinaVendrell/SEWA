<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri = "http://java.sun.com/jsp/jstl/core"
prefix = "c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="parsley/parsley.min.js"></script>
    <!--  <script src="parsley/i18n/ca.js"></script> -->
    <title>Registrarse - NOM</title>
    <link rel="stylesheet" type="text/css" href="css/estil.css" />
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />
	<link rel="stylesheet" type="text/css" href="css/main.css">
  </head>

  <body>
    <ul class="server-errors-list">
      <c:if test="${model.error[0]}">
        <li>Entered user name has been already registered</li>
      </c:if>
    </ul>
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<!-- Include Date Range Picker -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
	<script src="parsley/parsley.js"></script>
	<script type="text/javascript">
		//has uppercase
		window.Parsley
				.addValidator(
						'uppercase',
						{
							requirementType : 'number',
							validateString : function(value, requirement) {
								var uppercases = value.match(/[A-Z]/g) || [];
								return uppercases.length >= requirement;
							},
							messages : {
								en : 'Your password must contain at least (%s) uppercase letter.'
							}
						});

		//has lowercase
		window.Parsley
				.addValidator(
						'lowercase',
						{
							requirementType : 'number',
							validateString : function(value, requirement) {
								var lowecases = value.match(/[a-z]/g) || [];
								return lowecases.length >= requirement;
							},
							messages : {
								en : 'Your password must contain at least (%s) lowercase letter.'
							}
						});

		//has number
		window.Parsley.addValidator('number', {
			requirementType : 'number',
			validateString : function(value, requirement) {
				var numbers = value.match(/[0-9]/g) || [];
				return numbers.length >= requirement;
			},
			messages : {
				en : 'Your password must contain at least (%s) number.'
			}
		});

		//has number
		window.Parsley.addValidator('nowhitespace', {
			requirementType : 'number',
			validateString : function(value) {
				var numbers = value.match(/\s/g) || [];
				return numbers.length == 0;
			},
			messages : {
				en : 'Your password must not contain white spaces.'
			}
		});

		/* add validation for minimum age */
		window.Parsley
				.addValidator(
						"minimumage",
						{
							validateString : function(value, requirements) {
								// get validation requirments
								var reqs = value.split("/"), day = reqs[0], month = reqs[1], year = reqs[2];

								// check if date is a valid
								var birthday = new Date(year + "-" + month
										+ "-" + day);

								// Calculate birtday and check if age is greater than 18
								var today = new Date();

								var age = today.getFullYear()
										- birthday.getFullYear();
								var m = today.getMonth() - birthday.getMonth();
								if (m < 0
										|| (m === 0 && today.getDate() < birthday
												.getDate())) {
									age--;
								}

								return age >= requirements;
							}
						});
	</script>
	<script>
		$(document).ready(
				function() {
					var date_input = $('input[name="date"]'); //our date input has the name "date"
					var container = $('.bootstrap-iso form').length > 0 ? $(
							'.bootstrap-iso form').parent() : "body";
					date_input.datepicker({
						format : 'dd/mm/yyyy',
						container : container,
						todayHighlight : true,
						autoclose : true,
					}).on('changeDate', function(e) {
						$(this).parsley().validate();
					})
				})
	</script>
	<script>
		$(document).ready(function() {
			$('form').parsley();
		});
	</script>
	
	<div class="description">
		<h1>Crea una cuenta de NOM</h1>
		<p>Rellena todos los campos para registrarte</p>
		<hr />
	</div>

    <form class="mx-sm-5" data-parsley-trigger="keyup" data-parsley-validate action="FormController">
    <div class="form-row">
    	<div class="form-group col-auto">
 			<label class="sr-only" for="name"> Nombre:</label>
		      <input
		        type="text"
		        class="form-control"
		        id="name"
		        name="name"
		        placeholder="Nombre"
		        value="${model.name}"
		        pattern="[A-Za-z]+"
		        required/>
        </div>
        <div class="form-group col-auto">
	     	<label class="sr-only" for="surname">Apellidos:</label>
	      	<input
	        type="text"
	        class="form-control"
	        id="surname"
	        name="surname"
	        placeholder="Apellidos"
	        pattern="[A-Za-z]+" 
	        value="${model.surname}"
	        required/>
       </div>
    </div>
	  <div class="form-row mb-4">
			<div class="col-auto">
      			<label class="control-label" for="birthday">Fecha de nacimiento:</label>
			      <input
			      	class="form-control"
			        type="text"
			        id="birthday"
			        name="birthday"
			        placeholder="Birthday"
			        data-parsley-pattern="^[0-9]{2}/[0-9]{2}/[0-9]{4}$"
					data-parsley-pattern-message="Invalid Date."
					data-date-format="DD/MM/YYYY" data-parsley-minimumage="13"
					data-parsley-minimumage-message="Minimum age is 13"
					data-parsley-validdate=""
			        value="${model.birthday}"
			        required/>
			</div>
			<div class="col-auto">
     			 <label for="gender">Genero:</label>
     			 <select id="gender"
					class="form-control" required value="${model.gender}">
					<option></option>
					<option value="hombre">Hombre</option>
					<option value="mujer">Mujer</option>
					<option value="otro">Otro</option>
					<option value="nodecir">Prefiero no decirlo</option>
				</select>
       		</div>
       	</div>
      <div class="form-row">
		<div class="col-auto"> 	
		      <label for="userName" class="sr-only"> Nombre de Usuario</label>
		      	<div class="input-group mb-3">
							<div class="input-group-prepend">
								<div class="input-group-text">@</div>
							</div>
						      <input
						        type="text"
						        class="form-control"
						        id="userName"
						        name="userName"
						        placeholder="Nombre de Usuario"
						        value="${model.userName}"
						        data-parsley-type="alphanum"
						        required
						      />
				</div>
			</div>
		</div>
      
    
      <div class ="form-row mb-4">
     	 <div class ="col-md-4">
      		<label for="email" class="sr-only"> Email: </label>
			      <br />
			      <input
			        type="email"
			        class="form-control"
			        id="email"
			        name="email"
			        placeholder="name@example.com"
			        value="${model.email}"
			        required
			        data-parsley-type="email"
			      />
			</div>
		</div>
      
      
      <div class="form-row mb-4">
      	 <div class="col-md-3">
      		<label for="pwd1">Contraseña:</label>
		      <input
		        type="password"
		        id="pwd1"
		        class="form-control"
		        aria-describedby="passwordHelpBlock" required
				data-parsley-minlength="8" data-parsley-maxlength="20"
				data-parsley-uppercase="1" data-parsley-lowercase="1"
				data-parsley-number="1" data-parsley-nowhitespace
		        name="pwd1"
		        placeholder="Contraseña"
		        value="${model.pwd1}"
		        required
		        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"/>
		      <small
					id="passwordHelpBlock" class="form-text text-muted"> Your
					password must be 8-20 characters long, contain lowercase and
					capital letters and numbers, and must not contain spaces, special
					characters, or emoji. </small>
		    </div>
		    
		     <div class="col-md-3">
		    	<label for="pwd2"> Confirmar Contraseña: </label>
		      <input
		        type="password"
		        id="pwd2"
		        name="pwd2"
		        class="form-control"
		        placeholder="Confirm Password"
		        value="${model.pwd2}"
		        required
		        aria-describedby="passwordHelpBlock"
		        data-parsley-equalto="#pwd1"
		      />
 			</div>
      	</div>
      	<div class="form-row mb-4">
			<div class="col-auto">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="termCheck"
						required> <label class="form-check-label" for="termCheck">
						He leido y acepto los <a href="PoliticaDatos.html" target="popup"
						onclick="window.open('PoliticaDatos.html','popup','width=600,height=600'); return false;">términos
							de uso</a>
					</label>
				</div>
			</div>
		</div>
      <div class="form-row mb-4">
			<div class="g-recaptcha"
				data-sitekey="6Ld-avMUAAAAABKyzNxOhNTl063Xj0hWjFh8idTo" ></div>
	  </div>
      <button>Submit</button>
    </form>
  </body>
</html>
