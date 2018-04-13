<?php

use Slim\Http\Request;
use Slim\Http\Response;

// Routes

$app->get('/compa', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'compa.phtml', $args);
});

$app->get('/preguntas', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'preguntas.phtml', $args);
});
