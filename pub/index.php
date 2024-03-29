<?php
require_once('./../src/config.php');
session_start();
use Steampixel\Route;

Route::add('/', function () {
    global $twig;
    $postArray = Post::getPage();
    $twigData = array("postArray" => $postArray, "pageTitle" => "Strona główna",
);
//jeśli użytkownik jest zalogowany to przekaż go do twiga
if(isset($_SESSION['user']))
$twigData['user'] = $_SESSION['user'];
$twig->display("index.html.twig", $twigData);
});

Route::add('/upload', function () {
    //strona z formularzem do wgrywania obrazków
    global $twig;
    $twigData = array("pageTitle" => "Wgraj mema");
    //jeśli użytkownik jest zalogowany to przekaż go do twiga
    if(User::isAuth())
    {
        $twigData['user'] = $_SESSION['user'];
        $twig->display("upload.html.twig", $twigData);
    } else {
        http_response_code(403);
    }
});
Route::add('/upload', function() {
    //wywoła się tylko po otrzymaniu danych metodą post na ten url
    // (po wypełnieniu formularza)
    global $twig;
    if(isset($_POST['submit']))  {
        Post::upload($_FILES['uploadedFile']['tmp_name'], $_POST['namememe'], $_POST['userId']);
    }
    //TODO: zmienić na ścieżkę względną
    header("Location: http://localhost/projekt/projekt/pub");
}, 'post');
Route::add('/register', function() {
    global $twig;
    $twigData = array("pageTitle" => "Zarejestruj użytkownika");
    $twig->display("register.html.twig", $twigData);
});

Route::add('/register', function(){
    global $twig;
    if(isset($_POST['submit'])) {
        User::register($_POST['email'], $_POST['password']);
        header("Location: http://localhost/projekt/projekt/pub");
    }
}, 'post');
Route::add('/login', function() {
    global $twig;
    $twigData = array("pageTitle" => "zaloguj użytkownika");
    $twig->display("login.html.twig", $twigData);
});

Route::add('/login', function(){
    global $twig;
    if(isset($_POST['submit'])) {
        if(User::login($_POST['email'], $_POST['password'])) {
            //zalogowano poprawnie
            header("Location: http://localhost/projekt/projekt/pub");
        } else {
            //błąd logowania
            $twigData = array('pageTitle' => "Zaloguj użytkownika",
                                "message" => "Niepoprawny login lub hasło!");
            $twig->display("login.html.twig", $twigData);
        }
    }
    

}, 'post');
Route::add('/admin', function()  {
    global $twig;

    if(User::isAuth()) {
        $postArray = Post::getPage(1,100);
        $twigData = array("postArray" => $postArray);
        $twig->display("admin.html.twig", $twigData);
    } else {
        http_response_code(403);
    }
});
Route::add('/admin/remove/([0-9]*)', function($id) {
    if(Post::remove($id)) {
        //udało się usunąć
        header("Location: http://localhost/projekt/projekt/pub/admin/");
    } else {
        die("Nie udało się usunąć podanego obrazka");
    }
});
Route::add('/upvote/([0-9]*)', function($id) {
   ;
    if(isset($_SESSION['user'])) {
 Vote::upVote($id, $_SESSION['user']->getId());
        header("Location: http://localhost/projekt/projekt/pub/");

}
else {
    header("Location: http://localhost/projekt/projekt/pub/");

}
});
Route::add('/downvote/([0-9]*)', function($id) {
    if(isset($_SESSION['user'])) {
            Vote::downVote($id, $_SESSION['user']->getId());

            header("Location: http://localhost/projekt/projekt/pub/");

    }
    else {
        header("Location: http://localhost/projekt/projekt/pub/");

    }
});
Route::run('/projekt/projekt/pub');
