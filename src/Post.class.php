<?php

use Post as GlobalPost;

class Post {
    private int $id;
    private string $filename;
    private string $timestamp;
    private string $namememe;
    private string $authorId;
    private string $authorName;
    function __construct(int $i , string $f, string $t, string $n , int $authorId)
    {
        $this->id = $i;
        $this->filename = $f;
        $this->timestamp= $t;
        $this->namememe= $n;
        $this->authorId = $authorId;
        //pobierz z bazy danych imię / login autora posta
        global $db;
        $this->authorName = User::getNameById($this->authorId);
    }
    public function getFilename() : string{
        return $this->filename;
    }
    public function getTimestamp() : string{
        return $this->timestamp;
    }
    public function getMemeName() : string{
        return $this->namememe;
    }
    public function getAuthorName() : string {
        return $this->authorName;
    }
static function getLast():Post{
    global $db;
    $query = $db->prepare("SELECT * FROM post ORDER BY timestamp DESC LIMIT 1");
    $query ->execute();
    $result = $query->get_result();
    $row = $result->fetch_assoc();
    $p = new Post ($row['id'], $row['filename'], $row['timestamp'], $row['namememe'], $row['userId']);
    return $p;
}

static function getPage (int $pageNumber= 1 , int $postPerPage= 10):array{
    global $db;
    $query = $db->prepare("SELECT * FROM post ORDER BY timestamp DESC LIMIT ? OFFSET ?");
    $offset = ($pageNumber-1)*$postPerPage;
    $query-> bind_param('ii', $postPerPage , $offset);
    $query-> execute();
    $result = $query->get_result();
    $postsArray = array();
    while($row = $result->fetch_assoc()){
        $post = new Post ($row['id'], $row['filename'], $row['timestamp'] , $row['namememe'], $row['userId']);
        array_push($postsArray, $post);
    }
    return $postsArray;
}


    static function upload(string $tempFileName) {
        //deklarujemy folder do którego będą zaczytywane obrazy
        $targetDir = "img/";
        //sprawdź czy mamy do czynienia z obrazem
        $imgInfo = getimagesize($tempFileName);
        //jeżeli $imgInfo nie jest tablicą to nie jest to obraz
        if(!is_array($imgInfo)) {
            die("BŁĄD: Przekazany plik nie jest obrazem!");
        }
        //generujemy losową liczbę w formie
        //5 losowych cyfr + znacznik czasu z dokładnością do ms
        $randomNumber = rand(10000, 99999) . hrtime(true);
        //wygeneruj hash - nową nazwę pliku
        $hash = hash("sha256", $randomNumber);
        //tworzymy docelowy url pliku graficznego na serwerze
        $newFileName = $targetDir . $hash . ".webp";
        //sprawdź czy plik przypadkiem już nie istnieje
        if(file_exists($newFileName)) {
            die("BŁĄD: Podany plik już istnieje!");
        }
        //zaczytujemy cały obraz z folderu tymczasowego do stringa
        $imageString = file_get_contents($tempFileName);
        //generujemy obraz jako obiekt klasy GDImage
        //@ przed nazwa funkcji powoduje zignorowanie ostrzeżeń
        $gdImage = @imagecreatefromstring($imageString);
        //zapisujemy w formacie webp
        imagewebp($gdImage, $newFileName);


//użyj globalnego połączenia
global $db;
//stwórz kwerendę
$query = $db->prepare("INSERT INTO post VALUES(NULL, ?, ? , ? , ?)");
//przygotuj znacznik czasu dla bazy danych
$dbTimestamp = date("Y-m-d H:i:s");
$dbnamememe = $_POST['textmem'];
//zapisz dane do bazy
$query->bind_param("sssi", $dbTimestamp, $newFileName, $dbnamememe,  $userId);
if(!$query->execute())
    die("Błąd zapisu do bazy danych");
    }
}
