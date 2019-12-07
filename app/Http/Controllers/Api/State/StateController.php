<?php

namespace App\Http\Controllers\Api\State;

use App\Models\State;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\StateResource;

class StateController extends Controller
{
    public function index()
    {
        return StateResource::collection(State::get());
    }
}
