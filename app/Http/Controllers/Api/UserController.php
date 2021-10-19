<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Http\Resources\UserResource;
 
class UserController extends Controller
{
    public function list()
    {
        return UserResource::collection(
            User::paginate(3)
        );
    }
}
