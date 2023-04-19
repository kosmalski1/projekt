<?php
class rating{
private int $id;
private int $plus;
private int $user_id;
public function __construct( int $id , int $plus , int $user_id ){
    $this->id = $id;
    $this->plus = $plus;
    $this->user_id = $user_id;

}
    
}


?>