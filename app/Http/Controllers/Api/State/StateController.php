<?php

namespace App\Http\Controllers\Api\State;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class StateController extends Controller
{
    public function index()
    {
        return StateResource::collection(State::get());
    }
}
