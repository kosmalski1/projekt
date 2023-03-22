<?php
class User {
    private int $id;
    private string $email;
    private $password;
public function __construct(string $email, int $id){
    $this->email =$email;
    $this->id = $id;
}
public function getId() : int {
    return $this->id;
}
public function getName() : string {
return $this->email;
}
    //pobieranie nazwy użytkownika według jego id - potrzebne do wyświetlania autorów postów
    public static function getNameById(int $userId) : string {
        global $db;
        $query = $db->prepare("SELECT email FROM user WHERE id = ? LIMIT 1");
        $query->bind_param('i', $userId);
        $query->execute();
        $result = $query->get_result();
        $row = $result->fetch_assoc();
        return $row['email'];
    }
    public static function register(string $email , string $password){
    global $db;
    $query =  $db->prepare("INSERT INTO user VALUES (NULL, ? , ?)");
    $passwordhash = password_hash($password, PASSWORD_ARGON2I);
    $query->bind_param('ss', $email, $passwordhash);
    return $query->execute();
    
    }
    public static function login(string $email , string $password){
        global $db;
        $query = $db->prepare("SELECT * FROM user WHERE email = ? LIMIT 1");
        $query-> bind_param('s', $email);
        $query->execute();
        $result = $query->get_result();
        $row = $result->fetch_assoc();
        $passwordhash= $row['password'];
        if(password_verify($password, $passwordhash)){
            $u = new User($email, $row['id']);
            $_SESSION['user'] = $u;
        }
    }
}
?>