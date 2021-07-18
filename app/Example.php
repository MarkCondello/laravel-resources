<?php

namespace App;

class Example {

    // public $collaborator;
    // public function __construct(Collaborator $collaborator)
    // {
    //     $this->collaborator = $collaborator;
    // }
    public $foo;

    public function __construct($foo)
    {
        $this->foo = $foo;
    }
    public function go()
    {
        # code...
        return "GGF!";
    }
}