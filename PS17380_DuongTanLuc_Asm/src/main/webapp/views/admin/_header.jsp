<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<header class="page-header">
    <div class="navbar">
        <ul class="nav navbar-nav navbar-right pull-right">
            <li class="divider"></li>
            <li class="hidden-xs dropdown">
                <a href="#" title="Account" id="account" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-user"></i>
                </a>
                <ul id="account-menu" class="dropdown-menu account" role="menu">
                    <li role="presentation" class="account-picture">
                        <img src="img/2.jpg" alt=""> Admin
                    </li>
                    <li role="presentation">
                        <a href="form_account.html" class="link">
                            <i class="fa fa-user"></i> Profile
                        </a>
                    </li>
                </ul>
            </li>
            <li class="visible-xs">
                <a href="#" class="btn-navbar" data-toggle="collapse" data-target=".sidebar" title="">
                    <i class="fa fa-bars"></i>
                </a>
            </li>
            <li class="hidden-xs"><a href="login.html"><i class="fa fa-sign-out"></i></a></li>
        </ul>
        <form id="search-form" class="navbar-form pull-right" role="search">
            <input type="search" class="form-control search-query" placeholder="Search...">
        </form>
        
    </div>
</header>