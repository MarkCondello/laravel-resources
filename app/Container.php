<?php

namespace App;
 
class Container 
{
    public $bindings;    

    public function bind($key, $value)
    {
        $this->bindings[$key] = $value;
    }

    public function resolve($key)
    {
        if(key_exists($key, $this->bindings)){
            return call_user_func($this->bindings[$key]);
        } 
        return "The $key is not found...";
    }
}