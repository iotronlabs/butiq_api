<?php

namespace App\Http\Controllers\Api;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Laravel\Socialite\Facades\Socialite;

class AuthController extends Controller
{
  public function register(Request $request)
  {
        $validatedData = $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required|confirmed',
        ]);

        $validatedData['password'] = bcrypt($request->password);


        $user = User::create($validatedData);

        $accessToken = $user->createToken("authToken")->accessToken; 

        return response(['user' => $user, 'accessToken' => $accessToken], 200);

  }

  public function login(Request $request)

  {
        $validatedData = $request->validate([
            
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if(!auth()->attempt($validatedData))
        {
            return "InValid";

        }

        $accessToken = auth()->user()->createToken("authToken")->accessToken;

        return response(['user' => auth()->user(), 'accessToken' => $accessToken], 200);

        
  }

    public function redirectToProvider($providers)
    {
        return Socialite::driver($providers)->stateless()->redirect();
    }

   
    public function handleProviderCallback($provider)
    {
        $user = Socialite::driver($provider)->stateless()->user();

         return response([$user->token,$user->name,$user->email]);
    }
}
