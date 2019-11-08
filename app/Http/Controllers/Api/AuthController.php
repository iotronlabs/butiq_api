<?php

namespace App\Http\Controllers\Api;

use App\User;
use Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Laravel\Socialite\Facades\Socialite;
use Laravel\Passport\HasApiTokens;

class AuthController extends Controller
{
    use HasApiTokens;
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
            return "Invalid";

        }

        $accessToken = auth()->user()->createToken("authToken")->accessToken;

        return response([
                        'data' => auth()->user(),
                        'meta' => [
                            'token' => $accessToken
                        ] ] , 200);


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


     public function action()
    {
        return response()->json([
            'data' =>auth('api')->user(),
        ]);

    }

    public function out()
    {

            auth('api')->user()->token()->revoke();

            return response()->json([
                'success' => true,
            ]);

    }
}
