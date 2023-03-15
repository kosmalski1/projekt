<?php
require_once('./../src/config.php');

use Steampixel\Route;

Route::add('/', function () {
    global $twig;
    $postArray = Post::getPage();
    $twigData = array("postArray" => $postArray, "pageTitle" => "strona główna");
    $twig->display("index.html.twig", $twigData);
});

Route::add('/upload', function () {
    //strona z formularzem do wgrywania obrazków
    global $twig;

    $twig->display("upload.html.twig");
});
Route::add('/upload', function () {
    //wywoła się tylko po otrzymaniu danych metodą post na ten url
    // (po wypełnieniu formularza)
    global $twig;
    if (isset($_POST['submit'])) {
        Post::upload($_FILES['uploadedFile']['tmp_name']);
    }
    header("Location: http://localhost/projekt/projekt/pub/");
    $twig->display("index.html.twig");
}, 'post');
Route::run('/projekt/projekt/pub');
