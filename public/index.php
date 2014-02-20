<?php

require_once __DIR__.'/../vendor/autoload.php';

use Symfony\Component\HttpFoundation\Response;

$app = new Silex\Application();

$app['debug'] = true;

$app->get('/', function() {
  $html = <<<END
<!doctype html>
<head>
  <meta charset="utf-8">
  <title>Silex Test</title>
</head>
<body>
  <h1>Silex Test</h1>
  <p>If you can see this, then I guess it works?</p>
</body>
</html>
END;
  return new Response($html);
});

$app->run();
