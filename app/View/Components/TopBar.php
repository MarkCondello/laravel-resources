<?php

namespace App\View\Components;

use Illuminate\View\Component;

class TopBar extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */

    public $message = 'Waste no more time arguing what a good man should be, be one. - Marcus Aurelius';
    public $types = '';

    public function __construct($message, $types)
    {
        $this->message = $message;
        $this->types = $types;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|string
     */
    public function render()
    {
        return view('components.top-bar');
    }
}
