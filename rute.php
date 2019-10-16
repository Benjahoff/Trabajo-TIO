<?php
    require_once('Router.php');
    require_once('controllers/admin.controller.php');
    require_once('controllers/login.controller.php');
    require_once('controllers/alumnos.controller.php');

    define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');
    define("LOGIN", BASE_URL . 'login');
    define("HOME", BASE_URL . 'home');
    define("ADMIN", BASE_URL . 'administrador');

    $r = new Router();

    $r->addRoute("home", "GET", "AlumnosController", "showHome");
    $r->addRoute("login", "GET", "LoginController", "showLogin");
    $r->addRoute("verify", "POST", "LoginController", "verifyUser");
    $r->addRoute("logout", "GET", "LoginController", "logout");
    $r->addRoute("administrador", "GET", "AdminController", "adminFunctions");
    $r->addRoute("cargaralumno", "POST", "AdminController", "cargarAdmTabla");
    $r->addRoute("eliminarAlumno/:ID", "POST", "AdminController", "deleteStudent");
    $r->addRoute("formularioModificar/:ID", "POST", "AdminController", "modifyForm");
    $r->addRoute("modificarAlumno/:ID", "POST", "AdminController", "modifyStudent");
    $r->addRoute("agregarespecialidad", "POST", "AdminController", "addEspec");
    $r->addRoute("alumnoview/:ID", "GET", "AlumnosController", "showStudent");
    $r->addRoute("filtrar/:ID", "GET", "AlumnosController", "filtrarEsp");
    
    $r->setDefaultRoute("AlumnosController", "showHome");

    $r->route($_GET['action'], $_SERVER['REQUEST_METHOD']);