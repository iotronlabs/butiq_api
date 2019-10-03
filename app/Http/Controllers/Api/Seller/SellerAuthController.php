<?php

namespace App\Http\Controllers\Api\Seller;

use App\Models\Seller;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SellerAuthController extends Controller
{
    public function register(Request $request)
    {
        
        $validatedData = $request->validate([
            'name' => 'required',
            'email' => 'required|unique:sellers',
            'contact' => 'required',
            'location_pin' => 'required|min:6|max:6',
            'password' => 'required|confirmed',
        ]);

        $validatedData['password'] = bcrypt($request->password);


        $user = Seller::create($validatedData);

        $accessToken = $user->createToken("authToken")->accessToken; 

        return response()->json([
            'success' => true,
            'user' => $user,
            'accessToken' => $accessToken], 200);
  }

  public function login(Request $request)
    {

        $loginData = $request->validate([

            'email' => 'email|required',
            'password' => 'required',

        ]);

        if(!auth('seller')->attempt($loginData))
        {
            return response(['message' => 'Invalid credentials']);
        }

         $accessToken = auth('seller')->user()->createToken('authToken')->accessToken;

         return response()->json([
            'success' => true,
            'user' => auth('seller')->user(),
            'access_token' => $accessToken,
         ]);

    }

    public function mepoint()
    {
        return response()->json([
            'data' =>auth('seller-api')->user(),      
        ]);
     
    }

    public function out()
    {
       
            auth('seller-api')->user()->token()->revoke();

            return response()->json([
                'success' => true,
            ]);
  
    }
}
