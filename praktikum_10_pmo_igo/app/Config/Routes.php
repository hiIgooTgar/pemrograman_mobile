<?php

use CodeIgniter\Router\RouteCollection;

/** @var RouteCollection $routes */
$routes->get('/', 'Home::index');
$routes->resource('pendaftaran');

// Routes Custom
// $routes->get('pendaftaran', 'Pendaftaran::index');
// $routes->get('pendaftaran/(.*)', 'Pendaftaran::show/$1');
// $routes->post('pendaftaran', 'Pendaftaran::create');
// $routes->put('pendaftaran/(.*)', 'Pendaftaran::update/$1');
// $routes->delete('pendaftaran/(.*)', 'Pendaftaran::delete/$1');