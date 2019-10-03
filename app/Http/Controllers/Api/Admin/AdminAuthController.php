<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AdminAuthController extends Controller
{
    public function register(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required',
            'email' => 'required|unique:admins',
            'contact' => 'required',
            'password' => 'required|confirmed',
        ]);

        $validatedData['password'] = bcrypt($request->password);


        $user = Admin::create($validatedData);

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

        if(!auth('admin')->attempt($loginData))
        {
            return response(['message' => 'Invalid credentials']);
        }

         $accessToken = auth('admin')->user()->createToken('authToken')->accessToken;

         return response()->json([
            'success' => true,
            'user' => auth('admin')->user(),
            'access_token' => $accessToken,
         ]);

    }

    public function mepoint()
    {
        return response()->json([
            'data' =>auth('admin-api')->user(),      
        ]);
     
    }

    public function out()
    {
       
            auth('admin-api')->user()->token()->revoke();

            return response()->json([
                'success' => true,
            ]);
  
    }

}
