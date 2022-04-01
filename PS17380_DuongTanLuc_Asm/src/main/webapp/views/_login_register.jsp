<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div id="loginModal" class="modal hide fade" tabindex="-1" role="dialog"
			aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" 
			aria-hidden="true">×</button>
		<h3 id="loginModalLabel">
			<span class="light">Login</span> To SunshineShop
		</h3>
	</div>
	<div class="modal-body">
		<form method="post" action="<%=Common.url%>/sign-in">
			<div class="control-group">
				<label class="control-label hidden shown-ie8" for="inputEmail">Username</label>
				<div class="controls">
					<input type="text" class="input-block-level" id="inputEmail"
						name="username" placeholder="Username" required>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label hidden shown-ie8" for="inputPassword">Password</label>
				<div class="controls">
					<input type="password" class="input-block-level" name="password"
						id="inputPassword" placeholder="Password" required>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<label class="checkbox"> <input type="checkbox">
						Remember me
					</label>
				</div>
				<input type="hidden" name="uri"
					value="${requestScope['javax.servlet.forward.request_uri']}" />
				<input type="hidden" name="id"
					value="${id}" />
			</div>
			<button type="submit"
				class="btn btn-primary input-block-level bold higher">SIGN
				IN</button>
		</form>
		<p class="center-align push-down-0">
			<a data-toggle="modal" role="button" href="#forgotPassModal"
				data-dismiss="modal">Forgot your password?</a>
		</p>
	</div>
</div>

<div id="registerModal" class="modal hide fade" tabindex="-1"
	role="dialog" aria-labelledby="registerModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="registerModalLabel">
			<span class="light">Register</span> To SunshineShop
		</h3>
	</div>
	<div class="modal-body">
		<form  action="<%=Common.url%>/sign-up">
			<div class="control-group">
				<label class="control-label hidden shown-ie8"
					for="inputUsernameRegister" >Username</label>
				<div class="controls">
					<input type="text" class="input-block-level"
						id="inputUsernameRegister" placeholder="Username" name="username" required>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label hidden shown-ie8"
					for="inputEmailRegister">Email</label>
				<div class="controls">
					<input type="email" class="input-block-level"
						id="inputEmailRegister" placeholder="Email" name="email" required>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label hidden shown-ie8"
					for="inputPasswordRegister">Password</label>
				<div class="controls">
					<input type="password" class="input-block-level"
						id="inputPasswordRegister" placeholder="Password" name="password" required>
				</div>
			</div>
			<input type="hidden" name="uri"
					value="${requestScope['javax.servlet.forward.request_uri']}" />
				<input type="hidden" name="id"
					value="${id}" />
			<button type="submit"
				class="btn btn-danger input-block-level bold higher">
				REGISTER</button>
		</form>
		<p class="center-align push-down-0">
			<a data-toggle="modal" role="button" href="#loginModal"
				data-dismiss="modal">Already Registered?</a>
		</p>
	</div>
</div>

<div id="forgotPassModal" class="modal hide fade" tabindex="-1"
	role="dialog" aria-labelledby="forgotPassModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="forgotPassModalLabel">
			<span class="light">Forgot</span> your password?
		</h3>
	</div>
	<div class="modal-body">
		<form method="post" action="#">
			<div class="control-group">
				<label class="control-label hidden shown-ie8"
					for="inputUsernameRegister">Username</label>
				<div class="controls">
					<input type="text" class="input-block-level"
						id="inputUsernameRegister" placeholder="Username">
				</div>
			</div>
			<p class="center-align">OR</p>
			<div class="control-group">
				<label class="control-label hidden shown-ie8"
					for="inputEmailRegister">Email</label>
				<div class="controls">
					<input type="email" class="input-block-level"
						id="inputEmailRegister" placeholder="Email">
				</div>
			</div>
			<button type="submit"
				class="btn btn-primary input-block-level bold higher">SEND
				ME A NEW PASSWORD</button>
		</form>
	</div>
</div>
